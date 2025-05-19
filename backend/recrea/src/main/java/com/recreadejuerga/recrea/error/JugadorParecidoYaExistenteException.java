package com.recreadejuerga.recrea.error;

import java.util.UUID;

public class JugadorParecidoYaExistenteException extends RuntimeException {

    public JugadorParecidoYaExistenteException(UUID jugador_id, String parecido) {
        super("Lo siento, pero ya tiene el jugador con id("+ jugador_id+") el parecido con "+parecido);
    }
}
