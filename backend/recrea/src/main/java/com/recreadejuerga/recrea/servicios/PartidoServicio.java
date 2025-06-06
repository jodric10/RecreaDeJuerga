package com.recreadejuerga.recrea.servicios;


import com.recreadejuerga.recrea.dtos.partido.PartidoDTO;
import com.recreadejuerga.recrea.dtos.partido.PartidoFormularioDTO;
import com.recreadejuerga.recrea.entidades.Equipo;
import com.recreadejuerga.recrea.entidades.Jugador;
import com.recreadejuerga.recrea.entidades.Partido;
import com.recreadejuerga.recrea.error.*;
import com.recreadejuerga.recrea.mappers.JugadorMapper;
import com.recreadejuerga.recrea.mappers.PartidoMapper;
import com.recreadejuerga.recrea.repositorios.EquipoRepositorio;
import com.recreadejuerga.recrea.repositorios.JugadorRepositorio;
import com.recreadejuerga.recrea.repositorios.PartidoRepositorio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service
public class PartidoServicio {

    @Autowired
    private PartidoRepositorio repo;

    @Autowired
    private JugadorRepositorio repoJugador;

    @Autowired
    private EquipoRepositorio repoEquipo;

    @Autowired
    private EquipoServicio equipoServicio;

    public List<PartidoDTO> getPartidosDeUnEquipo(UUID equipo_id){
        List<Partido> partidos= repo.getPartidosDeUnEquipo(equipo_id);
        if (partidos.isEmpty()){
            String nombreEquipo= equipoServicio.getEquipo(equipo_id).getNombre();
            throw new PartidoNoEncontradoException(nombreEquipo);
        }
        return partidos.stream().map(PartidoMapper::toPartidoDTO).toList();
    }

    public PartidoDTO getPartidoById(UUID partido_id){
        return repo.findById(partido_id).map(PartidoMapper::toPartidoDTO).orElseThrow(() -> new PartidoNoEncontradoException(partido_id));
    }

    public PartidoDTO insertarPartido(PartidoFormularioDTO dto) {
        if (repo.buscarPorFechaYLugar(dto.getFecha(),dto.getLugar()).isPresent()) {
            throw new PartidoYaExistenteException(dto.getFecha(),dto.getLugar());
        }
        Jugador jugador = null;
        Equipo equipoLocal = null;
        Equipo equipoVisitante = null;
        try {
             jugador= repoJugador.findById(dto.getMvpId()).orElseThrow(() -> new JugadorNoEncontradoException(dto.getMvpId()));
             equipoLocal= repoEquipo.findById(dto.getEquipoLocalId()).orElseThrow(()->new EquipoNoEncontradoException(dto.getEquipoLocalId()));
             equipoVisitante= repoEquipo.findById(dto.getEquipoVisitanteId()).orElseThrow(()->new EquipoNoEncontradoException(dto.getEquipoVisitanteId()));
            Partido partido = PartidoMapper.toPartido(dto,equipoLocal,equipoVisitante,jugador);
            return PartidoMapper.toPartidoDTO(repo.save(partido));
        } catch (DataIntegrityViolationException ex) {
            Throwable causa = ex.getRootCause();
            if (causa != null) {
                String mensaje = causa.getMessage();
                if (mensaje.contains("uk_fecha_lugar")) {
                    throw new CamposDuplicadosException(Map.of(
                            "fecha-lugar", "Ya está programado un partido el día "+ dto.getFecha() +" en "+dto.getLugar()
                    ));
                }
                if (mensaje.contains("uk_partido_equipo_local_equipo_visitante")) {
                    throw new CamposDuplicadosException(Map.of(
                            "equipo-local-visitante",  "Ya existe un partido con " + equipoLocal.getNombre() + " como local y " +
                                    equipoVisitante.getNombre() + " como visitante"
                    ));
                }
                if (mensaje.contains("partidos_estado_check")) {
                    throw new CamposDuplicadosException(Map.of(
                            "estado", "El estado debe ser 'Pendiente' o 'Finalizado'"
                    ));
                }
            }
            throw new CamposDuplicadosException(Map.of(
                    "desconocido", "Violación de restricción de unicidad"
            ));
        }
    }

    public PartidoDTO modificarPartido(PartidoFormularioDTO dto, UUID id) {
        if (repo.existsById(id)) {
            Jugador jugador = null;
            Equipo equipoLocal = null;
            Equipo equipoVisitante = null;
            try {
                jugador= repoJugador.findById(dto.getMvpId()).orElseThrow(() -> new JugadorNoEncontradoException(dto.getMvpId()));
                equipoLocal= repoEquipo.findById(dto.getEquipoLocalId()).orElseThrow(()->new EquipoNoEncontradoException(dto.getEquipoLocalId()));
                equipoVisitante= repoEquipo.findById(dto.getEquipoVisitanteId()).orElseThrow(()->new EquipoNoEncontradoException(dto.getEquipoVisitanteId()));
                repo.actualizarPartido(id,dto.getFecha(), dto.getLugar(), dto.getEstado(),equipoLocal,equipoVisitante,dto.getGolesLocal(),dto.getGolesVisitante(),jugador);
                return repo.findById(id).map(PartidoMapper::toPartidoDTO).orElseThrow(() -> new PartidoNoEncontradoException(id));
            } catch (DataIntegrityViolationException ex) {
                Throwable causa = ex.getRootCause();
                if (causa != null) {
                    String mensaje = causa.getMessage();
                    if (mensaje.contains("uk_fecha_lugar")) {
                        throw new CamposDuplicadosException(Map.of(
                                "fecha-lugar", "Ya está programado un partido el día "+ dto.getFecha() +" en "+dto.getLugar()
                        ));
                    }
                    if (mensaje.contains("uk_partido_equipo_local_equipo_visitante")) {
                        throw new CamposDuplicadosException(Map.of(
                                "equipo-local-visitante",  "Ya existe un partido con " + equipoLocal.getNombre() + " como local y " +
                                        equipoVisitante.getNombre() + " como visitante"
                        ));
                    }
                    if (mensaje.contains("partidos_estado_check")) {
                        throw new CamposDuplicadosException(Map.of(
                                "estado", "El estado debe ser 'Pendiente' o 'Finalizado'"
                        ));
                    }
                }
                throw new CamposDuplicadosException(Map.of(
                        "desconocido", "Violación de restricción de unicidad"
                ));
            }
        } else {
            throw new JugadorNoEncontradoException(id);
        }
    }

    public boolean eliminarPartido(UUID id) {
        if (repo.existsById(id)) {
            repo.deleteById(id);
            return true;
        } else {
            throw new PartidoNoEncontradoException(id);
        }
    }



}
