package com.recreadejuerga.recrea.error;

import org.springframework.http.*;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

import java.net.URI;
import java.util.Map;
import java.util.stream.Collectors;

@RestControllerAdvice
public class GlobalErrorControlador extends ResponseEntityExceptionHandler {

    @ExceptionHandler(EquipoNoEncontradoException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public ProblemDetail handleEquipoNoEncontrado(EquipoNoEncontradoException ex,  WebRequest request){
        ProblemDetail resultado= ProblemDetail.forStatusAndDetail(HttpStatus.NOT_FOUND, ex.getMessage());
        resultado.setTitle("Equipo no encontrado");
        resultado.setType(URI.create("https://api.recreadejuerga.com/errores/equipo-no-encontrado"));
        resultado.setInstance(URI.create(request.getDescription(false).replace("uri=", "")));
        return resultado;
    }

    @ExceptionHandler(EquipoYaExistenteException.class)
    @ResponseStatus(HttpStatus.CONFLICT)
    public ProblemDetail handleEquipoYaExistente(EquipoYaExistenteException ex, WebRequest request){
        ProblemDetail resultado= ProblemDetail.forStatusAndDetail(HttpStatus.CONFLICT, ex.getMessage());
        resultado.setTitle("Equipo ya existente");
        resultado.setType(URI.create("https://api.recreadejuerga.com/errores/equipo-ya-existente"));
        resultado.setInstance(URI.create(request.getDescription(false).replace("uri=", "")));
        return resultado;
    }

    @ExceptionHandler(CamposDuplicadosException.class)
    @ResponseStatus(HttpStatus.CONFLICT)
    public ProblemDetail handleRegistroYaExistente(CamposDuplicadosException ex, WebRequest request){
        ProblemDetail resultado= ProblemDetail.forStatusAndDetail(HttpStatus.CONFLICT, ex.getMessage());
        resultado.setTitle("Campos duplicados");
        resultado.setType(URI.create("https://api.recreadejuerga.com/errores/campos-duplicados"));
        resultado.setInstance(URI.create(request.getDescription(false).replace("uri=", "")));
        resultado.setProperty("campos", ex.getCampos());
        return resultado;
    }


    @Override
    protected ResponseEntity<Object> handleMethodArgumentNotValid(
            MethodArgumentNotValidException ex,
            HttpHeaders headers,
            HttpStatusCode status,
            WebRequest request) {

        Map<String, String> errores = ex.getBindingResult()
                .getFieldErrors()
                .stream()
                .collect(Collectors.toMap(
                        FieldError::getField,
                        fe -> {
                            String msg = fe.getDefaultMessage();
                            return msg != null ? msg : "Valor inválido";
                        },
                        (msg1, msg2) -> msg1
                ));

        ProblemDetail problem = ProblemDetail.forStatusAndDetail(
                status,
                "Validación de entrada fallida"
        );
        problem.setTitle("Error de validación");
        problem.setType(URI.create("https://api.recreadejuerga.com/errores/error-validacion"));
        problem.setProperty("errors", errores);

        return handleExceptionInternal(ex, problem, headers, status, request);
    }
}
