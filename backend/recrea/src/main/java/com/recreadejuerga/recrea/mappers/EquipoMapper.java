package com.recreadejuerga.recrea.mappers;

import com.recreadejuerga.recrea.dtos.equipo.*;
import com.recreadejuerga.recrea.entidades.Clasificacion;
import com.recreadejuerga.recrea.entidades.Equipo;

public class EquipoMapper {


    public static EquipoDTO toEquipoDTO(Equipo equipo){
        if (equipo == null) return null;
        return new EquipoDTO(equipo.getId(),equipo.getNombre(),equipo.getUrl_logo(), equipo.getEslogan(),equipo.getDescripcion(),equipo.getUrl_equipo());
    }

    public static Equipo toEquipoDesdeDTO(EquipoDTO dto) {
        if (dto == null) return null;
        return Equipo.builder()
                .id(dto.getId())
                .nombre(dto.getNombre())
                .url_logo(dto.getUrl_logo())
                .eslogan(dto.getEslogan())
                .descripcion(dto.getDescripcion())
                .url_equipo(dto.getUrl_equipo())
                .build();
    }



    public static EquipoSimpleDTO toSimpleEquipoDTO(Equipo equipo){
        if (equipo == null) return null;
        return new EquipoSimpleDTO(equipo.getId(),equipo.getNombre(),equipo.getUrl_logo());
    }

    public static Equipo toEquipo(EquipoFormularioDTO insertar_equipo){
        Equipo equipo= Equipo.builder().nombre(insertar_equipo.getNombre()).url_logo(insertar_equipo.getUrl_logo()).build();
        Clasificacion clasificacion = Clasificacion.builder().equipo(equipo).build();
        equipo.setClasificacion(clasificacion);
        return equipo;
    }
}
