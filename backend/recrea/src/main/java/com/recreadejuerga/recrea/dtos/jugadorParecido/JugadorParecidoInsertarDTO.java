package com.recreadejuerga.recrea.dtos.jugadorParecido;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.*;

import java.util.UUID;
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class JugadorParecidoInsertarDTO {

    @NotNull
    private UUID jugadorId;

    @NotNull
    @Size(max = 100)
    private String parecido;
}
