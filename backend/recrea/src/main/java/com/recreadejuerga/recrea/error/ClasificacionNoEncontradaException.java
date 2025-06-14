package com.recreadejuerga.recrea.error;

import com.recreadejuerga.recrea.entidades.Clasificacion;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.UUID;

public class ClasificacionNoEncontradaException extends RuntimeException {

    public ClasificacionNoEncontradaException() {
        super("No hay datos de clasificación disponibles");
    }

    public ClasificacionNoEncontradaException(UUID id) {
        super("La clasificación no pudo ser encontrada con ese ID:"+ id);
    }

    public ClasificacionNoEncontradaException(String nombre) {
        super("La clasificación del equipo ("+nombre+") no pudo ser encontrada");
    }
}
