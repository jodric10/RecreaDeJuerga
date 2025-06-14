package com.recreadejuerga.recrea.mappers;

import com.recreadejuerga.recrea.dtos.jugador.JugadorDTO;
import com.recreadejuerga.recrea.dtos.jugador.JugadorFormularioDTO;
import com.recreadejuerga.recrea.dtos.jugador.JugadorSimpleDTO;
import com.recreadejuerga.recrea.entidades.Equipo;
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
                jugador.getCromo(),
                jugador.getFotoPose(),
                jugador.getNum_coleccionable(),
                jugador.getParecidos().stream().map(JugadorParecidoMapper::toJugadorParecidoSimpleDTO).toList(),
                EquipoMapper.toSimpleEquipoDTO(jugador.getEquipo())
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

    public static Jugador toJugador(JugadorFormularioDTO dto, Equipo equipo) {
        return Jugador.builder()
                .nombre(dto.getNombre())
                .apodo(dto.getApodo())
                .dorsal(dto.getDorsal())
                .posicion(dto.getPosicion())
                .pieDominante(dto.getPieDominante())
                .golesTotales(dto.getGolesTotales())
                .asistenciasTotales(dto.getAsistenciasTotales())
                .fortalezas(dto.getFortalezas())
                .fechaNacimiento(dto.getFechaNacimiento())
                .cromo(dto.getCromo())
                .fotoPose(dto.getFotoPose())
                .num_coleccionable(dto.getNum_coleccionable())
                .equipo(equipo)
                .build();
    }
}
