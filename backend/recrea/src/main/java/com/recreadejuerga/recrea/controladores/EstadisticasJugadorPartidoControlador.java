package com.recreadejuerga.recrea.controladores;

import com.recreadejuerga.recrea.dtos.estadisticasJugadorPartido.EstadisticasJugadorPartidoActualizarDTO;
import com.recreadejuerga.recrea.dtos.estadisticasJugadorPartido.EstadisticasJugadorPartidoDTO;
import com.recreadejuerga.recrea.dtos.estadisticasJugadorPartido.EstadisticasJugadorPartidoInsertarDTO;
import com.recreadejuerga.recrea.servicios.EstadisticasJugadorPartidoServicio;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.media.ArraySchema;
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
@RequestMapping("/api/estadisticas")
@CrossOrigin(origins = "http://localhost:4200", allowCredentials = "true")
@Tag(name = "Estadísticas jugador-partido", description = "Operaciones CRUD sobre estadísticas de jugadores en partidos")
public class EstadisticasJugadorPartidoControlador {

    @Autowired
    private EstadisticasJugadorPartidoServicio estadisticasJugadorPartidoServicio;

    @Operation(
            summary = "Obtener estadísticas de un partido por ID",
            description = "Devuelve todas las estadísticas individuales de los jugadores que han participado en un partido determinado, identificándolo por su ID. " +
                    "Incluye datos como goles, asistencias, tarjetas y si fue portero.",
            tags = {"parámetros", "detalles"}
    )
    @ApiResponses({
            @ApiResponse(
                    responseCode = "200",
                    description = "Lista de estadísticas del partido",
                    content = @Content(
                            mediaType = "application/json",
                            array = @ArraySchema(schema = @Schema(implementation = EstadisticasJugadorPartidoDTO.class)),
                            examples = @ExampleObject(value = """
                                        [
                                          {
                                            "id": "aaa11111-bbbb-cccc-dddd-000000000001",
                                            "partidoId": "11111111-aaaa-bbbb-cccc-123456789abc",
                                            "jugador": {
                                              "id": "00000000-1111-2222-3333-444444444001",
                                              "nombre": "Vinícius Júnior",
                                              "apodo": "Vini",
                                              "dorsal": 7,
                                              "posicion": "Extremo Izquierdo"
                                            },
                                            "goles": 1,
                                            "asistencias": 1,
                                            "amarilla": false,
                                            "roja": false,
                                            "portero": false
                                          },
                                          {
                                            "id": "aaa11111-bbbb-cccc-dddd-000000000002",
                                            "partidoId": "11111111-aaaa-bbbb-cccc-123456789abc",
                                            "jugador": {
                                              "id": "00000000-1111-2222-3333-444444444002",
                                              "nombre": "Jude Bellingham",
                                              "apodo": "Bellingham",
                                              "dorsal": 5,
                                              "posicion": "Centrocampista"
                                            },
                                            "goles": 2,
                                            "asistencias": 0,
                                            "amarilla": true,
                                            "roja": false,
                                            "portero": false
                                          }
                                        ]
                                    """)
                    )
            ),
            @ApiResponse(
                    responseCode = "404",
                    description = "Estadísticas del partido no encontradas",
                    content = @Content(
                            mediaType = "application/problem+json",
                            schema = @Schema(implementation = ProblemDetail.class),
                            examples = @ExampleObject(value = """
                                        {
                                          "type": "https://api.recreadejuerga.com/errores/estadísticas-no-encontradas",
                                          "title": "Estadísticas de los jugadores no encontradas",
                                          "status": 404,
                                          "detail": "No se encontraron estadísticas para el partido con ID: 123e4567-e89b-12d3-a456-426614174000",
                                          "instance": "/estadisticas/partido/123e4567-e89b-12d3-a456-426614174000"
                                        }
                                    """)
                    )
            )
    })
    @GetMapping("/partido/{partidoId}")
    public ResponseEntity<List<EstadisticasJugadorPartidoDTO>> getEstadisticasPorPartido(
            @Parameter(description = "ID del partido") @PathVariable UUID partidoId) {
        return ResponseEntity.ok(estadisticasJugadorPartidoServicio.getEstaditicasJugadoresPorPartido(partidoId));
    }

    @Operation(
            summary = "Obtener estadísticas de un jugador por ID",
            description = "Recupera todas las estadísticas registradas para un jugador concreto en los distintos partidos en los que ha participado. " +
                    "Permite ver su rendimiento acumulado partido a partido.",
            tags = {"parámetros", "detalles"}
    )
    @ApiResponses({
            @ApiResponse(
                    responseCode = "200",
                    description = "Lista de estadísticas del jugador",
                    content = @Content(
                            mediaType = "application/json",
                            array = @ArraySchema(schema = @Schema(implementation = EstadisticasJugadorPartidoDTO.class)),
                            examples = @ExampleObject(name = "Estadísticas de Bellingham", value = """
                                        [
                                          {
                                            "id": "11111111-aaaa-bbbb-cccc-000000000001",
                                            "partidoId": "22222222-bbbb-cccc-dddd-000000000111",
                                            "jugador": {
                                              "id": "00000000-1111-2222-3333-444444444002",
                                              "nombre": "Jude Bellingham",
                                              "apodo": "Bellingham",
                                              "dorsal": 5,
                                              "posicion": "Centrocampista"
                                            },
                                            "goles": 1,
                                            "asistencias": 0,
                                            "amarilla": false,
                                            "roja": false,
                                            "portero": false
                                          },
                                          {
                                            "id": "11111111-aaaa-bbbb-cccc-000000000002",
                                            "partidoId": "22222222-bbbb-cccc-dddd-000000000112",
                                            "jugador": {
                                              "id": "00000000-1111-2222-3333-444444444002",
                                              "nombre": "Jude Bellingham",
                                              "apodo": "Bellingham",
                                              "dorsal": 5,
                                              "posicion": "Centrocampista"
                                            },
                                            "goles": 2,
                                            "asistencias": 1,
                                            "amarilla": true,
                                            "roja": false,
                                            "portero": false
                                          }
                                        ]
                                    """)
                    )
            ),
            @ApiResponse(
                    responseCode = "404",
                    description = "No se encontraron estadísticas para el jugador",
                    content = @Content(
                            mediaType = "application/problem+json",
                            schema = @Schema(implementation = ProblemDetail.class),
                            examples = @ExampleObject(value = """
                                        {
                                          "type": "https://api.recreadejuerga.com/errores/estadísticas-no-encontradas",
                                          "title": "Estadísticas de los jugadores no encontradas",
                                          "status": 404,
                                          "detail": "No se encontraron estadísticas para el jugador Jude Bellingham",
                                          "instance": "/estadisticas/jugador/00000000-1111-2222-3333-444444444002"
                                        }
                                    """)
                    )
            )
    })
    @GetMapping("/jugador/{jugadorId}")
    public ResponseEntity<List<EstadisticasJugadorPartidoDTO>> getEstadisticasDeUnJugador(
            @Parameter(description = "ID del jugador") @PathVariable UUID jugadorId) {
        return ResponseEntity.ok(estadisticasJugadorPartidoServicio.getEstadisticasDeUnJugador(jugadorId));
    }


    @Operation(
            summary = "Insertar estadísticas de un jugador en un partido",
            description = "Permite registrar las estadísticas de un jugador en un partido determinado. Requiere los identificadores del jugador y el partido.",
            tags = {"estadísticas", "creación"}
    )
    @ApiResponses({
            @ApiResponse(
                    responseCode = "201",
                    description = "Estadísticas insertadas correctamente",
                    content = @Content(
                            mediaType = "application/json",
                            schema = @Schema(implementation = EstadisticasJugadorPartidoDTO.class),
                            examples = @ExampleObject("""
                                        {
                                          "id": "acbd1234-d8f4-43f7-8b1a-dedbe4f69a22",
                                          "partidoId": "de45f2ab-1123-4b9a-997b-47b0de1277ac",
                                          "jugador": {
                                            "id": "5f6a7b88-9e01-4a7e-b1de-5bc6f87cde11",
                                            "nombre": "Vinícius Júnior",
                                            "apodo": "Vini",
                                            "dorsal": 7,
                                            "posicion": "Extremo Izquierdo"
                                          },
                                          "goles": 1,
                                          "asistencias": 1,
                                          "amarilla": false,
                                          "roja": false,
                                          "portero": false
                                        }
                                    """)
                    )
            ),
            @ApiResponse(
                    responseCode = "404",
                    description = "Jugador o partido no encontrado",
                    content = @Content(
                            mediaType = "application/problem+json",
                            schema = @Schema(implementation = ProblemDetail.class),
                            examples = {
                                    @ExampleObject(name = "Jugador no encontrado", value = """
                                                {
                                                  "type": "https://api.recreadejuerga.com/errores/jugadores-no-encontrados",
                                                  "title": "Jugadores no encontrados",
                                                  "status": 404,
                                                  "detail": "El jugador con id (5f6a7b88-9e01-4a7e-b1de-5bc6f87cde11) no fue encontrado",
                                                  "instance": "/estadisticas/alta"
                                                }
                                            """),
                                    @ExampleObject(name = "Partido no encontrado", value = """
                                                {
                                                  "type": "https://api.recreadejuerga.com/errores/partido-no-encontrado",
                                                  "title": "Partido no encontrado",
                                                  "status": 404,
                                                  "detail": "No hemos encontrado el partido con id(de45f2ab-1123-4b9a-997b-47b0de1277ac)",
                                                  "instance": "/estadisticas/alta"
                                                }
                                            """)
                            }
                    )
            ),
            @ApiResponse(
                    responseCode = "409",
                    description = "Estadística duplicada para ese jugador en ese partido o conflicto de unicidad",
                    content = @Content(
                            mediaType = "application/problem+json",
                            schema = @Schema(implementation = ProblemDetail.class),
                            examples = {
                                    @ExampleObject(name = "Estadística ya registrada", value = """
                                                {
                                                  "type": "https://api.recreadejuerga.com/errores/estadísticas-ya-existente",
                                                  "title": "Estadísticas del jugador ya existente",
                                                  "status": 409,
                                                  "detail": "Ya existe una estadística para este jugador en el partido",
                                                  "instance": "/estadisticas/alta"
                                                }
                                            """),
                                    @ExampleObject(name = "Clave duplicada", value = """
                                                {
                                                  "type": "https://api.recreadejuerga.com/errores/campos-duplicados",
                                                  "title": "Campos duplicados",
                                                  "status": 409,
                                                  "detail": "El jugador Vinícius Júnior ya tiene registrada una estadística para el partido del 2024-05-18 en Santiago Bernabéu.",
                                                  "instance": "/estadisticas/alta",
                                                  "campos": {
                                                    "jugador-partido": "El jugador Vinícius Júnior ya tiene registrada una estadística para ese partido"
                                                  }
                                                }
                                            """)
                            }
                    )
            )
    })
    @PostMapping("/alta")
    public ResponseEntity<EstadisticasJugadorPartidoDTO> crearEstadistica(
            @io.swagger.v3.oas.annotations.parameters.RequestBody(
                    description = "Estadísticas del jugador en un partido",
                    required = true,
                    content = @Content(
                            mediaType = "application/json",
                            schema = @Schema(implementation = EstadisticasJugadorPartidoInsertarDTO.class),
                            examples = @ExampleObject("""
                                        {
                                          "jugadorId": "5f6a7b88-9e01-4a7e-b1de-5bc6f87cde11",
                                          "partidoId": "de45f2ab-1123-4b9a-997b-47b0de1277ac",
                                          "goles": 1,
                                          "asistencias": 1,
                                          "amarilla": false,
                                          "roja": false,
                                          "portero": false
                                        }
                                    """)
                    )
            ) @Valid @RequestBody EstadisticasJugadorPartidoInsertarDTO dto
    ) {
        return ResponseEntity.status(HttpStatus.CREATED).body(
                estadisticasJugadorPartidoServicio.insertarEstadisticaJugadorEnPartido(dto)
        );
    }

    @Operation(
            summary = "Modificar estadísticas de un jugador en un partido",
            description = "Permite editar las estadísticas registradas de un jugador en un partido mediante su ID. No se puede modificar el jugador ni el partido asociado, solo los valores de estadísticas.",
            tags = {"estadísticas", "actualizar"}
    )
    @ApiResponses({
            @ApiResponse(
                    responseCode = "200",
                    description = "Estadísticas del jugador actualizadas correctamente",
                    content = @Content(
                            mediaType = "application/json",
                            schema = @Schema(implementation = EstadisticasJugadorPartidoDTO.class),
                            examples = {
                                    @ExampleObject(
                                            name = "Respuesta con estadísticas actualizadas",
                                            value = """
                                                        {
                                                          "id": "f2c7b7e6-6db0-442f-b430-8a69c0636fba",
                                                          "partidoId": "de45f2ab-1123-4b9a-997b-47b0de1277ac",
                                                          "jugador": {
                                                            "id": "5f6a7b88-9e01-4a7e-b1de-5bc6f87cde11",
                                                            "nombre": "Vinícius Júnior",
                                                            "apodo": "Vini",
                                                            "dorsal": 7,
                                                            "posicion": "Extremo Izquierdo"
                                                          },
                                                          "goles": 2,
                                                          "asistencias": 2,
                                                          "amarilla": false,
                                                          "roja": false,
                                                          "portero": false
                                                        }
                                                    """
                                    )
                            }
                    )
            ),
            @ApiResponse(
                    responseCode = "404",
                    description = "No se encontró la estadística con el ID proporcionado",
                    content = @Content(
                            mediaType = "application/problem+json",
                            schema = @Schema(implementation = ProblemDetail.class),
                            examples = {
                                    @ExampleObject(
                                            name = "Error - Estadística no encontrada",
                                            value = """
                                                        {
                                                          "type": "https://api.recreadejuerga.com/errores/estadísticas-no-encontradas",
                                                          "title": "Estadísticas de los jugadores no encontradas",
                                                          "status": 404,
                                                          "detail": "Lo siento, pero no encuentro las estadísticas de ningún jugador del partido cuyo id es f2c7b7e6-6db0-442f-b430-8a69c0636fba",
                                                          "instance": "/estadisticas/f2c7b7e6-6db0-442f-b430-8a69c0636fba"
                                                        }
                                                    """
                                    )
                            }
                    )
            )
    })
    @PutMapping("/{id}")
    public ResponseEntity<EstadisticasJugadorPartidoDTO> editarEstadistica(
            @io.swagger.v3.oas.annotations.parameters.RequestBody(
                    description = "Datos a actualizar para las estadísticas de un jugador en un partido",
                    required = true,
                    content = @Content(
                            mediaType = "application/json",
                            schema = @Schema(implementation = EstadisticasJugadorPartidoActualizarDTO.class),
                            examples = {
                                    @ExampleObject(
                                            name = "Petición para actualizar estadísticas",
                                            value = """
                                                        {
                                                          "goles": 2,
                                                          "asistencias": 2,
                                                          "amarilla": false,
                                                          "roja": false,
                                                          "portero": false
                                                        }
                                                    """
                                    )
                            }
                    )
            )
            @Valid @RequestBody EstadisticasJugadorPartidoActualizarDTO dto,
            @Parameter(description = "ID de la estadística a modificar") @PathVariable UUID id
    ) {
        return ResponseEntity.ok(estadisticasJugadorPartidoServicio.modificarEstadisticaJugadorEnPartido(dto, id));
    }


    @Operation(
            summary = "Eliminar las estadísticas de un jugador en un partido",
            description = "Permite eliminar un registro de estadísticas individuales identificadas por su ID. Devuelve un código 204 si se elimina correctamente o 404 si no se encuentra el recurso.",
            tags = {"estadísticas", "eliminar"}
    )
    @ApiResponses({
            @ApiResponse(
                    responseCode = "204",
                    description = "La estadística fue eliminada correctamente"
            ),
            @ApiResponse(
                    responseCode = "404",
                    description = "No se encontró el registro de estadísticas con el ID proporcionado",
                    content = @Content(
                            mediaType = "application/problem+json",
                            schema = @Schema(implementation = ProblemDetail.class),
                            examples = {
                                    @ExampleObject(
                                            name = "Error - Estadística no encontrada",
                                            value = """
                                                        {
                                                          "type": "https://api.recreadejuerga.com/errores/estadísticas-no-encontradas",
                                                          "title": "Estadísticas de los jugadores no encontradas",
                                                          "status": 404,
                                                          "detail": "Lo siento, pero no encuentro las estadísticas de ningún jugador del partido cuyo id es f2c7b7e6-6db0-442f-b430-8a69c0636fba",
                                                          "instance": "/estadisticas/f2c7b7e6-6db0-442f-b430-8a69c0636fba"
                                                        }
                                                    """
                                    )
                            }
                    )
            )
    })
    @DeleteMapping("/{id}")
    public ResponseEntity<?> eliminarEstadistica(
            @Parameter(description = "Identificador del registro de estadística") @PathVariable UUID id) {
        estadisticasJugadorPartidoServicio.eliminarEstadisticasJugadorPartido(id);
        return ResponseEntity.noContent().build();
    }


}
