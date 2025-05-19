package com.recreadejuerga.recrea.repositorios;

import com.recreadejuerga.recrea.entidades.JugadorParecido;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface JugadoresParecidosRepositorio extends JpaRepository<JugadorParecido, UUID> {

    @Query("""
            SELECT jp
            FROM JugadorParecido jp
            WHERE jp.jugador.id = :jugador_id
            """)
    List<JugadorParecido> getParecidosByJugadorId(@Param("jugador_id")UUID jugador_id);


    @Query("""
            SELECT jp
            FROM JugadorParecido jp
            WHERE jp.jugador.id = :jugador_id AND LOWER(jp.parecido) = LOWER(:parecido)
            """)
    Optional<JugadorParecido> existsByJugadorIdAndParecido(@Param("jugador_id") UUID jugador_id, @Param("parecido") String parecido);

    @Modifying
    @Transactional
    @Query("UPDATE JugadorParecido jp SET jp.parecido = :parecido WHERE jp.id = :id")
    void actualizarParecido(@Param("id") UUID id, @Param("parecido") String parecido);

}
