package com.recreadejuerga.recrea.entidades;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.UuidGenerator;

import java.time.LocalDate;
import java.util.*;

@Entity
@Table(name = "jugadores",
        uniqueConstraints = {
            @UniqueConstraint(name = "uk_jugador_equipo_dorsal", columnNames = {"equipo_id", "dorsal"})
        })
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id")
public class  Jugador {
        @Id
        @UuidGenerator
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

        @OneToMany(mappedBy = "mvp",cascade = CascadeType.ALL, orphanRemoval = true)
        private List<Partido> partidosComoMvp= new ArrayList<>();

        @Column(name = "cromo", columnDefinition = "TEXT")
        private String cromo;

        @Column(name = "foto_pose", columnDefinition = "TEXT")
        private String fotoPose;

        @Column(name = "num_coleccionable")
        private Integer num_coleccionable = 0;
}
