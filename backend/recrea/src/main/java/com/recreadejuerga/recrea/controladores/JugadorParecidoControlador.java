package com.recreadejuerga.recrea.controladores;

import com.recreadejuerga.recrea.dtos.jugadorParecido.JugadorParecidoDTO;
import com.recreadejuerga.recrea.dtos.jugadorParecido.JugadorParecidoInsertarDTO;
import com.recreadejuerga.recrea.dtos.jugadorParecido.JugadorParecidoModificarDTO;
import com.recreadejuerga.recrea.servicios.JugadorParecidoServicio;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.ExampleObject;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ProblemDetail;
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
            description = "Permite obtener todos los parecidos de un jugador si se le proporciona su ID.",
            tags = {"parámetros", "detalles"}
    )
    @ApiResponses({
            @ApiResponse(
                    responseCode = "200",
                    description = "Parecidos encontrados correctamente",
                    content = @Content(
                            mediaType = "application/json",
                            schema = @Schema(implementation = JugadorParecidoDTO.class),
                            examples = {
                                    @ExampleObject("""
                                                [
                                                  {
                                                    "id": "f12a0f65-9c1d-4e93-8ef1-1d2a05b36fa3",
                                                    "jugadorId": "5c1d46be-1a23-4fa8-8c6e-7e6e9f98dfbb",
                                                    "parecido": "Cristiano Ronaldo"
                                                  },
                                                  {
                                                    "id": "b27d6cf1-7e25-44c1-bcb1-b75c3e7a4472",
                                                    "jugadorId": "5c1d46be-1a23-4fa8-8c6e-7e6e9f98dfbb",
                                                    "parecido": "Kylian Mbappé"
                                                  },
                                                  {
                                                    "id": "3ef789a9-351e-42dd-8790-8d4fe1f1cd12",
                                                    "jugadorId": "5c1d46be-1a23-4fa8-8c6e-7e6e9f98dfbb",
                                                    "parecido": "Neymar Jr"
                                                  }
                                                ]
                                            """)
                            }
                    )
            ),
            @ApiResponse(
                    responseCode = "404",
                    description = "No se encontraron parecidos para el jugador",
                    content = @Content(
                            mediaType = "application/problem+json",
                            schema = @Schema(implementation = ProblemDetail.class),
                            examples = {
                                    @ExampleObject(
                                            name = "Parecidos no encontrados",
                                            value = """
                                                        {
                                                          "type": "https://api.recreadejuerga.com/errores/parecido-no-encontrado",
                                                          "title": "Parecido no encontrado",
                                                          "status": 404,
                                                          "detail": "El parecido del jugador con id(5c1d46be-1a23-4fa8-8c6e-7e6e9f98dfbb) no fue encontrado.",
                                                          "instance": "/parecidos/5c1d46be-1a23-4fa8-8c6e-7e6e9f98dfbb"
                                                        }
                                                    """
                                    )
                            }
                    )
            )
    })
    @GetMapping("{jugador_id}")
    public ResponseEntity<List<JugadorParecidoDTO>> getParecidosDeUnJugador(
            @Parameter(description = "Identificador del jugador") @PathVariable UUID jugador_id) {
        List<JugadorParecidoDTO> parecidos = jugadorParecidoServicio.getParecidosDeJugador(jugador_id);
        return ResponseEntity.ok(parecidos);
    }


    @Operation(
            summary = "Insertar el parecido de un jugador en la base de datos",
            description = "Permite registrar un parecido de un jugador proporcionando su ID y el nombre del parecido. Valida que no exista duplicación previa.",
            tags = {"parámetros", "creación"}
    )
    @ApiResponses({
            @ApiResponse(
                    responseCode = "201",
                    description = "El parecido fue insertado correctamente",
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
            ),
            @ApiResponse(
                    responseCode = "409",
                    description = "El jugador ya tiene ese parecido registrado o se ha violado una restricción de unicidad",
                    content = @Content(
                            mediaType = "application/problem+json",
                            schema = @Schema(implementation = ProblemDetail.class),
                            examples = {
                                    @ExampleObject(
                                            name = "Parecido ya registrado (excepción personalizada)",
                                            value = """
                                                        {
                                                          "type": "https://api.recreadejuerga.com/errores/parecido-ya-existente",
                                                          "title": "Parecido ya existente",
                                                          "status": 409,
                                                          "detail": "Lo siento, pero ya tiene el jugador con id(a41a8f6e-8e8d-4f2a-aef3-829a2d13b4de) el parecido con Cristiano Ronaldo.",
                                                          "instance": "/parecidos/alta"
                                                        }
                                                    """
                                    ),
                                    @ExampleObject(
                                            name = "Violación de unicidad (fallback BD)",
                                            value = """
                                                        {
                                                          "type": "https://api.recreadejuerga.com/errores/campos-duplicados",
                                                          "title": "Campos duplicados",
                                                          "status": 409,
                                                          "detail": "Violación de restricción de unicidad",
                                                          "instance": "/parecidos/alta",
                                                          "campos": {
                                                            "parecido": "Ya existe este parecido para este jugador (clave única: uk_jugador_parecido)."
                                                          }
                                                        }
                                                    """
                                    )
                            }
                    )
            )
    })
    @PostMapping("/alta")
    public ResponseEntity<JugadorParecidoDTO> crear(
            @io.swagger.v3.oas.annotations.parameters.RequestBody(
                    description = "Parecido del jugador a crear",
                    required = true,
                    content = @Content(
                            mediaType = "application/json",
                            schema = @Schema(implementation = JugadorParecidoInsertarDTO.class),
                            examples = {
                                    @ExampleObject("""
                                                {
                                                  "jugadorId": "a41a8f6e-8e8d-4f2a-aef3-829a2d13b4de",
                                                  "parecido": "Cristiano Ronaldo"
                                                }
                                            """)
                            }
                    )
            ) @Valid @RequestBody JugadorParecidoInsertarDTO jugador
    ) {
        return ResponseEntity.status(HttpStatus.CREATED).body(jugadorParecidoServicio.insertarJugadorParecido(jugador));
    }


    @Operation(
            summary = "Modificar un parecido de un jugador en la base de datos",
            description = "Permite editar el nombre de un parecido ya registrado para un jugador, usando el ID del parecido. Valida conflictos y existencia.",
            tags = {"parámetros", "actualizar"}
    )
    @ApiResponses({
            @ApiResponse(
                    responseCode = "200",
                    description = "Parecido del jugador actualizado correctamente",
                    content = @Content(
                            mediaType = "application/json",
                            schema = @Schema(implementation = JugadorParecidoDTO.class),
                            examples = @ExampleObject("""
                                        {
                                          "id": "f12a0f65-9c1d-4e93-8ef1-1d2a05b36fa3",
                                          "jugadorId": "a41a8f6e-8e8d-4f2a-aef3-829a2d13b4de",
                                          "parecido": "Cristiano Ronaldo"
                                        }
                                    """)
                    )
            ),
            @ApiResponse(
                    responseCode = "404",
                    description = "El parecido no fue encontrado con el ID proporcionado",
                    content = @Content(
                            mediaType = "application/problem+json",
                            schema = @Schema(implementation = ProblemDetail.class),
                            examples = @ExampleObject("""
                                        {
                                          "type": "https://api.recreadejuerga.com/errores/parecido-no-encontrado",
                                          "title": "Parecido no encontrado",
                                          "status": 404,
                                          "detail": "El parecido del jugador con id(f12a0f65-9c1d-4e93-8ef1-1d2a05b36fa3) no fue encontrado.",
                                          "instance": "/parecidos/{id}"
                                        }
                                    """)
                    )
            ),
            @ApiResponse(
                    responseCode = "409",
                    description = "Conflicto: el nuevo parecido ya existe para este jugador",
                    content = @Content(
                            mediaType = "application/problem+json",
                            schema = @Schema(implementation = ProblemDetail.class),
                            examples = @ExampleObject("""
                                        {
                                          "type": "https://api.recreadejuerga.com/errores/campos-duplicados",
                                          "title": "Campos duplicados",
                                          "status": 409,
                                          "detail": "Violación de restricción de unicidad",
                                          "instance": "/parecidos/{id}",
                                          "campos": {
                                            "parecido": "Ya existe este parecido para este jugador (clave única: uk_jugador_parecido)."
                                          }
                                        }
                                    """)
                    )
            )
    })
    @PutMapping("/{id}")
    public ResponseEntity<JugadorParecidoDTO> editar(
            @io.swagger.v3.oas.annotations.parameters.RequestBody(
                    description = "Parecido del jugador a editar",
                    required = true,
                    content = @Content(
                            mediaType = "application/json",
                            schema = @Schema(implementation = JugadorParecidoModificarDTO.class),
                            examples = @ExampleObject("""
                                        {
                                          "parecido": "Andrés Iniesta"
                                        }
                                    """)
                    )
            )
            @Valid @RequestBody JugadorParecidoModificarDTO parecidoJugador,
            @Parameter(description = "Identificador del parecido") @PathVariable UUID id
    ) {
        JugadorParecidoDTO actualizado = jugadorParecidoServicio.modificarJugadorParecido(parecidoJugador, id);
        return ResponseEntity.ok(actualizado);
    }


    @Operation(
            summary = "Borrar un parecido de un jugador",
            description = "Elimina un parecido de un jugador existente a partir del ID del parecido. Si no existe, devuelve un error 404.",
            tags = {"parámetros", "eliminar"}
    )
    @ApiResponses({
            @ApiResponse(
                    responseCode = "204",
                    description = "Parecido eliminado correctamente"
            ),
            @ApiResponse(
                    responseCode = "404",
                    description = "El parecido del jugador no fue encontrado",
                    content = @Content(
                            mediaType = "application/problem+json",
                            schema = @Schema(implementation = ProblemDetail.class),
                            examples = @ExampleObject("""
                                        {
                                          "type": "https://api.recreadejuerga.com/errores/parecido-no-encontrado",
                                          "title": "Parecido no encontrado",
                                          "status": 404,
                                          "detail": "El parecido del jugador con id(f12a0f65-9c1d-4e93-8ef1-1d2a05b36fa3) no fue encontrado.",
                                          "instance": "/parecidos/f12a0f65-9c1d-4e93-8ef1-1d2a05b36fa3"
                                        }
                                    """)
                    )
            )
    })
    @DeleteMapping("/{id}")
    public ResponseEntity<?> eliminar(
            @Parameter(description = "Identificador del parecido") @PathVariable UUID id
    ) {
        jugadorParecidoServicio.eliminarParecido(id);
        return ResponseEntity.noContent().build();
    }

}
