package com.recreadejuerga.recrea.error;

import org.springframework.http.HttpStatus;
import org.springframework.http.ProblemDetail;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

import java.net.URI;

@RestControllerAdvice
public class GlobalErrorControlador extends ResponseEntityExceptionHandler {

    @ExceptionHandler(EquipoNoEncontradoException.class)
    public ProblemDetail handleEquipoNoEncontrado(EquipoNoEncontradoException ex,  WebRequest request){
        ProblemDetail resultado= ProblemDetail.forStatusAndDetail(HttpStatus.NOT_FOUND, ex.getMessage());
        resultado.setTitle("Equipo no encontrado");
        resultado.setType(URI.create("https://api.recreadejuerga.com/errores/equipo-no-encontrado"));
        resultado.setInstance(URI.create(request.getDescription(false).replace("uri=", "")));
        return resultado;
    }

    @ExceptionHandler(EquipoYaExistenteException.class)
    public ProblemDetail handleEquipoYaExistente(EquipoYaExistenteException ex, WebRequest request){
        ProblemDetail resultado= ProblemDetail.forStatusAndDetail(HttpStatus.CONFLICT, ex.getMessage());
        resultado.setTitle("Equipo ya existente");
        resultado.setType(URI.create("https://api.recreadejuerga.com/errores/equipo-ya-existente"));
        resultado.setInstance(URI.create(request.getDescription(false).replace("uri=", "")));
        return resultado;
    }

    @ExceptionHandler(CamposDuplicadosException.class)
    public ProblemDetail handleRegistroYaExistente(CamposDuplicadosException ex, WebRequest request){
        ProblemDetail resultado= ProblemDetail.forStatusAndDetail(HttpStatus.CONFLICT, ex.getMessage());
        resultado.setTitle("Campos duplicados");
        resultado.setType(URI.create("https://api.recreadejuerga.com/errores/campos-duplicados"));
        resultado.setInstance(URI.create(request.getDescription(false).replace("uri=", "")));
        resultado.setProperty("campos", ex.getCampos());
        return resultado;
    }
}
