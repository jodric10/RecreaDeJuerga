package com.recreadejuerga.recrea.entidades;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.*;

import java.io.Serializable;
import java.util.UUID;

@Embeddable
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
public class JugadorParecidoId implements Serializable {

    @Column(name = "jugador_id", nullable = false)
    private UUID jugadorId;

    @Column(name = "parecido", nullable = false, length = 100)
    private String parecido;
}
