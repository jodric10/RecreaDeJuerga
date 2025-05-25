package com.recreadejuerga.recrea.mappers;

import com.recreadejuerga.recrea.dtos.estadisticasJugadorPartido.EstadisticasJugadorPartidoDTO;
import com.recreadejuerga.recrea.dtos.estadisticasJugadorPartido.EstadisticasJugadorPartidoInsertarDTO;
import com.recreadejuerga.recrea.dtos.jugador.JugadorSimpleDTO;
import com.recreadejuerga.recrea.entidades.EstadisticasJugadorPartido;
import com.recreadejuerga.recrea.entidades.Jugador;
import com.recreadejuerga.recrea.entidades.Partido;

public class EstadisticasJugadorPartidoMapper {

    public static EstadisticasJugadorPartidoDTO toEstadisticasJugadorPartidoDTO(EstadisticasJugadorPartido estadisticas){
        if (estadisticas == null) return null;
        JugadorSimpleDTO jugadorDTO= JugadorMapper.tojugadorSimpleDTO(estadisticas.getJugador());
        return new EstadisticasJugadorPartidoDTO(
                estadisticas.getId(),
                estadisticas.getPartido().getId(),
                jugadorDTO,
                estadisticas.getGoles(),
                estadisticas.getAsistencias(),
                estadisticas.getAmarilla(),
                estadisticas.getRoja(),
                estadisticas.getPortero()
        );
    }

    public static EstadisticasJugadorPartido toEstadisticasJugadorPartido(
            EstadisticasJugadorPartidoInsertarDTO dto,
            Jugador jugador,
            Partido partido
    ) {
        return EstadisticasJugadorPartido.builder()
                .jugador(jugador)
                .partido(partido)
                .goles(dto.getGoles())
                .asistencias(dto.getAsistencias())
                .amarilla(dto.getAmarilla())
                .roja(dto.getRoja())
                .portero(dto.getPortero())
                .build();
    }





}
