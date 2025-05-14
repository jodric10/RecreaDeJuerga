package com.recreadejuerga.recrea.dtos.equipo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class EquipoDTO {
    private UUID id;
    private String nombre;
    private String url_logo;
    private ClasificacionCamposPrincipales clasificacion;
}
