package com.recreadejuerga.recrea.controladores;

import com.recreadejuerga.recrea.dtos.estadisticasJugadorPartido.EstadisticasJugadorPartidoDTO;
import com.recreadejuerga.recrea.dtos.estadisticasJugadorPartido.EstadisticasJugadorPartidoFormularioDTO;
import com.recreadejuerga.recrea.servicios.EstadisticasJugadorPartidoServicio;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.media.ArraySchema;
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
@RequestMapping("/api/estadisticas")
@Tag(name = "Estadísticas jugador-partido", description = "Operaciones CRUD sobre estadísticas de jugadores en partidos")
public class EstadisticasJugadorPartidoControlador {

    @Autowired
    private EstadisticasJugadorPartidoServicio estadisticasJugadorPartidoServicio;

    @Operation(summary = "Obtener estadísticas de un partido por ID",
            description = "Devuelve todas las estadísticas individuales de los jugadores que han participado en un partido determinado, identificándolo por su ID. " +
                    "Incluye datos como goles, asistencias, tarjetas y si fue portero.",
            tags = {"parámetros","detalles"}
    )
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
    )
    @GetMapping("/partido/{partidoId}")
    public ResponseEntity<List<EstadisticasJugadorPartidoDTO>> getEstadisticasPorPartido(
            @Parameter(description = "ID del partido") @PathVariable UUID partidoId) {
        return ResponseEntity.ok(estadisticasJugadorPartidoServicio.getEstaditicasJugadoresPorPartido(partidoId));
    }

    @Operation(summary = "Obtener estadísticas de un jugador por ID",
            description = "Recupera todas las estadísticas registradas para un jugador concreto en los distintos partidos en los que ha participado. " +
                    "Permite ver su rendimiento acumulado partido a partido.",
            tags = {"parámetros","detalles"}
    )
    @ApiResponse(
            responseCode = "200",
            description = "Lista de estadísticas del jugador",
            content = @Content(
                    mediaType = "application/json",
                    array = @ArraySchema(
                            schema = @Schema(implementation = EstadisticasJugadorPartidoDTO.class)
                    ),
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
    )
    @GetMapping("/jugador/{jugadorId}")
    public ResponseEntity<List<EstadisticasJugadorPartidoDTO>> getEstadisticasDeUnJugador(
            @Parameter(description = "ID del jugador") @PathVariable UUID jugadorId) {
        return ResponseEntity.ok(estadisticasJugadorPartidoServicio.getEstadisticasDeUnJugador(jugadorId));
    }

    @Operation(
            summary = "Insertar estadísticas de un jugador en un partido",
            description = "Permite insertar las estadísticas de un jugador concreto en un partido proporcionando su ID y los datos relevantes",
            tags = {"estadísticas", "creación"}
    )
    @ApiResponse(
            description = "Estadísticas insertadas correctamente en la base de datos",
            responseCode = "201",
            content = @Content(
                    mediaType = "application/json",
                    schema = @Schema(implementation = EstadisticasJugadorPartidoDTO.class),
                    examples = {
                            @ExampleObject("""
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
                    }
            )
    )
    @PostMapping("/alta")
    public ResponseEntity<EstadisticasJugadorPartidoDTO> crearEstadistica(
            @io.swagger.v3.oas.annotations.parameters.RequestBody(
                    description = "Estadística a registrar en el partido",
                    required = true,
                    content = @Content(
                            mediaType = "application/json",
                            schema = @Schema(implementation = EstadisticasJugadorPartidoFormularioDTO.class),
                            examples = {
                                    @ExampleObject("""
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
                            }
                    )
            ) @Valid @RequestBody EstadisticasJugadorPartidoFormularioDTO dto) {
        return ResponseEntity.status(HttpStatus.CREATED).body(estadisticasJugadorPartidoServicio.insertarEstadisticaJugadorEnPartido(dto));
    }

    @Operation(
            summary = "Para modificar las estadísticas de un jugador en un partido",
            description = "Permite editar estadísticas proporcionando un DTO con los nuevos datos y el ID del registro",
            tags = {"estadísticas", "actualizar"}
    )
    @ApiResponse(
            description = "Estadísticas del jugador actualizadas correctamente",
            responseCode = "200",
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
    )
    @PutMapping("/{id}")
    public ResponseEntity<EstadisticasJugadorPartidoDTO> editarEstadistica(
            @io.swagger.v3.oas.annotations.parameters.RequestBody(
                    description = "Estadísticas nuevas del jugador en el partido",
                    required = true,
                    content = @Content(
                            mediaType = "application/json",
                            schema = @Schema(implementation = EstadisticasJugadorPartidoFormularioDTO.class),
                            examples = {
                                    @ExampleObject(
                                            name = "Petición para actualizar estadísticas",
                                            value = """
                        {
                          "jugadorId": "5f6a7b88-9e01-4a7e-b1de-5bc6f87cde11",
                          "partidoId": "de45f2ab-1123-4b9a-997b-47b0de1277ac",
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
            @Valid @RequestBody EstadisticasJugadorPartidoFormularioDTO dto,
            @Parameter(description = "ID de la estadística a modificar") @PathVariable UUID id
    ) {
        return ResponseEntity.ok(estadisticasJugadorPartidoServicio.modificarEstadisticaJugadorEnPartido(dto, id));
    }

    @Operation(
            summary = "Para borrar las estadísticas de un jugador en un partido",
            description = "Permite eliminar un registro de estadísticas mediante su ID",
            tags = {"estadísticas", "eliminar"}
    )
    @ApiResponse(
            description = "La estadística fue eliminada correctamente",
            responseCode = "204"
    )
    @DeleteMapping("/{id}")
    public ResponseEntity<?> eliminarEstadistica(
            @Parameter(description = "Identificador del registro de estadística") @PathVariable UUID id) {
        estadisticasJugadorPartidoServicio.eliminarEstadisticasJugadorPartido(id);
        return ResponseEntity.noContent().build();
    }

}
