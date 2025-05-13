package com.recreadejuerga.recrea.error;

public class EquipoYaExistenteException extends RuntimeException {

    public EquipoYaExistenteException(String nombre){
        super("Lo siento, ya existe un equipo con dicho nombre("+nombre+")");
    }
}
