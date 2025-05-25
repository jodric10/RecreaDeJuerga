package com.recreadejuerga.recrea.error;

import com.recreadejuerga.recrea.entidades.Clasificacion;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.UUID;

public class ClasificacionNoEncontradaException extends RuntimeException {

    public ClasificacionNoEncontradaException(String message) {
        super(message);
    }

    public ClasificacionNoEncontradaException() {
        super("No hay datos de clasificación disponibles");
    }

    public ClasificacionNoEncontradaException(UUID id) {
        super("La clasificación no pudo ser encontrada con ese ID:"+ id);
    }


}
