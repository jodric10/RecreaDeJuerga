package com.recreadejuerga.recrea.error;

import com.recreadejuerga.recrea.dtos.jugador.JugadorFormularioDTO;
import com.recreadejuerga.recrea.entidades.Jugador;

public class JugadorYaExistenteException extends RuntimeException {

    public JugadorYaExistenteException(String nombreEquipo, Integer dorsal) {
        super("Lo siento, pero ya existe un jugador con dicho dorsal ("+ dorsal+") en "+ nombreEquipo);
    }
}
