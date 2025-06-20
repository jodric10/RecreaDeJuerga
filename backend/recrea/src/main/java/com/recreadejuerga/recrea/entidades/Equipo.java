package com.recreadejuerga.recrea.entidades;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.UuidGenerator;
import org.hibernate.mapping.Constraint;
import org.w3c.dom.Text;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "equipos")
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id")
public class Equipo {
    @Id
    @UuidGenerator
    private UUID id;

    @OneToOne(mappedBy = "equipo", cascade = CascadeType.ALL, orphanRemoval = true)
    private Clasificacion clasificacion;

    @Column(name = "nombre", unique = true ,nullable = false, length = 100)
    private String nombre;

    @Column(name = "url_logo", columnDefinition = "TEXT")
    private String  url_logo;

    @Column(name = "eslogan", length = 50)
    private String  eslogan;

    @Column(name = "descripcion", columnDefinition = "TEXT")
    private String  descripcion;

    @Column(name = "url_equipo", columnDefinition = "TEXT")
    private String  url_equipo;


    @OneToMany(mappedBy = "equipoLocal", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Partido> partidosComoLocal = new ArrayList<>();

    @OneToMany(mappedBy = "equipoVisitante", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Partido> partidosComoVisitante = new ArrayList<>();

}
