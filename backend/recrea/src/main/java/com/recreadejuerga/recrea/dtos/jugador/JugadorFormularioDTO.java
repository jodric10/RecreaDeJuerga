package com.recreadejuerga.recrea.dtos.jugador;

import jakarta.validation.constraints.*;
import lombok.*;

import java.time.LocalDate;
import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class JugadorFormularioDTO {

    @NotBlank(message = "El nombre es obligatorio")
    private String nombre;

    private String apodo;

    @NotNull(message = "El dorsal es obligatorio")
    @Min(value = 1, message = "El dorsal debe ser mayor o igual a 1")
    private Integer dorsal;

    private String posicion;

    private String pieDominante;

    @Min(0)
    private Integer golesTotales = 0;

    @Min(0)
    private Integer asistenciasTotales = 0;

    private String fortalezas;

    private LocalDate fechaNacimiento;

    @NotNull(message = "Debe especificarse un equipo")
    private UUID equipoId;

    private String cromo;

    private String fotoPose;

    private Integer num_coleccionable=0;
}
