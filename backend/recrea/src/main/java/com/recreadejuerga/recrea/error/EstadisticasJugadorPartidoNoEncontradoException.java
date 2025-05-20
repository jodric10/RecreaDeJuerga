package com.recreadejuerga.recrea.error;

import java.util.UUID;

public class EstadisticasJugadorPartidoNoEncontradoException extends RuntimeException {

    public EstadisticasJugadorPartidoNoEncontradoException(UUID partidoId) {
        super("Lo siento, pero no encuentro las estadísticas de ningún jugador del partido cuyo id es "+partidoId);
    }

    public EstadisticasJugadorPartidoNoEncontradoException(String nombre) {
        super("Lo siento, pero no encuentro ninguna estadística acerca del jugador "+nombre);
    }


}
