package com.recreadejuerga.recrea.dtos.equipo;

import jakarta.validation.constraints.NotBlank;
import lombok.*;
import org.hibernate.validator.constraints.URL;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class EquipoFormularioDTO {
    @NotBlank(message = "El nombre no puede estar vacío")
    private String nombre;

    private String url_logo;

    private String eslogan;

    private String descripcion;

    private String url_equipo;
}
