package com.recreadejuerga.recrea.dtos.clasificacion;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import lombok.*;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ClasificacionEditarDTO {

    @NotNull
    @Min(0)
    private Integer puntos;

    @NotNull
    @Min(0)
    private Integer partidosJugados;

    @NotNull
    @Min(0)
    private Integer ganados;

    @NotNull
    @Min(0)
    private Integer empatados;

    @NotNull
    @Min(0)
    private Integer perdidos;

    @NotNull
    @Min(0)
    private Integer golesAFavor;

    @NotNull
    @Min(0)
    private Integer golesContra;
}
