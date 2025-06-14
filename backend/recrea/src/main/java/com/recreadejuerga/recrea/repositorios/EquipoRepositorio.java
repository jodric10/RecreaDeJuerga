package com.recreadejuerga.recrea.repositorios;

import com.recreadejuerga.recrea.entidades.Equipo;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface EquipoRepositorio extends JpaRepository<Equipo, UUID> {

    @Query("""
            SELECT e 
            FROM Equipo e
            WHERE LOWER(e.nombre) = LOWER(:nombre)
            """)
    Optional<Equipo> buscarPorNombre(@Param("nombre") String nombre);



    @Modifying
    @Transactional
    @Query("""
        UPDATE Equipo e
        SET e.nombre = :nombre,
            e.url_logo = :url_logo,
            e.eslogan = :eslogan,
            e.descripcion = :descripcion,
            e.url_equipo = :url_equipo
        WHERE e.id = :id
        """)
    void actualizarEquipo(
            @Param("id") UUID id,
            @Param("nombre") String nombre,
            @Param("url_logo") String url_logo,
            @Param("eslogan") String eslogan,
            @Param("descripcion") String descripcion,
            @Param("url_equipo") String url_equipo
    );


    @Modifying
    @Transactional
    @Query("DELETE FROM Equipo e WHERE e.id = :id")
    void eliminarEquipo(@Param("id") UUID id);
}
