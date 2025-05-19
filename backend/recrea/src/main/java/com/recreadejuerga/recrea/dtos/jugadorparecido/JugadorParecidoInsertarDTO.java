package com.recreadejuerga.recrea.dtos.jugadorparecido;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class JugadorParecidoInsertarDTO {

    @NotNull
    private UUID jugadorId;

    @NotNull
    @Size(max = 100)
    private String parecido;
}
