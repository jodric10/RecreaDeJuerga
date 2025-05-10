package com.recreadejuerga.recrea.entidades;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "jugadores_parecidos")
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id")
public class JugadorParecido {
    @EmbeddedId
    private JugadorParecidoId id;

    @ManyToOne
    @MapsId("jugadorId")
    @JoinColumn(name = "jugador_id", foreignKey = @ForeignKey(name = "fk_jugador"))
    private Jugador jugador;
}
