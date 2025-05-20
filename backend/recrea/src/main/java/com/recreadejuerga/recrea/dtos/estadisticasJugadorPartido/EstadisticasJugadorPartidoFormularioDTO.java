package com.recreadejuerga.recrea.dtos.estadisticasJugadorPartido;

import lombok.*;

import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class EstadisticasJugadorPartidoFormularioDTO {

    private UUID jugadorId;

    private UUID partidoId;

    private Integer goles;

    private Integer asistencias;

    private Boolean amarilla;

    private Boolean roja;

    private Boolean portero;
}
