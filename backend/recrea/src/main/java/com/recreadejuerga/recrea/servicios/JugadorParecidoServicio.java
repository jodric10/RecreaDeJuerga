package com.recreadejuerga.recrea.servicios;

import com.recreadejuerga.recrea.dtos.jugadorParecido.JugadorParecidoDTO;
import com.recreadejuerga.recrea.dtos.jugadorParecido.JugadorParecidoInsertarDTO;
import com.recreadejuerga.recrea.dtos.jugadorParecido.JugadorParecidoModificarDTO;
import com.recreadejuerga.recrea.entidades.Jugador;
import com.recreadejuerga.recrea.entidades.JugadorParecido;
import com.recreadejuerga.recrea.error.CamposDuplicadosException;
import com.recreadejuerga.recrea.error.JugadorParecidoNoEncontradoException;
import com.recreadejuerga.recrea.error.JugadorParecidoYaExistenteException;
import com.recreadejuerga.recrea.mappers.JugadorParecidoMapper;
import com.recreadejuerga.recrea.repositorios.JugadoresParecidosRepositorio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service
public class JugadorParecidoServicio {

    @Autowired
    private JugadoresParecidosRepositorio repo;

    @Autowired
    private JugadorServicio repoJugador;


    public List<JugadorParecidoDTO> getParecidosDeJugador(UUID jugador_id) {
        List<JugadorParecido> jugadores = repo.getParecidosByJugadorId(jugador_id);
        if (jugadores.isEmpty()) {
            throw new JugadorParecidoNoEncontradoException(jugador_id);
        }
        return jugadores.stream().map(JugadorParecidoMapper::toJugadorParecidoDTO).toList();
    }


    public JugadorParecidoDTO insertarJugadorParecido(JugadorParecidoInsertarDTO insertar_parecido) {
        if (repo.existsByJugadorIdAndParecido(insertar_parecido.getJugadorId(), insertar_parecido.getParecido()).isPresent()) {
            throw new JugadorParecidoYaExistenteException(insertar_parecido.getJugadorId(),insertar_parecido.getParecido());
        }
        Jugador jugador = Jugador.builder().id(insertar_parecido.getJugadorId()).build();
        JugadorParecido entidad = JugadorParecidoMapper.toJugadorParecido(insertar_parecido, jugador);
        try {
            return JugadorParecidoMapper.toJugadorParecidoDTO(repo.save(entidad));
        } catch (DataIntegrityViolationException ex) {
            Throwable causa = ex.getRootCause();
            if (causa != null && causa.getMessage() != null && causa.getMessage().contains("uk_jugador_parecido")) {
                throw new CamposDuplicadosException(Map.of("parecido", "Ya existe este parecido para este jugador (clave única: uk_jugador_parecido)."));
            }
            throw new CamposDuplicadosException(Map.of("desconocido", "Violación de restricción de unicidad."));
        }
    }

    public JugadorParecidoDTO modificarJugadorParecido(JugadorParecidoModificarDTO modificar_parecido, UUID parecido_id){
        if (repo.existsById(parecido_id)) {
            try {
                repo.actualizarParecido(parecido_id,modificar_parecido.getParecido());
                return repo.findById(parecido_id).map(JugadorParecidoMapper::toJugadorParecidoDTO).orElseThrow(() -> new JugadorParecidoNoEncontradoException(parecido_id));
            } catch (DataIntegrityViolationException ex) {
                Throwable causa = ex.getRootCause();
                if (causa != null && causa.getMessage() != null && causa.getMessage().contains("uk_jugador_parecido")) {
                    throw new CamposDuplicadosException(Map.of("parecido", "Ya existe este parecido para este jugador (clave única: uk_jugador_parecido)."));
                }
                throw new CamposDuplicadosException(Map.of("desconocido", "Violación de restricción de unicidad."));
            }
        }
        throw new JugadorParecidoNoEncontradoException("Lo siento pero el parecido no fue encontrado");
    }


    public boolean eliminarParecido(UUID id) {
        if (!repo.existsById(id)) {
            throw new JugadorParecidoNoEncontradoException(id);
        }
        repo.deleteById(id);
        return true;
    }
}


