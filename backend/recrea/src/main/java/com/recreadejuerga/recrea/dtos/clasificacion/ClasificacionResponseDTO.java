package com.recreadejuerga.recrea.dtos.clasificacion;

import com.recreadejuerga.recrea.dtos.equipo.EquipoDTO;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ClasificacionResponseDTO {
    private ClasificacionDTO clasificacion;
    private EquipoDTO equipo;
}
