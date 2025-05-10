package com.recreadejuerga.recrea.entidades;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "estadisticas_jugador_partido")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id")
public class EstadisticasJugadorPartido {
    @EmbeddedId
    private EstadisticasJugadorPartidoId id;

    @ManyToOne
    @MapsId
    @JoinColumn(name = "jugador_id",foreignKey = @ForeignKey(name = "fk_jugador"))
    private Jugador jugador;

    @ManyToOne
    @MapsId
    @JoinColumn(name = "partido_id",foreignKey = @ForeignKey(name = "fk_partido"))
    private Partido partido;

    @Column(name = "goles")
    private Integer goles = 0;

    @Column(name = "asistencias")
    private Integer asistencias = 0;

    @Column(name = "amarilla")
    private Boolean amarilla = false;

    @Column(name = "roja")
    private Boolean roja = false;

    @Column(name = "portero")
    private Boolean portero = false;
}
