package com.recreadejuerga.recrea.dtos.jugadorParecido;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class JugadorParecidoModificarDTO {

    @NotNull
    @Size(max = 100)
    private String parecido;
}

