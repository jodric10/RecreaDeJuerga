package com.recreadejuerga.recrea.repositorios;

import com.recreadejuerga.recrea.entidades.EstadisticasJugadorPartido;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface EstadisticasJugadorPartidoRepositorio extends JpaRepository<EstadisticasJugadorPartido, UUID> {

    @Query("""
            SELECT ejp
            FROM EstadisticasJugadorPartido ejp
            WHERE ejp.partido.id = :partido_id
            """)
    List<EstadisticasJugadorPartido> getEstaditicasJugadoresPorPartido(@Param("partido_id") UUID partido_id);

    @Query("""
            SELECT ejp
            FROM EstadisticasJugadorPartido ejp
            WHERE ejp.jugador.id = :jugador_id
            """)
    List<EstadisticasJugadorPartido> getEstadisticasDeUnJugador(@Param("jugador_id") UUID jugador_id);

    @Query("""
            SELECT ejp
            FROM EstadisticasJugadorPartido ejp
            WHERE ejp.jugador.id = :jugador_id AND ejp.partido.id = :partido_id
            """)
    Optional<EstadisticasJugadorPartido> getEstadisticasDeUnJugadorEnUnPartido(@Param("jugador_id") UUID jugador_id, @Param("partido_id") UUID partido_id);

    @Modifying
    @Transactional
    @Query("""
    UPDATE EstadisticasJugadorPartido e
    SET e.goles = :goles,
        e.asistencias = :asistencias,
        e.amarilla = :amarilla,
        e.roja = :roja,
        e.portero = :portero
    WHERE e.id = :id
""")
    void actualizarEstadisticas(
            @Param("id") UUID id,
            @Param("goles") int goles,
            @Param("asistencias") int asistencias,
            @Param("amarilla") boolean amarilla,
            @Param("roja") boolean roja,
            @Param("portero") boolean portero
    );

}
