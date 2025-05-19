package com.recreadejuerga.recrea.dtos.jugadorparecido;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class JugadorParecidoModificarDTO {

    @NotNull
    @Size(max = 100)
    private String parecido;
}

