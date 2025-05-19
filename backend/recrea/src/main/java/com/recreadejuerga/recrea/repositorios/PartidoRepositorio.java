package com.recreadejuerga.recrea.repositorios;

import com.recreadejuerga.recrea.entidades.Equipo;
import com.recreadejuerga.recrea.entidades.Jugador;
import com.recreadejuerga.recrea.entidades.Partido;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface PartidoRepositorio extends JpaRepository<Partido, UUID> {

    @Query("""
            SELECT p
            FROM Partido p
            WHERE p.equipoLocal.id = :equipo_id OR p.equipoVisitante.id = :equipo_id
            ORDER BY p.fecha ASC
          """)
    List<Partido> getPartidosDeUnEquipo(@Param("equipo_id") UUID equipo_id);

    @Query("""
            SELECT p
            FROM Partido p
            WHERE p.fecha = :fecha
            AND LOWER(p.lugar) = LOWER(:lugar)
        """)
    Optional<Partido> buscarPorFechaYLugar(
            @Param("fecha") LocalDateTime fecha,
            @Param("lugar") String lugar
    );


    @Modifying
    @Transactional
    @Query("""
            UPDATE Partido p SET
            p.fecha = :fecha,
            p.lugar = :lugar,
            p.estado = :estado,
            p.equipoLocal = :equipoLocal,
            p.equipoVisitante = :equipoVisitante,
            p.golesLocal = :golesLocal,
            p.golesVisitante = :golesVisitante,
            p.mvp = :mvp
            WHERE p.id = :id
           """)
    void actualizarPartido(
            @Param("id") UUID id,
            @Param("fecha") LocalDateTime fecha,
            @Param("lugar") String lugar,
            @Param("estado") String estado,
            @Param("equipoLocal") Equipo equipoLocal,
            @Param("equipoVisitante") Equipo equipoVisitante,
            @Param("golesLocal") Integer golesLocal,
            @Param("golesVisitante") Integer golesVisitante,
            @Param("mvp") Jugador mvp
    );

}
