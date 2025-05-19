package com.recreadejuerga.recrea.entidades;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.UuidGenerator;

import java.util.UUID;

@Entity
@Table(name = "jugadores_parecidos",
        uniqueConstraints = {
                @UniqueConstraint(name = "uk_jugador_parecido", columnNames = {"jugador_id", "parecido"})
        })
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id")
public class JugadorParecido {

    @Id
    @UuidGenerator
    private UUID id;

    @ManyToOne
    @JoinColumn(name = "jugador_id", foreignKey = @ForeignKey(name = "fk_jugador"))
    private Jugador jugador;

    private String parecido;
}
