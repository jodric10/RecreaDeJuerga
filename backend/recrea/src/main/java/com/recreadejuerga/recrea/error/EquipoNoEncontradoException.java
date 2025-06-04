package com.recreadejuerga.recrea.error;

import java.util.UUID;

public class EquipoNoEncontradoException extends RuntimeException {

    public EquipoNoEncontradoException(String nombre) {
        super("No se ha encontrado el equipo "+ nombre);
    }

    public EquipoNoEncontradoException(){
        super("No se ha encontrado ningún equipo registrado");
    }

    public EquipoNoEncontradoException(UUID id){
        super("No se encontró un equipo con el ID: " + id);
    }
}
