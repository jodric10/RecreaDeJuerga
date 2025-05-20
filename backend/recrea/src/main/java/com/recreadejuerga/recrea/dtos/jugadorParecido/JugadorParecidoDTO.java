package com.recreadejuerga.recrea.dtos.jugadorparecido;

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
