package com.recreadejuerga.recrea.dtos.jugador;

import com.recreadejuerga.recrea.dtos.equipo.EquipoDTO;
import com.recreadejuerga.recrea.dtos.jugadorparecido.JugadorParecidoSimpleDTO;
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
    private String fotoFrontal;
    private String fotoTarjeta;
    private String fotoPose;
    private List<JugadorParecidoSimpleDTO> parecidos;
    private EquipoDTO equipo;
}
