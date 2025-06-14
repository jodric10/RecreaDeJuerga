package com.recreadejuerga.recrea.dtos.jugador;

import com.recreadejuerga.recrea.dtos.equipo.EquipoDTO;
import com.recreadejuerga.recrea.dtos.equipo.EquipoSimpleDTO;
import com.recreadejuerga.recrea.dtos.jugadorParecido.JugadorParecidoSimpleDTO;
import lombok.*;

import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class JugadorDTO {
    private UUID id;
    private String nombre;
    private String apodo;
    private Integer dorsal;
    private String posicion;
    private String pieDominante;
    private Integer golesTotales;
    private Integer asistenciasTotales;
    private String fortalezas;
    private LocalDate fechaNacimiento;
    private String cromo;
    private String fotoPose;
    private Integer num_coleccionable;
    private List<JugadorParecidoSimpleDTO> parecidos;
    private EquipoSimpleDTO equipo;
}
