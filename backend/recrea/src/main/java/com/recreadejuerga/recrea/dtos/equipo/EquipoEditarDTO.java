package com.recreadejuerga.recrea.dtos.equipo;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.validator.constraints.URL;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class EquipoEditarDTO {
    @NotBlank(message = "El nombre no puede estar vacío")
    private String nombre;

    @URL(message = "Debe ser una URL válida")
    private String url_logo;
}
