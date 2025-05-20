package com.recreadejuerga.recrea.error;

import java.util.UUID;

public class EstadisticaJugadorPartidoYaExistenteException extends RuntimeException {

    public EstadisticaJugadorPartidoYaExistenteException(UUID jugador_id, UUID partido_id) {
        super("Lo siento, pero ya hay estadísticas registradas para el jugador con id("+jugador_id+") en el partido con id("+partido_id);
    }
}
