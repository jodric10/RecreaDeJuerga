package com.recreadejuerga.recrea.entidades;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.UuidGenerator;

import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Table(name = "partidos",
        uniqueConstraints = {
        @UniqueConstraint(name = "uk_partido_fecha_lugar", columnNames = {"fecha","lugar"}),
                @UniqueConstraint(name = "uk_partido_equipo_local_equipo_visitante", columnNames = {"equipo_local","equipo_visitante"})
        })
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id")
public class Partido {
        @Id
        @UuidGenerator
        private UUID id;

        @Column(name = "fecha", nullable = false)
        private LocalDateTime fecha;

        @Column(name = "lugar", nullable = false, length = 100)
        private String lugar;

        @Column(name = "estado", nullable = false, length = 20)
        private String estado;

        @ManyToOne
        @JoinColumn(name = "equipo_local", foreignKey = @ForeignKey(name = "fk_equipo_local"))
        private Equipo equipoLocal;

        @ManyToOne
        @JoinColumn(name = "equipo_visitante", foreignKey = @ForeignKey(name = "fk_equipo_visitante"))
        private Equipo equipoVisitante;

        @Column(name = "goles_local")
        private Integer golesLocal;

        @Column(name = "goles_visitante")
        private Integer golesVisitante;

        @ManyToOne
        @JoinColumn(name = "mvp_id", foreignKey = @ForeignKey(name = "fk_mvp"))
        private Jugador mvp;
}
