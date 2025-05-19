package com.recreadejuerga.recrea.dtos.clasificacion;

import com.recreadejuerga.recrea.dtos.equipo.EquipoDTO;
import lombok.*;

import java.math.BigDecimal;
import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ClasificacionDTO {
    private UUID id;
    private Integer puntos;
    private Integer partidosJugados;
    private Integer ganados;
    private Integer empatados;
    private Integer perdidos;
    private Integer golesAFavor;
    private Integer golesContra;
    private Integer diferenciaGoles;
    private BigDecimal promedioTfTc;
    private EquipoDTO equipo;
}
