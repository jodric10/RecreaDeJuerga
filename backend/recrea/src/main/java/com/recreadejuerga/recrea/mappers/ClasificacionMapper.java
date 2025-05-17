package com.recreadejuerga.recrea.mappers;

import com.recreadejuerga.recrea.dtos.clasificacion.ClasificacionDTO;
import com.recreadejuerga.recrea.dtos.equipo.EquipoDTO;
import com.recreadejuerga.recrea.entidades.Clasificacion;

public class ClasificacionMapper {

    public static ClasificacionDTO toClasificacionDTO(Clasificacion clasificacion){
        if(clasificacion==null) return null;
        return new ClasificacionDTO(
                clasificacion.getId(),
                clasificacion.getPuntos(),
                clasificacion.getPartidosJugados(),
                clasificacion.getGanados(),
                clasificacion.getEmpatados(),
                clasificacion.getPerdidos(),
                clasificacion.getGolesAFavor(),
                clasificacion.getGolesContra(),
                clasificacion.getDiferenciaGoles(),
                clasificacion.getPromedioTfTc(),
                EquipoMapper.toEquipoDTO(clasificacion.getEquipo())
        );
    }
}
