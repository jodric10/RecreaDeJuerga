package com.recreadejuerga.recrea.entidades;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;
import java.util.*;

@Entity
@Table(name = "jugadores",
        uniqueConstraints = {
            @UniqueConstraint(name = "unique_dorsal_por_team", columnNames = {"equipo_id", "dorsal"})
        })
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id")
public class Jugador {
        @Id
        @Column(name = "id", nullable = false)
        private UUID id;

        @Column(name = "nombre", nullable = false, length = 100)
        private String nombre;

        @Column(name = "apodo", length = 100)
        private String apodo;

        @Column(name = "dorsal", nullable = false)
        private Integer dorsal;

        @Column(name = "posicion", length = 50)
        private String posicion;

        @Column(name = "pie_dominante", length = 10)
        private String pieDominante;

        @Column(name = "goles_totales")
        private Integer golesTotales = 0;

        @Column(name = "asistencias_totales")
        private Integer asistenciasTotales = 0;

        @Column(name = "fortalezas", columnDefinition = "TEXT")
        private String fortalezas;

        @Column(name = "fecha_nacimiento")
        private LocalDate fechaNacimiento;

        @ManyToOne
        @JoinColumn(name = "equipo_id", nullable = false, foreignKey = @ForeignKey(name = "fk_equipo"))
        private Equipo equipo;

        @OneToMany(mappedBy = "jugador", cascade = CascadeType.ALL, orphanRemoval = true)
        private List<EstadisticasJugadorPartido> estadisticas= new ArrayList<>();

        @OneToMany(mappedBy = "jugador", cascade = CascadeType.ALL, orphanRemoval = true)
        private List<JugadorParecido> parecidos= new ArrayList<>();

        @ManyToMany
        @JoinTable(
                name = "jugadores_nacionalidad",
                joinColumns = @JoinColumn(name = "jugador_id"),
                inverseJoinColumns = @JoinColumn(name = "nacionalidad_id")
        )
        private Set<Nacionalidad> nacionalidades = new HashSet<>();

        @OneToMany(mappedBy = "mvp",cascade = CascadeType.ALL,orphanRemoval = true)
        private List<Partido> partidosComoMvp= new ArrayList<>();

        @Column(name = "foto_frontal", columnDefinition = "TEXT")
        private String fotoFrontal;

        @Column(name = "foto_tarjeta", columnDefinition = "TEXT")
        private String fotoTarjeta;

        @Column(name = "foto_pose", columnDefinition = "TEXT")
        private String fotoPose;

}
