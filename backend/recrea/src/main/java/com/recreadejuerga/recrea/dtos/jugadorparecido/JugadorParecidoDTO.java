package com.recreadejuerga.recrea.dtos.jugadorparecido;

import com.recreadejuerga.recrea.dtos.jugador.JugadorDTO;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class JugadorParecidoDTO {
    private UUID id;
    private UUID jugadorId;
    private String parecido;
}
