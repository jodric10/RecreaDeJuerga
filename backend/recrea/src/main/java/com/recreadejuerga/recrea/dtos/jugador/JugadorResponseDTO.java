package com.recreadejuerga.recrea.dtos.jugador;
import com.recreadejuerga.recrea.dtos.equipo.EquipoDTO;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class JugadorResponseDTO {
    private JugadorDTO jugador;
    private EquipoDTO equipo;
}
