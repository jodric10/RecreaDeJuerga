package com.recreadejuerga.recrea.dtos.clasificacion;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
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
}
