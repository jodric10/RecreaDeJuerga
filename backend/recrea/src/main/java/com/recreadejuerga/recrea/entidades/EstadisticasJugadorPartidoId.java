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
public class EstadisticasJugadorPartidoId implements Serializable {

    @Column(name = "jugador_id")
    private UUID jugadorId;

    @Column(name = "partido_id")
    private UUID partidoId;
}
