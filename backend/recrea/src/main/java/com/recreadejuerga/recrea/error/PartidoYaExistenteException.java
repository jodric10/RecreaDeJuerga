package com.recreadejuerga.recrea.error;

import java.time.LocalDateTime;
import java.util.UUID;

public class PartidoYaExistenteException extends RuntimeException {

    public PartidoYaExistenteException(LocalDateTime fecha,String lugar) {
        super("Lo siento, pero ya hay un partido programado el "+fecha +" en "+ lugar);
    }
}
