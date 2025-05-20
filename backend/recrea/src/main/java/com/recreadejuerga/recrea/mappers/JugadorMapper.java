package com.recreadejuerga.recrea.mappers;

import com.recreadejuerga.recrea.dtos.jugador.JugadorDTO;
import com.recreadejuerga.recrea.dtos.jugador.JugadorFormularioDTO;
import com.recreadejuerga.recrea.dtos.jugador.JugadorSimpleDTO;
import com.recreadejuerga.recrea.entidades.Jugador;

public class JugadorMapper {

    public static JugadorDTO toJugadorDTO(Jugador jugador){
        if (jugador == null) return null;
        return new JugadorDTO(
                jugador.getId(),
                jugador.getNombre(),
                jugador.getApodo(),
                jugador.getDorsal(),
                jugador.getPosicion(),
                jugador.getPieDominante(),
                jugador.getGolesTotales(),
                jugador.getAsistenciasTotales(),
                jugador.getFortalezas(),
                jugador.getFechaNacimiento(),
                jugador.getFotoFrontal(),
                jugador.getFotoTarjeta(),
                jugador.getFotoPose(),
                jugador.getParecidos().stream().map(JugadorParecidoMapper::toJugadorParecidoSimpleDTO).toList(),
                EquipoMapper.toEquipoDTO(jugador.getEquipo())
        );
    }

    public static JugadorSimpleDTO tojugadorSimpleDTO(Jugador jugador){
        if (jugador == null) return null;
        return new JugadorSimpleDTO(
                jugador.getId(),
                jugador.getNombre(),
                jugador.getApodo(),
                jugador.getDorsal(),
                jugador.getEquipo().getId()
        );
    }

    public static Jugador toJugador(JugadorFormularioDTO insertar_jugador) {
        return Jugador.builder()
                .nombre(insertar_jugador.getNombre())
                .apodo(insertar_jugador.getApodo())
                .dorsal(insertar_jugador.getDorsal())
                .posicion(insertar_jugador.getPosicion())
                .pieDominante(insertar_jugador.getPieDominante())
                .golesTotales(insertar_jugador.getGolesTotales())
                .asistenciasTotales(insertar_jugador.getAsistenciasTotales())
                .fortalezas(insertar_jugador.getFortalezas())
                .fechaNacimiento(insertar_jugador.getFechaNacimiento())
                .fotoFrontal(insertar_jugador.getFotoFrontal())
                .fotoTarjeta(insertar_jugador.getFotoTarjeta())
                .fotoPose(insertar_jugador.getFotoPose())
                .build();
    }
}
