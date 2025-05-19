package com.recreadejuerga.recrea.dtos.jugador;

import lombok.*;

import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class JugadorSimpleDTO {

    private UUID id;
    private String nombre;
    private String apodo;
    private Integer dorsal;
    private UUID equipoId;

}
