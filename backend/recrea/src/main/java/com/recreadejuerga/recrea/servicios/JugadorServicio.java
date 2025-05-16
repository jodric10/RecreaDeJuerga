package com.recreadejuerga.recrea.servicios;

import com.recreadejuerga.recrea.dtos.jugador.JugadorFormularioDTO;
import com.recreadejuerga.recrea.dtos.jugador.JugadorResponseDTO;
import com.recreadejuerga.recrea.entidades.Jugador;
import com.recreadejuerga.recrea.error.*;
import com.recreadejuerga.recrea.mappers.EquipoMapper;
import com.recreadejuerga.recrea.mappers.JugadorMapper;
import com.recreadejuerga.recrea.repositorios.JugadorRepositorio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service
public class JugadorServicio {

    @Autowired
    private JugadorRepositorio repo;

    @Autowired
    private EquipoServicio EquipoServicio;


    public List<JugadorResponseDTO> getJugadoresByEquipo(UUID equipo_id){
        List<Jugador> jugadores= repo.getJugadoresByEquipo(equipo_id);
        if (jugadores.isEmpty()){
            String nombreEquipo= EquipoServicio.getEquipo(equipo_id).getEquipo().getNombre();
            throw new JugadorNoEncontradoException(nombreEquipo);
        }
        return jugadores.stream().map(JugadorMapper::toJugadorResponseDTO).toList();
    }

    public JugadorResponseDTO insertarJugador(JugadorFormularioDTO jugador) {
        String nombreEquipo= EquipoServicio.getEquipo(jugador.getEquipoId()).getEquipo().getNombre();
        if (repo.getJugador(jugador.getDorsal(),jugador.getEquipoId()).isPresent()) {
            throw new JugadorYaExistenteException(nombreEquipo,jugador.getDorsal());
        }
        try {
           Jugador insertar_jugador=JugadorMapper.toJugador(jugador);
           Jugador insertado=repo.save(insertar_jugador);
           return JugadorMapper.toJugadorResponseDTO(insertado);

        } catch (DataIntegrityViolationException ex) {
            Throwable causa = ex.getRootCause();
            if (causa != null) {
                String mensaje = causa.getMessage();
                if (mensaje.contains("uk_jugador_equipo_dorsal")) {

                    throw new CamposDuplicadosException(Map.of(
                            "dorsal", "Ya existe un jugador con ese dorsal ("+ jugador.getDorsal() + ") en"+ nombreEquipo
                    ));
                }
            }
            throw new CamposDuplicadosException(Map.of(
                    "desconocido", "Violación de restricción de unicidad"
            ));
        }
    }

    public JugadorResponseDTO modificarEquipo(JugadorFormularioDTO jugador, UUID id) {
        String nombreEquipo= EquipoServicio.getEquipo(jugador.getEquipoId()).getEquipo().getNombre();
        if (repo.existsById(id)) {
            try {
                repo.actualizarJugador(id,jugador.getNombre(),jugador.getApodo(),jugador.getDorsal(),jugador.getPosicion(),jugador.getPieDominante(),jugador.getGolesTotales(),jugador.getAsistenciasTotales(),jugador.getFortalezas(),jugador.getFechaNacimiento(),jugador.getFotoFrontal(),jugador.getFotoTarjeta(),jugador.getFotoPose());
                return repo.findById(id).map(JugadorMapper::toJugadorResponseDTO).orElseThrow(() -> new JugadorNoEncontradoException(id));
            } catch (DataIntegrityViolationException ex) {
                Throwable causa = ex.getRootCause();
                if (causa != null) {
                    String mensaje = causa.getMessage();
                    if (mensaje.contains("uk_jugador_equipo_dorsal")) {
                        throw new CamposDuplicadosException(Map.of(
                                "dorsal", "Ya existe un jugador con ese dorsal ("+ jugador.getDorsal() + ") en"+ nombreEquipo
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

    public boolean eliminarJugador(UUID id) {
        if (repo.existsById(id)) {
            repo.eliminarJugador(id);
            return true;
        } else {
            throw new JugadorNoEncontradoException(id);
        }
    }
}
