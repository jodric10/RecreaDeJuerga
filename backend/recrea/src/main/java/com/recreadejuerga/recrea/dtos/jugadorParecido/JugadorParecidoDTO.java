package com.recreadejuerga.recrea.dtos.jugadorParecido;

import lombok.*;

import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class JugadorParecidoDTO {
    private UUID id;
    private UUID jugadorId;
    private String parecido;
}
