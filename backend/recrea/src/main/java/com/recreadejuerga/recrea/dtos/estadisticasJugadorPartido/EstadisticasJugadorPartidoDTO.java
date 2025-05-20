package com.recreadejuerga.recrea.dtos.estadisticasJugadorPartido;

import com.recreadejuerga.recrea.dtos.jugador.JugadorSimpleDTO;
import lombok.*;

import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class EstadisticasJugadorPartidoDTO {
    private UUID id;
    private UUID partidoId;
    private JugadorSimpleDTO jugador;
    private Integer goles;
    private Integer asistencias;
    private Boolean amarilla;
    private Boolean roja;
    private Boolean portero;
}

