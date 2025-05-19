package com.recreadejuerga.recrea.error;

import java.util.UUID;

public class PartidoNoEncontradoException extends RuntimeException {

    public PartidoNoEncontradoException(String nombreEquipo) {
        super("No hemos encontrado ningún partido de"+ nombreEquipo);
    }

    public PartidoNoEncontradoException(UUID partido_id) {
        super("No hemos encontrado el partido con id("+partido_id+")");
    }
}
