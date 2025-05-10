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

    @Column(name = "posicion")
    private Integer posicion;

    @Column(name = "puntos")
    private Integer puntos = 0;

    @Column(name = "partidos_jugados")
    private Integer partidosJugados = 0;

    @Column(name = "ganados")
    private Integer ganados = 0;

    @Column(name = "empatados")
    private Integer empatados = 0;

    @Column(name = "perdidos")
    private Integer perdidos = 0;

    @Column(name = "goles_favor")
    private Integer golesFavor = 0;

    @Column(name = "goles_contra")
    private Integer golesContra = 0;

    @Column(name = "diferencia_goles")
    private Integer diferenciaGoles = 0;

    @Column(name = "promedio_tf_tc", precision = 4, scale = 2)
    private BigDecimal promedioTfTc;
}
