package com.recreadejuerga.recrea.mappers;

import com.recreadejuerga.recrea.dtos.equipo.*;
import com.recreadejuerga.recrea.entidades.Clasificacion;
import com.recreadejuerga.recrea.entidades.Equipo;

public class EquipoMapper {

    public static ClasificacionCamposPrincipalesDTO toClasificacionCamposPrincipalesDTO(Equipo equipo){
        if (equipo == null) return null;
        Clasificacion clasificacion_equipo = equipo.getClasificacion();
        ClasificacionCamposPrincipalesDTO cc = null;
        if (clasificacion_equipo != null) {
            cc = new ClasificacionCamposPrincipalesDTO(
                    clasificacion_equipo.getPuntos(),
                    clasificacion_equipo.getPartidosJugados()
            );
        }
        return cc;
    }

    public static EquipoDTO toEquipoDTO(Equipo equipo){
        if (equipo == null) return null;
        return new EquipoDTO(equipo.getId(),equipo.getNombre(),equipo.getUrl_logo());
    }

    public static EquipoResponseDTO toEquipoResponseDTO(Equipo equipo) {
        if (equipo == null) return null;
        EquipoDTO salida_equipo= toEquipoDTO(equipo);
        ClasificacionCamposPrincipalesDTO clasificacion_equipo= toClasificacionCamposPrincipalesDTO(equipo);
        return new EquipoResponseDTO(salida_equipo,clasificacion_equipo);
    }

    public static Equipo toEquipo(EquipoFormularioDTO insertar_equipo){
        Equipo equipo= Equipo.builder().nombre(insertar_equipo.getNombre()).url_logo(insertar_equipo.getUrl_logo()).build();
        Clasificacion clasificacion = Clasificacion.builder().equipo(equipo).build();
        equipo.setClasificacion(clasificacion);
        return equipo;
    }
}
