package com.recreadejuerga.recrea.repositorios;

import com.recreadejuerga.recrea.dtos.clasificacion.ClasificacionDTO;
import com.recreadejuerga.recrea.entidades.Clasificacion;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface ClasificacionRepositorio extends JpaRepository<Clasificacion, UUID> {

    @Query("SELECT c FROM Clasificacion c WHERE LOWER(c.equipo.nombre) = LOWER(:nombre)")
    Optional<Clasificacion> findByNombreEquipo(@Param("nombre") String nombre);

    @Modifying
    @Transactional
    @Query("""
            UPDATE Clasificacion c
            SET c.puntos = :puntos,
                c.partidosJugados = :partidosJugados,
                c.ganados = :ganados,
                c.empatados = :empatados,
                c.perdidos = :perdidos,
                c.golesAFavor = :golesAFavor,
                c.golesContra = :golesContra,
                c.diferenciaGoles = :diferenciaGoles,
                c.promedioTfTc = :promedioTfTc
            WHERE c.id = :id
           """)
    void actualizarClasificacion(
            @Param("id") UUID id,
            @Param("puntos") Integer puntos,
            @Param("partidosJugados") Integer partidosJugados,
            @Param("ganados") Integer ganados,
            @Param("empatados") Integer empatados,
            @Param("perdidos") Integer perdidos,
            @Param("golesAFavor") Integer golesAFavor,
            @Param("golesContra") Integer golesContra,
            @Param("diferenciaGoles") Integer diferenciaGoles,
            @Param("promedioTfTc") BigDecimal promedioTfTc
    );
}
