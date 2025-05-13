package com.recreadejuerga.recrea.error;

import lombok.Getter;

import java.util.Map;

@Getter
public class CamposDuplicadosException extends RuntimeException {
    private final Map<String,String> campos;

    public CamposDuplicadosException(Map<String, String> campos) {
        super("Campos duplicados: " + campos.keySet());
        this.campos = campos;
    }

}
