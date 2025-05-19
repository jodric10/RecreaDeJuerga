package com.recreadejuerga.recrea.controladores;

import com.recreadejuerga.recrea.dtos.jugadorparecido.JugadorParecidoDTO;
import com.recreadejuerga.recrea.dtos.jugadorparecido.JugadorParecidoInsertarDTO;
import com.recreadejuerga.recrea.dtos.jugadorparecido.JugadorParecidoModificarDTO;
import com.recreadejuerga.recrea.servicios.JugadorParecidoServicio;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.ExampleObject;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/jugadoresParecidos")
@Tag(name = "Jugadores parecidos", description = "Gestión básica de los parecidos de los jugadores")
public class JugadorParecidoControlador {

    @Autowired
    private JugadorParecidoServicio jugadorParecidoServicio;

    @Operation(
            summary = "Obtener todos los parecidos de un jugador en concreto",
            description = "Permite obtener todos los parecidos de un jugador de un equipo si se le proporciona un jugador_id",
            tags = {"parámetros","detalles"}
    )
    @ApiResponse(
            description = "Parecidos de los jugadores de un equipo", responseCode = "200",
            content = @Content(
                    mediaType = "application/json",
                    schema = @Schema(implementation = JugadorParecidoDTO.class),
                    examples = {
                            @ExampleObject("""
                                    [
                                      {
                                        "id": "f12a0f65-9c1d-4e93-8ef1-1d2a05b36fa3",
                                        "jugadorId": "a41a8f6e-8e8d-4f2a-aef3-829a2d13b4de",
                                        "parecido": "Cristiano Ronaldo"
                                      },
                                      {
                                        "id": "b27d6cf1-7e25-44c1-bcb1-b75c3e7a4472",
                                        "jugadorId": "8dcf9d5f-77f0-45e2-b0dc-2c4f8e2eb0ea",
                                        "parecido": "Kylian Mbappé"
                                      },
                                      {
                                        "id": "3ef789a9-351e-42dd-8790-8d4fe1f1cd12",
                                        "jugadorId": "d909a8be-d03a-490d-986a-45d10d7dcb94",
                                        "parecido": "Neymar Jr"
                                      }
                                    ]
                                    
                                    """)
                    }
            )
    )
    @GetMapping("{jugador_id}")
    public ResponseEntity<List<JugadorParecidoDTO>> getParecidosDeUnJugador(@Parameter(description = "Identificador del jugador") @PathVariable UUID jugador_id){
        List<JugadorParecidoDTO> parecidos= jugadorParecidoServicio.getParecidosDeJugador(jugador_id);
        return ResponseEntity.ok(parecidos);
    }


    @Operation(
            summary = "Para insertar el parecido del jugador de un equipo en la base de datos",
            description = "Permite insertar un parecido de un jugador proporcionando un DTO con los datos y un id",
            tags = {"parámetros","creación"}
    )
    @ApiResponse(
            description = "El parecido del jugador insertado en la base de datos", responseCode = "200",
            content = @Content(
                    mediaType = "application/json",
                    schema = @Schema(implementation = JugadorParecidoDTO.class),
                    examples = {
                            @ExampleObject("""
                                    {
                                        "id": "f12a0f65-9c1d-4e93-8ef1-1d2a05b36fa3",
                                        "jugadorId": "a41a8f6e-8e8d-4f2a-aef3-829a2d13b4de",
                                        "parecido": "Cristiano Ronaldo"
                                      }
                                    """)
                    }
            )
    )
    @PostMapping("/alta")
    public ResponseEntity<JugadorParecidoDTO> crear(@io.swagger.v3.oas.annotations.parameters.RequestBody(
            description = "Parecido del jugador a crear",
            required = true,
            content = @Content(
                    mediaType = "application/json",
                    schema = @Schema(implementation = JugadorParecidoInsertarDTO.class),
                    examples = {
                            @ExampleObject("""
                                    {
                                        "jugadorId": "7fd1e2a3-1b4a-457f-bb72-dfc2fd0f567e",
                                        "parecido": "Andrés Iniesta"
                                      }
                                    """)
                    }
            )
    ) @Valid @RequestBody JugadorParecidoInsertarDTO jugador) {
        return ResponseEntity.status(HttpStatus.CREATED).body(jugadorParecidoServicio.insertarJugadorParecido(jugador));
    }

    @Operation(
            summary = "Para modificar un parecido de un jugador en la base de datos",
            description = "Permite editar un parecido de un jugador proporcionando un DTO con los datos y un id",
            tags = {"parámetros","actualizar"}
    )
    @ApiResponse(
            description = "El parecido del jugador actualizado en la base de datos", responseCode = "200",
            content = @Content(
                    mediaType = "application/json",
                    schema = @Schema(implementation = JugadorParecidoDTO.class),
                    examples = {
                            @ExampleObject("""
                                     {
                                        "id": "f12a0f65-9c1d-4e93-8ef1-1d2a05b36fa3",
                                        "jugadorId": "a41a8f6e-8e8d-4f2a-aef3-829a2d13b4de",
                                        "parecido": "Cristiano Ronaldo"
                                      }
                                    """)
                    }
            )
    )
    @PutMapping("/{id}")
    public ResponseEntity<JugadorParecidoDTO> editar(@io.swagger.v3.oas.annotations.parameters.RequestBody(
            description = "Parecido del jugador para editar",
            required = true,
            content = @Content(
                    mediaType = "application/json",
                    schema = @Schema(implementation = JugadorParecidoModificarDTO.class),
                    examples = {
                            @ExampleObject("""
                                     {
                                        "parecido": "Andrés Iniesta"
                                      }
                                    """)
                    }
            )
    ) @Valid @RequestBody JugadorParecidoModificarDTO parecidoJugador, @Parameter(description = "Identificador del parecido") @PathVariable UUID id){
        JugadorParecidoDTO actualizado = jugadorParecidoServicio.modificarJugadorParecido(parecidoJugador,id);
        return ResponseEntity.ok(actualizado);
    }


    @Operation(
            summary = "Para borrar un parecido de un jugador de la base de datos",
            description = "Permite borrar un parecido de un jugador mediante un id",
            tags = {"parámetros","eliminar"}
    )
    @ApiResponse(
            description = "El parecido del jugador eliminado en la base de datos", responseCode = "204"
    )
    @DeleteMapping("/{id}")
    public ResponseEntity<?> eliminar(@Parameter(description = "Identificador del parecido") @PathVariable UUID id){
        jugadorParecidoServicio.eliminarParecido(id);
        return ResponseEntity.noContent().build();
    }
}
