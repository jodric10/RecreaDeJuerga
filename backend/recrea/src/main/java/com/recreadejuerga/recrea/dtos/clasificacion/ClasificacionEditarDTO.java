package com.recreadejuerga.recrea.dtos.clasificacion;

import jakarta.validation.constraints.Min;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ClasificacionEditarDTO {

    @Min(0)
    private Integer puntos;

    @Min(0)
    private Integer partidosJugados;

    @Min(0)
    private Integer ganados;

    @Min(0)
    private Integer empatados;

    @Min(0)
    private Integer perdidos;

    @Min(0)
    private Integer golesAFavor;

    @Min(0)
    private Integer golesContra;
}
