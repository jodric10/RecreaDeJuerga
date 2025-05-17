package com.recreadejuerga.recrea.entidades;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerator;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.util.UUID;

@Entity
@Table(name = "clasificaciones")
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id")
public class Clasificacion {
    @Id
    @Column(name = "equipo_id", nullable = false)
    private UUID id;

    @OneToOne
    @MapsId
    @JoinColumn(name = "equipo_id", foreignKey = @ForeignKey(name = "fk_equipo_clasificacion"))
    private Equipo equipo;

    @Builder.Default
    @Column(name = "puntos")
    private Integer puntos = 0;

    @Builder.Default
    @Column(name = "partidos_jugados")
    private Integer partidosJugados = 0;

    @Builder.Default
    @Column(name = "ganados")
    private Integer ganados = 0;

    @Builder.Default
    @Column(name = "empatados")
    private Integer empatados = 0;

    @Builder.Default
    @Column(name = "perdidos")
    private Integer perdidos = 0;

    @Builder.Default
    @Column(name = "goles_a_favor")
    private Integer golesAFavor = 0;

    @Builder.Default
    @Column(name = "goles_contra")
    private Integer golesContra = 0;

    @Builder.Default
    @Column(name = "diferencia_goles")
    private Integer diferenciaGoles = 0;

    @Column(name = "promedio_tf_tc", precision = 4, scale = 2)
    private BigDecimal promedioTfTc = BigDecimal.valueOf(0.0);

}
