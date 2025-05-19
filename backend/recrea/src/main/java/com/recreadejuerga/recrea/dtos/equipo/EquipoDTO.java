package com.recreadejuerga.recrea.dtos.equipo;

import lombok.*;

import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class EquipoDTO {
    private UUID id;
    private String nombre;
    private String url_logo;
}
