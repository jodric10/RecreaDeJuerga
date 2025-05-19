package com.recreadejuerga.recrea.dtos.partido;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.*;

import java.time.LocalDateTime;
import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PartidoFormularioDTO {

    @NotNull
    private LocalDateTime fecha;

    @NotNull
    @Size(max = 100)
    private String lugar;

    @NotNull
    @Size(max = 20)
    private String estado;

    @NotNull
    private UUID equipoLocalId;

    @NotNull
    private UUID equipoVisitanteId;

    private Integer golesLocal;

    private Integer golesVisitante;

    private UUID mvpId;
}
