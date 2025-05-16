package com.recreadejuerga.recrea.repositorios;

import com.recreadejuerga.recrea.entidades.Jugador;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface JugadorRepositorio extends JpaRepository<Jugador, UUID> {

    @Query("""
            SELECT j
            FROM Jugador j
            WHERE equipo = :equipo_id
            """)
    List<Jugador> getJugadoresByEquipo(@Param("equipo_id") UUID equipo_id);

    @Query("""
            SELECT j
            FROM Jugador j
            WHERE dorsal = :dorsal AND equipo_id = :equipo_id
            """)
    Optional<Jugador> getJugador(@Param("dorsal") Integer dorsal, @Param("equipo_id") UUID equipo_id);

    @Modifying
    @Transactional
    @Query("""
    UPDATE Jugador j SET
        j.nombre = :nombre,
        j.apodo = :apodo,
        j.dorsal = :dorsal,
        j.posicion = :posicion,
        j.pieDominante = :pieDominante,
        j.golesTotales = :golesTotales,
        j.asistenciasTotales = :asistenciasTotales,
        j.fortalezas = :fortalezas,
        j.fechaNacimiento = :fechaNacimiento,
        j.fotoFrontal = :fotoFrontal,
        j.fotoTarjeta = :fotoTarjeta,
        j.fotoPose = :fotoPose
    WHERE j.id = :id
""")
    void actualizarJugador(
            @Param("id") UUID id,
            @Param("nombre") String nombre,
            @Param("apodo") String apodo,
            @Param("dorsal") Integer dorsal,
            @Param("posicion") String posicion,
            @Param("pieDominante") String pieDominante,
            @Param("golesTotales") Integer golesTotales,
            @Param("asistenciasTotales") Integer asistenciasTotales,
            @Param("fortalezas") String fortalezas,
            @Param("fechaNacimiento") LocalDate fechaNacimiento,
            @Param("fotoFrontal") String fotoFrontal,
            @Param("fotoTarjeta") String fotoTarjeta,
            @Param("fotoPose") String fotoPose
    );

    @Modifying
    @Transactional
    @Query("DELETE FROM Jugador j WHERE j.id = :id")
    void eliminarJugador(@Param("id") UUID id);

}
