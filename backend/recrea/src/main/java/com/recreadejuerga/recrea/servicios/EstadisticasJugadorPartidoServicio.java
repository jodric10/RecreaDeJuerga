package com.recreadejuerga.recrea.servicios;

import com.recreadejuerga.recrea.dtos.estadisticasJugadorPartido.EstadisticasJugadorPartidoDTO;
import com.recreadejuerga.recrea.dtos.estadisticasJugadorPartido.EstadisticasJugadorPartidoFormularioDTO;
import com.recreadejuerga.recrea.dtos.partido.PartidoDTO;
import com.recreadejuerga.recrea.dtos.partido.PartidoFormularioDTO;
import com.recreadejuerga.recrea.entidades.Equipo;
import com.recreadejuerga.recrea.entidades.EstadisticasJugadorPartido;
import com.recreadejuerga.recrea.entidades.Jugador;
import com.recreadejuerga.recrea.entidades.Partido;
import com.recreadejuerga.recrea.error.*;
import com.recreadejuerga.recrea.mappers.EstadisticasJugadorPartidoMapper;
import com.recreadejuerga.recrea.mappers.JugadorParecidoMapper;
import com.recreadejuerga.recrea.mappers.PartidoMapper;
import com.recreadejuerga.recrea.repositorios.EstadisticasJugadorPartidoRepositorio;
import com.recreadejuerga.recrea.repositorios.JugadorRepositorio;
import com.recreadejuerga.recrea.repositorios.PartidoRepositorio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service
public class EstadisticasJugadorPartidoServicio {

    @Autowired
    private EstadisticasJugadorPartidoRepositorio repo;

    @Autowired
    private JugadorRepositorio repoJugador;

     @Autowired
     private PartidoRepositorio repoPartido;

    @Autowired
    private JugadorServicio jugadorServicio;

    public List<EstadisticasJugadorPartidoDTO> getEstaditicasJugadoresPorPartido(UUID partido_id){
        List<EstadisticasJugadorPartido> estadisticasJugadores= repo.getEstaditicasJugadoresPorPartido(partido_id);
        if (estadisticasJugadores.isEmpty()){
            throw new EstadisticasJugadorPartidoNoEncontradoException(partido_id);
        }
        return estadisticasJugadores.stream().map(EstadisticasJugadorPartidoMapper::toEstadisticasJugadorPartidoDTO).toList();
    }

    public List<EstadisticasJugadorPartidoDTO> getEstadisticasDeUnJugador(UUID jugador_id){
        List<EstadisticasJugadorPartido> estadisticasJugador= repo.getEstadisticasDeUnJugador(jugador_id);
        if (estadisticasJugador.isEmpty()){
            String nombreJugador= jugadorServicio.getJugadorById(jugador_id).getNombre();
            throw new EstadisticasJugadorPartidoNoEncontradoException(nombreJugador);
        }
        return estadisticasJugador.stream().map(EstadisticasJugadorPartidoMapper::toEstadisticasJugadorPartidoDTO).toList();
    }

    public EstadisticasJugadorPartidoDTO insertarEstadisticaJugadorEnPartido(EstadisticasJugadorPartidoFormularioDTO dto) {
        if (repo.getEstadisticasDeUnJugadorEnUnPartido(dto.getJugadorId(),dto.getPartidoId()).isPresent()) {
            throw new EstadisticaJugadorPartidoYaExistenteException(dto.getJugadorId(),dto.getPartidoId());
        }
        Jugador jugador = null;
        Partido partido= null;
        try {
            jugador= repoJugador.findById(dto.getJugadorId()).orElseThrow(() -> new JugadorNoEncontradoException(dto.getJugadorId()));
            partido = repoPartido.findById(dto.getPartidoId()).orElseThrow(()-> new PartidoNoEncontradoException(dto.getPartidoId()));
            EstadisticasJugadorPartido estadisticasJugadorPartido= EstadisticasJugadorPartidoMapper.toEstadisticasJugadorPartido(dto,jugador,partido);
            return EstadisticasJugadorPartidoMapper.toEstadisticasJugadorPartidoDTO(repo.save(estadisticasJugadorPartido));
        } catch (DataIntegrityViolationException ex) {
            Throwable causa = ex.getRootCause();
            if (causa != null) {
                String mensaje = causa.getMessage();
                if (mensaje.contains("unique_jugador_partido")) {
                    throw new CamposDuplicadosException(Map.of(
                            "jugador-partido",  "El jugador " + jugador.getNombre() + " ya tiene registrada una estadística " +
                                    "para el partido del " + partido.getFecha().toLocalDate() + " en " + partido.getLugar() + "."
                    ));
                }
            }
            throw new CamposDuplicadosException(Map.of(
                    "desconocido", "Violación de restricción de unicidad"
            ));
        }
    }

    public EstadisticasJugadorPartidoDTO modificarEstadisticaJugadorEnPartido(EstadisticasJugadorPartidoFormularioDTO dto, UUID id) {
        if (!repo.existsById(id)) {
            throw new EstadisticasJugadorPartidoNoEncontradoException(id);
        }
        repo.actualizarEstadisticas(
                id,
                dto.getGoles(),
                dto.getAsistencias(),
                dto.getAmarilla(),
                dto.getRoja(),
                dto.getPortero()
        );
        return repo.findById(id)
                .map(EstadisticasJugadorPartidoMapper::toEstadisticasJugadorPartidoDTO)
                .orElseThrow(() -> new EstadisticasJugadorPartidoNoEncontradoException(id));
    }


    public boolean eliminarEstadisticasJugadorPartido(UUID id) {
        if (repo.existsById(id)) {
            repo.deleteById(id);
            return true;
        } else {
            throw new EstadisticasJugadorPartidoNoEncontradoException(id);
        }
    }





}
