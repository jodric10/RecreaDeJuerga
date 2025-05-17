package com.recreadejuerga.recrea.error;

import java.util.UUID;

public class JugadorNoEncontradoException extends RuntimeException {

    public JugadorNoEncontradoException(String nombre_equipo) {
        super("No hemos encontrado ningún jugador que pertenezca al : "+ nombre_equipo);
    }

    public JugadorNoEncontradoException(UUID id){
        super("El jugador con id ("+ id +") no fue encontrado.");
    }



}
