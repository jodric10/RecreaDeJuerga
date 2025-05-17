package com.recreadejuerga.recrea.servicios;

import com.recreadejuerga.recrea.dtos.equipo.*;
import com.recreadejuerga.recrea.entidades.Equipo;
import com.recreadejuerga.recrea.error.CamposDuplicadosException;
import com.recreadejuerga.recrea.error.EquipoNoEncontradoException;
import com.recreadejuerga.recrea.error.EquipoYaExistenteException;
import com.recreadejuerga.recrea.mappers.EquipoMapper;
import com.recreadejuerga.recrea.repositorios.EquipoRepositorio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service
public class EquipoServicio {

    @Autowired
    private EquipoRepositorio repo;

    public List<EquipoDTO> getEquipos() {
        List<Equipo> equipos = repo.findAll();
        if (equipos.isEmpty())
            throw new EquipoNoEncontradoException();
        return equipos.stream().map(EquipoMapper::toEquipoDTO).toList();
    }

    public EquipoDTO getEquipo(UUID id) {
        return repo.findById(id).map(EquipoMapper::toEquipoDTO).orElseThrow(() -> new EquipoNoEncontradoException(id));
    }

    public EquipoDTO insertarEquipo(EquipoFormularioDTO e) {
        if (repo.buscarPorNombre(e.getNombre()).isPresent())
            throw new EquipoYaExistenteException(e.getNombre());

        try {
            Equipo equipo= EquipoMapper.toEquipo(e);
            Equipo equipoGuardado = repo.save(equipo);
            return EquipoMapper.toEquipoDTO(equipoGuardado);

        } catch (DataIntegrityViolationException ex) {
            Throwable causa = ex.getRootCause();
            if (causa != null) {
                String mensaje = causa.getMessage();
                if (mensaje.contains("uk_equipo_nombre")) {
                    throw new CamposDuplicadosException(Map.of(
                            "nombre", "Ya existe un equipo con ese nombre (+" + e.getNombre() + ")"
                    ));
                }
            }
            throw new CamposDuplicadosException(Map.of(
                    "desconocido", "Violación de restricción de unicidad"
            ));
        }
    }

    public EquipoDTO modificarEquipo(EquipoFormularioDTO e, UUID id) {
        if (repo.existsById(id)) {
            try {
                repo.actualizarEquipo(id, e.getNombre(), e.getUrl_logo());
                return repo.findById(id).map(EquipoMapper::toEquipoDTO).orElseThrow(() -> new EquipoNoEncontradoException(id));
            } catch (DataIntegrityViolationException ex) {
                Throwable causa = ex.getRootCause();
                if (causa != null) {
                    String mensaje = causa.getMessage();
                    if (mensaje.contains("uk_equipo_nombre")) {
                        throw new CamposDuplicadosException(Map.of(
                                "nombre", "Ya existe un equipo con ese nombre(" + e.getNombre() + ")"
                        ));
                    }
                }
                throw new CamposDuplicadosException(Map.of(
                        "desconocido", "Violación de restricción de unicidad"
                ));
            }
        } else {
            throw new EquipoNoEncontradoException(id);
        }
    }

    public boolean eliminarEquipo(UUID id) {
        if (repo.existsById(id)) {
            repo.eliminarEquipo(id);
            return true;
        } else {
            throw new EquipoNoEncontradoException(id);
        }
    }
}
