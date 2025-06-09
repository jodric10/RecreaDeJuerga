package com.recreadejuerga.recrea.dtos.partido;

import com.recreadejuerga.recrea.dtos.equipo.EquipoDTO;
import com.recreadejuerga.recrea.dtos.equipo.EquipoSimpleDTO;
import com.recreadejuerga.recrea.dtos.jugador.JugadorDTO;
import com.recreadejuerga.recrea.dtos.jugador.JugadorSimpleDTO;
import lombok.*;

import java.time.LocalDateTime;
import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PartidoDTO {

    private UUID id;
    private LocalDateTime fecha;
    private String lugar;
    private String estado;
    private EquipoSimpleDTO equipoLocal;
    private EquipoSimpleDTO equipoVisitante;
    private Integer golesLocal;
    private Integer golesVisitante;
    private JugadorSimpleDTO mvp;

}
