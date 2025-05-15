package com.recreadejuerga.recrea.dtos.equipo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class EquipoResponseDTO {
    private EquipoDTO equipo;
    private ClasificacionCamposPrincipalesDTO clasificacion;
}
