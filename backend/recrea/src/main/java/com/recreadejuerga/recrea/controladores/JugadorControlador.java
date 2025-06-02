package com.recreadejuerga.recrea.controladores;


import com.recreadejuerga.recrea.dtos.jugador.JugadorDTO;
import com.recreadejuerga.recrea.dtos.jugador.JugadorFormularioDTO;
import com.recreadejuerga.recrea.servicios.JugadorServicio;
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
@RequestMapping("/jugadores")
@CrossOrigin(origins = "http://localhost:4200", allowCredentials = "true")
@Tag(name = "Jugadores", description = "Gestión básica de los jugadores")
public class JugadorControlador {

    @Autowired
    private JugadorServicio jugadorServicio;

    @Operation(
            summary = "Obtener todos los jugadores de un equipo en concreto",
            description = "Devuelve una lista detallada de jugadores asociados a un equipo dado su ID. Incluye información personal, estadísticas y parecidos.",
            tags = {"parámetros", "detalles"}
    )
    @ApiResponses({
            @ApiResponse(
                    responseCode = "200",
                    description = "Información detallada de los jugadores de un equipo",
                    content = @Content(
                            mediaType = "application/json",
                            array = @ArraySchema(schema = @Schema(implementation = JugadorDTO.class)),
                            examples = {
                                    @ExampleObject(name = "Ejemplo - Lista de jugadores", value = """
                                                [
                                                  {
                                                    "id": "5c1d46be-1a23-4fa8-8c6e-7e6e9f98dfbb",
                                                    "nombre": "Vinícius Júnior",
                                                    "apodo": "Vini",
                                                    "dorsal": 7,
                                                    "posicion": "Extremo Izquierdo",
                                                    "pieDominante": "Derecho",
                                                    "golesTotales": 24,
                                                    "asistenciasTotales": 11,
                                                    "fortalezas": "Velocidad, regate, uno contra uno, desborde por banda",
                                                    "fechaNacimiento": "2000-07-12",
                                                    "fotoFrontal": "https://example.com/fotos/vini-frontal.jpg",
                                                    "fotoTarjeta": "https://example.com/fotos/vini-tarjeta.jpg",
                                                    "fotoPose": "https://example.com/fotos/vini-pose.jpg",
                                                    "parecidos": [
                                                      {
                                                        "id": "a1111111-bbbb-4ccc-dddd-eeeeeeeeeeee",
                                                        "parecido": "Neymar Jr"
                                                      },
                                                      {
                                                        "id": "a2222222-bbbb-4ccc-dddd-eeeeeeeeeeee",
                                                        "parecido": "Ronaldinho"
                                                      }
                                                    ],
                                                    "equipo": {
                                                      "id": "b8a5bfa4-7e52-4dcb-a50c-3d7dbdc4e9a2",
                                                      "nombre": "Real Madrid CF",
                                                      "url_logo": "https://example.com/logos/realmadrid.png"
                                                    }
                                                  }
                                                ]
                                            """)
                            }
                    )
            ),
            @ApiResponse(
                    responseCode = "404",
                    description = "No se encontraron jugadores para el equipo indicado",
                    content = @Content(
                            mediaType = "application/problem+json",
                            schema = @Schema(implementation = ProblemDetail.class),
                            examples = {
                                    @ExampleObject(name = "Error - Jugadores no encontrados", value = """
                                                {
                                                  "type": "https://api.recreadejuerga.com/errores/jugadores-no-encontrados",
                                                  "title": "Jugadores no encontrados",
                                                  "status": 404,
                                                  "detail": "No se encontraron jugadores para el equipo 'Real Madrid CF'",
                                                  "instance": "/jugadores/equipo/b8a5bfa4-7e52-4dcb-a50c-3d7dbdc4e9a2"
                                                }
                                            """)
                            }
                    )
            )
    })
    @GetMapping("equipo/{equipo_id}")
    public ResponseEntity<List<JugadorDTO>> getJugadoresOfATeam(
            @Parameter(description = "Identificador del equipo") @PathVariable UUID equipo_id
    ) {
        List<JugadorDTO> jugadores_equipo = jugadorServicio.getJugadoresByEquipo(equipo_id);
        return ResponseEntity.ok(jugadores_equipo);
    }

    @Operation(
            summary = "Obtener un jugador concreto",
            description = "Devuelve los datos detallados de un jugador en base a su identificador único.",
            tags = {"parámetros", "detalles"}
    )
    @ApiResponses({
            @ApiResponse(
                    responseCode = "200",
                    description = "Información detallada de un jugador",
                    content = @Content(
                            mediaType = "application/json",
                            schema = @Schema(implementation = JugadorDTO.class),
                            examples = {
                                    @ExampleObject(name = "Ejemplo - Jugador encontrado", value = """
                                                {
                                                  "id": "5c1d46be-1a23-4fa8-8c6e-7e6e9f98dfbb",
                                                  "nombre": "Vinícius Júnior",
                                                  "apodo": "Vini",
                                                  "dorsal": 7,
                                                  "posicion": "Extremo Izquierdo",
                                                  "pieDominante": "Derecho",
                                                  "golesTotales": 24,
                                                  "asistenciasTotales": 11,
                                                  "fortalezas": "Velocidad, regate, uno contra uno, desborde por banda",
                                                  "fechaNacimiento": "2000-07-12",
                                                  "fotoFrontal": "https://example.com/fotos/vini-frontal.jpg",
                                                  "fotoTarjeta": "https://example.com/fotos/vini-tarjeta.jpg",
                                                  "fotoPose": "https://example.com/fotos/vini-pose.jpg",
                                                  "parecidos": [
                                                    {
                                                      "id": "12a3b456-7890-4def-ab12-34567890abcd",
                                                      "parecido": "Neymar Jr"
                                                    },
                                                    {
                                                      "id": "34cd5678-1234-4abc-bcde-567890abcdef",
                                                      "parecido": "Ronaldinho"
                                                    }
                                                  ],
                                                  "equipo": {
                                                    "id": "b8a5bfa4-7e52-4dcb-a50c-3d7dbdc4e9a2",
                                                    "nombre": "Real Madrid CF",
                                                    "url_logo": "https://example.com/logos/realmadrid.png"
                                                  }
                                                }
                                            """)
                            }
                    )
            ),
            @ApiResponse(
                    responseCode = "404",
                    description = "Jugador no encontrado",
                    content = @Content(
                            mediaType = "application/problem+json",
                            schema = @Schema(implementation = ProblemDetail.class),
                            examples = {
                                    @ExampleObject(name = "Error - Jugador no encontrado", value = """
                                                {
                                                  "type": "https://api.recreadejuerga.com/errores/jugadores-no-encontrados",
                                                  "title": "Jugadores no encontrados",
                                                  "status": 404,
                                                  "detail": "No se encontró ningún jugador con el ID proporcionado",
                                                  "instance": "/jugadores/{id}"
                                                }
                                            """)
                            }
                    )
            )
    })
    @GetMapping("/{id}")
    public ResponseEntity<JugadorDTO> getJugadorById(
            @Parameter(description = "Identificador del jugador") @PathVariable UUID id
    ) {
        return ResponseEntity.ok(jugadorServicio.getJugadorById(id));
    }

    @Operation(
            summary = "Insertar un jugador en un equipo",
            description = "Crea un nuevo jugador dentro de un equipo si no existe ya uno con el mismo dorsal. Valida que el equipo exista.",
            tags = {"parámetros", "creación"}
    )
    @ApiResponses({
            @ApiResponse(
                    responseCode = "201",
                    description = "Jugador creado correctamente",
                    content = @Content(
                            mediaType = "application/json",
                            schema = @Schema(implementation = JugadorDTO.class),
                            examples = {
                                    @ExampleObject("""
                                                {
                                                  "id": "5c1d46be-1a23-4fa8-8c6e-7e6e9f98dfbb",
                                                  "nombre": "Vinícius Júnior",
                                                  "apodo": "Vini",
                                                  "dorsal": 7,
                                                  "posicion": "Extremo Izquierdo",
                                                  "pieDominante": "Derecho",
                                                  "golesTotales": 24,
                                                  "asistenciasTotales": 11,
                                                  "fortalezas": "Velocidad, regate, uno contra uno, desborde por banda",
                                                  "fechaNacimiento": "2000-07-12",
                                                  "fotoFrontal": "https://example.com/fotos/vini-frontal.jpg",
                                                  "fotoTarjeta": "https://example.com/fotos/vini-tarjeta.jpg",
                                                  "fotoPose": "https://example.com/fotos/vini-pose.jpg",
                                                  "parecidos": [],
                                                  "equipo": {
                                                    "id": "b8a5bfa4-7e52-4dcb-a50c-3d7dbdc4e9a2",
                                                    "nombre": "Real Madrid CF",
                                                    "url_logo": "https://example.com/logos/realmadrid.png"
                                                  }
                                                }
                                            """)
                            }
                    )
            ),
            @ApiResponse(
                    responseCode = "404",
                    description = "Equipo no encontrado",
                    content = @Content(
                            mediaType = "application/problem+json",
                            schema = @Schema(implementation = ProblemDetail.class),
                            examples = {
                                    @ExampleObject("""
                                                {
                                                  "type": "https://api.recreadejuerga.com/errores/equipo-no-encontrado",
                                                  "title": "Equipo no encontrado",
                                                  "status": 404,
                                                  "detail": "No se encontró ningún equipo con el ID proporcionado",
                                                  "instance": "/jugadores/alta"
                                                }
                                            """)
                            }
                    )
            ),
            @ApiResponse(
                    responseCode = "409",
                    description = "Jugador ya existente o duplicado por restricciones de base de datos",
                    content = @Content(
                            mediaType = "application/problem+json",
                            schema = @Schema(implementation = ProblemDetail.class),
                            examples = {
                                    @ExampleObject(name = "Dorsal duplicado", value = """
                                                {
                                                  "type": "https://api.recreadejuerga.com/errores/campos-duplicados",
                                                  "title": "Campos duplicados",
                                                  "status": 409,
                                                  "detail": "Ya existe un jugador con ese dorsal (7) en Real Madrid CF",
                                                  "instance": "/jugadores/alta",
                                                  "campos": {
                                                    "dorsal": "Ya existe un jugador con ese dorsal (7) en Real Madrid CF"
                                                  }
                                                }
                                            """),
                                    @ExampleObject(name = "Jugador ya existente", value = """
                                                {
                                                  "type": "https://api.recreadejuerga.com/errores/jugadores-ya-existente",
                                                  "title": "Jugadores ya existente",
                                                  "status": 409,
                                                  "detail": "El jugador ya existe con ese dorsal en ese equipo",
                                                  "instance": "/jugadores/alta"
                                                }
                                            """)
                            }
                    )
            )
    })
    @PostMapping("/alta")
    public ResponseEntity<JugadorDTO> crear(
            @io.swagger.v3.oas.annotations.parameters.RequestBody(
                    description = "Jugador a crear",
                    required = true,
                    content = @Content(
                            mediaType = "application/json",
                            schema = @Schema(implementation = JugadorFormularioDTO.class),
                            examples = {
                                    @ExampleObject("""
                                                {
                                                   "nombre": "Kylian Mbappé",
                                                   "apodo": "Donatello",
                                                   "dorsal": 7,
                                                   "posicion": "Delantero",
                                                   "pieDominante": "Derecho",
                                                   "golesTotales": 44,
                                                   "asistenciasTotales": 10,
                                                   "fortalezas": "Velocidad explosiva, regate en carrera, definición precisa, desmarques inteligentes",
                                                   "fechaNacimiento": "1998-12-20",
                                                   "equipoId": "123e4567-e89b-12d3-a456-426614174000",
                                                   "fotoFrontal": "https://example.com/fotos/mbappe-2024-frontal.jpg",
                                                   "fotoTarjeta": "https://example.com/fotos/mbappe-2024-tarjeta.jpg",
                                                   "fotoPose": "https://example.com/fotos/mbappe-2024-pose.jpg"
                                                }
                                            """)
                            }
                    )
            )
            @Valid @RequestBody JugadorFormularioDTO jugador
    ) {
        return ResponseEntity.status(HttpStatus.CREATED).body(jugadorServicio.insertarJugador(jugador));
    }


    @Operation(
            summary = "Modificar un jugador en la base de datos",
            description = "Edita los datos de un jugador existente mediante su ID. Si el jugador no existe, se lanza un error 404. Valida duplicados por dorsal en el equipo.",
            tags = {"parámetros", "actualizar"}
    )
    @ApiResponses({
            @ApiResponse(
                    responseCode = "200",
                    description = "El jugador fue actualizado correctamente",
                    content = @Content(
                            mediaType = "application/json",
                            schema = @Schema(implementation = JugadorDTO.class),
                            examples = {
                                    @ExampleObject("""
                                                {
                                                  "id": "5c1d46be-1a23-4fa8-8c6e-7e6e9f98dfbb",
                                                  "nombre": "Vinícius Júnior",
                                                  "apodo": "Vini",
                                                  "dorsal": 7,
                                                  "posicion": "Extremo Izquierdo",
                                                  "pieDominante": "Derecho",
                                                  "golesTotales": 24,
                                                  "asistenciasTotales": 11,
                                                  "fortalezas": "Velocidad, regate, uno contra uno, desborde por banda",
                                                  "fechaNacimiento": "2000-07-12",
                                                  "fotoFrontal": "https://example.com/fotos/vini-frontal.jpg",
                                                  "fotoTarjeta": "https://example.com/fotos/vini-tarjeta.jpg",
                                                  "fotoPose": "https://example.com/fotos/vini-pose.jpg",
                                                  "parecidos": [
                                                    {
                                                      "id": "12a3b456-7890-4def-ab12-34567890abcd",
                                                      "parecido": "Neymar Jr"
                                                    },
                                                    {
                                                      "id": "34cd5678-1234-4abc-bcde-567890abcdef",
                                                      "parecido": "Ronaldinho"
                                                    }
                                                  ],
                                                  "equipo": {
                                                    "id": "b8a5bfa4-7e52-4dcb-a50c-3d7dbdc4e9a2",
                                                    "nombre": "Real Madrid CF",
                                                    "url_logo": "https://example.com/logos/realmadrid.png"
                                                  }
                                                }
                                            """)
                            }
                    )
            ),
            @ApiResponse(
                    responseCode = "404",
                    description = "El jugador o el equipo no fueron encontrados",
                    content = @Content(
                            mediaType = "application/problem+json",
                            schema = @Schema(implementation = ProblemDetail.class),
                            examples = {
                                    @ExampleObject(name = "Jugador no encontrado", value = """
                                                {
                                                  "type": "https://api.recreadejuerga.com/errores/jugadores-no-encontrados",
                                                  "title": "Jugadores no encontrados",
                                                  "status": 404,
                                                  "detail": "El jugador con id (5c1d46be-1a23-4fa8-8c6e-7e6e9f98dfbb) no fue encontrado.",
                                                  "instance": "/jugadores/{id}"
                                                }
                                            """),
                                    @ExampleObject(name = "Equipo no encontrado", value = """
                                                {
                                                  "type": "https://api.recreadejuerga.com/errores/equipo-no-encontrado",
                                                  "title": "Equipo no encontrado",
                                                  "status": 404,
                                                  "detail": "No se encontró un equipo con el ID: 123e4567-e89b-12d3-a456-426614174000",
                                                  "instance": "/jugadores/{id}"
                                                }
                                            """)
                            }
                    )
            ),
            @ApiResponse(
                    responseCode = "409",
                    description = "Conflicto de datos: jugador duplicado o restricciones de unicidad",
                    content = @Content(
                            mediaType = "application/problem+json",
                            schema = @Schema(implementation = ProblemDetail.class),
                            examples = {
                                    @ExampleObject("""
                                                {
                                                  "type": "https://api.recreadejuerga.com/errores/campos-duplicados",
                                                  "title": "Campos duplicados",
                                                  "status": 409,
                                                  "detail": "Ya existe un jugador con ese dorsal (7) en Real Madrid CF",
                                                  "instance": "/jugadores/{id}",
                                                  "campos": {
                                                    "dorsal": "Ya existe un jugador con ese dorsal (7) en Real Madrid CF"
                                                  }
                                                }
                                            """)
                            }
                    )
            )
    })
    @PutMapping("/{id}")
    public ResponseEntity<JugadorDTO> editar(
            @io.swagger.v3.oas.annotations.parameters.RequestBody(
                    description = "Jugador para editar",
                    required = true,
                    content = @Content(
                            mediaType = "application/json",
                            schema = @Schema(implementation = JugadorFormularioDTO.class),
                            examples = {
                                    @ExampleObject("""
                                                {
                                                   "nombre": "Kylian Mbappé",
                                                   "apodo": "Donatello",
                                                   "dorsal": 7,
                                                   "posicion": "Delantero",
                                                   "pieDominante": "Derecho",
                                                   "golesTotales": 44,
                                                   "asistenciasTotales": 10,
                                                   "fortalezas": "Velocidad explosiva, regate en carrera, definición precisa, desmarques inteligentes",
                                                   "fechaNacimiento": "1998-12-20",
                                                   "equipoId": "123e4567-e89b-12d3-a456-426614174000",
                                                   "fotoFrontal": "https://example.com/fotos/mbappe-2024-frontal.jpg",
                                                   "fotoTarjeta": "https://example.com/fotos/mbappe-2024-tarjeta.jpg",
                                                   "fotoPose": "https://example.com/fotos/mbappe-2024-pose.jpg"
                                                }
                                            """)
                            }
                    )
            )
            @Valid @RequestBody JugadorFormularioDTO jugador,
            @Parameter(description = "Identificador del jugador") @PathVariable UUID id
    ) {
        JugadorDTO actualizado = jugadorServicio.modificarJugador(jugador, id);
        return ResponseEntity.ok(actualizado);
    }


    @Operation(
            summary = "Eliminar un jugador de la base de datos",
            description = "Permite borrar un jugador existente proporcionando su ID. Si el jugador no existe, se devuelve un error 404.",
            tags = {"parámetros", "eliminar"}
    )
    @ApiResponses({
            @ApiResponse(
                    responseCode = "204",
                    description = "El jugador fue eliminado correctamente"
            ),
            @ApiResponse(
                    responseCode = "404",
                    description = "Jugador no encontrado",
                    content = @Content(
                            mediaType = "application/problem+json",
                            schema = @Schema(implementation = ProblemDetail.class),
                            examples = {
                                    @ExampleObject(
                                            name = "Jugador no encontrado",
                                            value = """
                                                        {
                                                          "type": "https://api.recreadejuerga.com/errores/jugadores-no-encontrados",
                                                          "title": "Jugadores no encontrados",
                                                          "status": 404,
                                                          "detail": "El jugador con id (5c1d46be-1a23-4fa8-8c6e-7e6e9f98dfbb) no fue encontrado.",
                                                          "instance": "/jugadores/5c1d46be-1a23-4fa8-8c6e-7e6e9f98dfbb"
                                                        }
                                                    """
                                    )
                            }
                    )
            )
    })
    @DeleteMapping("/{id}")
    public ResponseEntity<?> eliminar(
            @Parameter(description = "Identificador del jugador") @PathVariable UUID id) {
        jugadorServicio.eliminarJugador(id);
        return ResponseEntity.noContent().build();
    }

}
