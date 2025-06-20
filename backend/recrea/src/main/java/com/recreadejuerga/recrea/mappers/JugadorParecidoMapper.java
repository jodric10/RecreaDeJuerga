package com.recreadejuerga.recrea.mappers;

import com.recreadejuerga.recrea.dtos.jugadorParecido.JugadorParecidoDTO;
import com.recreadejuerga.recrea.dtos.jugadorParecido.JugadorParecidoFormularioDTO;
import com.recreadejuerga.recrea.dtos.jugadorParecido.JugadorParecidoSimpleDTO;
import com.recreadejuerga.recrea.entidades.Jugador;
import com.recreadejuerga.recrea.entidades.JugadorParecido;

public class JugadorParecidoMapper {

    public static JugadorParecidoDTO toJugadorParecidoDTO(JugadorParecido jugadorParecido) {
        if (jugadorParecido == null) return null;
        return new JugadorParecidoDTO(
                jugadorParecido.getId(),
                jugadorParecido.getJugador().getId(),
                jugadorParecido.getParecido()
        );
    }

    public static JugadorParecidoSimpleDTO toJugadorParecidoSimpleDTO(JugadorParecido jugadorParecido) {
        if (jugadorParecido == null) return null;
        return new JugadorParecidoSimpleDTO(
                jugadorParecido.getId(),
                jugadorParecido.getParecido()
        );
    }


    public static JugadorParecido toJugadorParecido(JugadorParecidoFormularioDTO dto, Jugador jugador) {
        if (dto == null || jugador==null) return null;
        return JugadorParecido.builder()
                .jugador(jugador)
                .parecido(dto.getParecido())
                .build();
    }
}
