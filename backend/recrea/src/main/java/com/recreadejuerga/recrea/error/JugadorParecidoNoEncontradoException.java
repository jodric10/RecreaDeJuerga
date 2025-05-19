package com.recreadejuerga.recrea.error;

import java.util.UUID;

public class JugadorParecidoNoEncontradoException extends RuntimeException {
    public JugadorParecidoNoEncontradoException(String message) {
        super(message);
    }

    public JugadorParecidoNoEncontradoException(UUID id){
        super("El parecido del jugador con id("+id+") no fue encontrado.");
    }
}
