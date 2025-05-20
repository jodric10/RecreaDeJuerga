package com.recreadejuerga.recrea.dtos.jugadorParecido;

import lombok.*;

import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class JugadorParecidoSimpleDTO {
    private UUID id;
    private String parecido;
}

