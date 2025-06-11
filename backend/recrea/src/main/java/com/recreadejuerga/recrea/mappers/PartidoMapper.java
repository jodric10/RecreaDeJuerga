package com.recreadejuerga.recrea.mappers;

import com.recreadejuerga.recrea.dtos.equipo.EquipoDTO;
import com.recreadejuerga.recrea.dtos.equipo.EquipoSimpleDTO;
import com.recreadejuerga.recrea.dtos.jugador.JugadorSimpleDTO;
import com.recreadejuerga.recrea.dtos.partido.PartidoDTO;
import com.recreadejuerga.recrea.dtos.partido.PartidoFormularioDTO;
import com.recreadejuerga.recrea.entidades.Equipo;
import com.recreadejuerga.recrea.entidades.Jugador;
import com.recreadejuerga.recrea.entidades.Partido;

public class PartidoMapper {

    public static PartidoDTO toPartidoDTO(Partido partido){
        if (partido == null) return null;
        EquipoSimpleDTO equipoLocal=EquipoMapper.toSimpleEquipoDTO(partido.getEquipoLocal());
        EquipoSimpleDTO equipoVisitante=EquipoMapper.toSimpleEquipoDTO(partido.getEquipoVisitante());
        JugadorSimpleDTO mvp=JugadorMapper.tojugadorSimpleDTO(partido.getMvp());
        return new PartidoDTO(
                partido.getId(),
                partido.getFecha(),
                partido.getLugar(),
                partido.getEstado(),
                equipoLocal,
                equipoVisitante,
                partido.getGolesLocal(),
                partido.getGolesVisitante(),
                mvp
        );
    }

    public static Partido toPartido(PartidoFormularioDTO dto, Equipo equipoLocal, Equipo equipoVisitante, Jugador mvp) {
        return Partido.builder()
                .fecha(dto.getFecha())
                .lugar(dto.getLugar())
                .estado(dto.getEstado())
                .equipoLocal(equipoLocal)
                .equipoVisitante(equipoVisitante)
                .golesLocal(dto.getGolesLocal())
                .golesVisitante(dto.getGolesVisitante())
                .mvp(mvp)
                .build();
    }
}
