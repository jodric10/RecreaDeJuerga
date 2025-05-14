package com.recreadejuerga.recrea.servicios;

import com.recreadejuerga.recrea.dtos.equipo.ClasificacionCamposPrincipales;
import com.recreadejuerga.recrea.dtos.equipo.EquipoDTO;
import com.recreadejuerga.recrea.dtos.equipo.EquipoEditarDTO;
import com.recreadejuerga.recrea.dtos.equipo.EquipoInsertDTO;
import com.recreadejuerga.recrea.entidades.Clasificacion;
import com.recreadejuerga.recrea.entidades.Equipo;
import com.recreadejuerga.recrea.error.CamposDuplicadosException;
import com.recreadejuerga.recrea.error.EquipoNoEncontradoException;
import com.recreadejuerga.recrea.error.EquipoYaExistenteException;
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

    private EquipoDTO convertirAEquipoDTO(Equipo e) {
        Clasificacion c = e.getClasificacion();
        ClasificacionCamposPrincipales cc = null;
        if (c != null) {
            cc = new ClasificacionCamposPrincipales(
                    c.getPosicion(),
                    c.getPuntos(),
                    c.getPartidosJugados()
            );
        }
        return new EquipoDTO(
                e.getId(),
                e.getNombre(),
                e.getUrl_logo(),
                cc
        );
    }

    public List<EquipoDTO> getEquipos(){
        List<Equipo> equipos= repo.findAll();
        if(equipos.isEmpty())
            throw new EquipoNoEncontradoException();
        return equipos.stream().map(this::convertirAEquipoDTO).toList();
    }

    public EquipoDTO getEquipo(UUID id){
        return repo.findById(id).map(this::convertirAEquipoDTO).orElseThrow(() -> new EquipoNoEncontradoException(id));
    }

    public EquipoDTO insertarEquipo(EquipoInsertDTO e) {
        if (repo.buscarPorNombre(e.getNombre()).isPresent())
            throw new EquipoYaExistenteException(e.getNombre());
        try {
            Equipo entidad_equipo = new Equipo();
            entidad_equipo.setId(UUID.randomUUID());
            entidad_equipo.setNombre(e.getNombre());
            entidad_equipo.setUrl_logo(e.getUrl_logo());
            Equipo equipo=repo.save(entidad_equipo);
            return convertirAEquipoDTO(equipo);

        } catch (DataIntegrityViolationException ex) {
            Throwable causa = ex.getRootCause();
            if (causa != null) {
                String mensaje = causa.getMessage();
                if (mensaje.contains("uk_equipo_nombre")) {
                    throw new CamposDuplicadosException(Map.of(
                            "nombre", "Ya existe un equipo con ese nombre(+"+e.getNombre()+")"
                    ));
                }
            }
            throw new CamposDuplicadosException(Map.of(
                    "desconocido", "Violación de restricción de unicidad"
            ));
        }
    }


    public EquipoDTO modificarEquipo(EquipoEditarDTO e, UUID id){
        if(repo.existsById(id)){
            try {
                repo.actualizarEquipo(id, e.getNombre(), e.getUrl_logo());
                return repo.findById(id).map(this::convertirAEquipoDTO).orElseThrow(()-> new EquipoNoEncontradoException(id));
            }catch (DataIntegrityViolationException ex){
                Throwable causa = ex.getRootCause();
                if (causa != null) {
                    String mensaje = causa.getMessage();
                    if (mensaje.contains("uk_equipo_nombre")) {
                        throw new CamposDuplicadosException(Map.of(
                                "nombre", "Ya existe un equipo con ese nombre("+e.getNombre()+")"
                        ));
                    }
                }
                throw new CamposDuplicadosException(Map.of(
                        "desconocido", "Violación de restricción de unicidad"
                ));
            }
        }else{
            throw new EquipoNoEncontradoException(id);
        }
    }

    public boolean eliminarEquipo(UUID id){
        if(repo.existsById(id)){
            repo.eliminarEquipo(id);
            return true;
        }else{
            throw new EquipoNoEncontradoException(id);
        }
    }
}
