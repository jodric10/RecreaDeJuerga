package com.recreadejuerga.recrea.dtos.estadisticasJugadorPartido;

import jakarta.validation.constraints.Min;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class EstadisticasJugadorPartidoActualizarDTO {

    @Min(value = 0, message = "Los goles no pueden ser negativos")
    private Integer goles;

    @Min(value = 0, message = "Las asistencias no pueden ser negativas")
    private Integer asistencias;

    private Boolean amarilla;

    private Boolean roja;

    private Boolean portero;
}

