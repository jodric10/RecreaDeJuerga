package com.recreadejuerga.recrea.controladores;

import com.recreadejuerga.recrea.dtos.jugador.JugadorDTO;
import com.recreadejuerga.recrea.dtos.partido.PartidoDTO;
import com.recreadejuerga.recrea.dtos.partido.PartidoFormularioDTO;
import com.recreadejuerga.recrea.servicios.PartidoServicio;
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
@RequestMapping("/Partidos")
@Tag(name = "Partidos", description = "Gestión básica de los partidos")
public class PartidoControlador {

    @Autowired
    private PartidoServicio partidoServicio;

    @Operation(
            summary = "Obtener todos los partidos de un equipo en concreto",
            description = "Devuelve todos los partidos en los que ha participado un equipo (como local o visitante) usando su ID. Ordenados de más antiguos a más recientes.",
            tags = {"parámetros", "detalles"}
    )
    @ApiResponses({
            @ApiResponse(
                    responseCode = "200",
                    description = "Partidos del equipo recuperados correctamente",
                    content = @Content(
                            mediaType = "application/json",
                            schema = @Schema(implementation = PartidoDTO.class),
                            examples = @ExampleObject("""
                                        [
                                          {
                                            "id": "8a7c0e4e-56e3-4f99-8fc4-1e3a5c3fae7d",
                                            "fecha": "2025-06-15T20:30:00",
                                            "lugar": "Estadio Santiago Bernabéu",
                                            "estado": "Finalizado",
                                            "equipoLocal": {
                                              "id": "f1a8c0a2-d1ef-45b8-812b-6c9f6f8d3240",
                                              "nombre": "Real Madrid CF",
                                              "url_logo": "https://example.com/logos/realmadrid.png"
                                            },
                                            "equipoVisitante": {
                                              "id": "b2b9d3f4-45cb-43de-a1de-8f4fae3f2f2e",
                                              "nombre": "FC Barcelona",
                                              "url_logo": "https://example.com/logos/barcelona.png"
                                            },
                                            "golesLocal": 3,
                                            "golesVisitante": 2,
                                            "mvp": {
                                              "id": "c4f3e1a8-9880-42f5-8cf7-56464e88888a",
                                              "nombre": "Jude Bellingham",
                                              "apodo": "Belli",
                                              "dorsal": 5,
                                              "equipoId": "f1a8c0a2-d1ef-45b8-812b-6c9f6f8d3240"
                                            }
                                          }
                                        ]
                                    """)
                    )
            ),
            @ApiResponse(
                    responseCode = "404",
                    description = "No se encontraron partidos para el equipo",
                    content = @Content(
                            mediaType = "application/problem+json",
                            schema = @Schema(implementation = ProblemDetail.class),
                            examples = @ExampleObject("""
                                        {
                                          "type": "https://api.recreadejuerga.com/errores/partido-no-encontrado",
                                          "title": "Partido no encontrado",
                                          "status": 404,
                                          "detail": "No hemos encontrado ningún partido deReal Madrid CF",
                                          "instance": "/partidos/f1a8c0a2-d1ef-45b8-812b-6c9f6f8d3240"
                                        }
                                    """)
                    )
            )
    })
    @GetMapping("/{equipo_id}")
    public ResponseEntity<List<PartidoDTO>> getPartidosDeUnEquipo(
            @Parameter(description = "Identificador del equipo") @PathVariable UUID equipo_id) {
        List<PartidoDTO> partidosEquipo = partidoServicio.getPartidosDeUnEquipo(equipo_id);
        return ResponseEntity.ok(partidosEquipo);
    }


    @Operation(
            summary = "Insertar un partido en la base de datos",
            description = "Crea un nuevo partido con fecha, lugar, estado, equipos y MVP. Verifica duplicidad por fecha/lugar y combinaciones de equipos.",
            tags = {"parámetros", "creación"}
    )
    @ApiResponses({
            @ApiResponse(
                    responseCode = "201",
                    description = "Partido creado correctamente",
                    content = @Content(
                            mediaType = "application/json",
                            schema = @Schema(implementation = PartidoDTO.class),
                            examples = @ExampleObject("""
                                        {
                                          "id": "8a7c0e4e-56e3-4f99-8fc4-1e3a5c3fae7d",
                                          "fecha": "2025-06-15T20:30:00",
                                          "lugar": "Estadio Santiago Bernabéu",
                                          "estado": "Finalizado",
                                          "equipoLocal": {
                                            "id": "f1a8c0a2-d1ef-45b8-812b-6c9f6f8d3240",
                                            "nombre": "Real Madrid CF",
                                            "url_logo": "https://example.com/logos/realmadrid.png"
                                          },
                                          "equipoVisitante": {
                                            "id": "b2b9d3f4-45cb-43de-a1de-8f4fae3f2f2e",
                                            "nombre": "FC Barcelona",
                                            "url_logo": "https://example.com/logos/barcelona.png"
                                          },
                                          "golesLocal": 3,
                                          "golesVisitante": 2,
                                          "mvp": {
                                            "id": "c4f3e1a8-9880-42f5-8cf7-56464e88888a",
                                            "nombre": "Jude Bellingham",
                                            "apodo": "Belli",
                                            "dorsal": 5,
                                            "equipoId": "f1a8c0a2-d1ef-45b8-812b-6c9f6f8d3240"
                                          }
                                        }
                                    """)
                    )
            ),
            @ApiResponse(
                    responseCode = "404",
                    description = "El jugador o alguno de los equipos no fue encontrado",
                    content = @Content(
                            mediaType = "application/problem+json",
                            schema = @Schema(implementation = ProblemDetail.class),
                            examples = {
                                    @ExampleObject(name = "Jugador no encontrado", value = """
                                                {
                                                  "type": "https://api.recreadejuerga.com/errores/jugadores-no-encontrados",
                                                  "title": "Jugadores no encontrados",
                                                  "status": 404,
                                                  "detail": "El jugador con id (UUID) no fue encontrado.",
                                                  "instance": "/partidos/alta"
                                                }
                                            """),
                                    @ExampleObject(name = "Equipo no encontrado", value = """
                                                {
                                                  "type": "https://api.recreadejuerga.com/errores/equipo-no-encontrado",
                                                  "title": "Equipo no encontrado",
                                                  "status": 404,
                                                  "detail": "No se encontró un equipo con el ID: UUID",
                                                  "instance": "/partidos/alta"
                                                }
                                            """)
                            }
                    )
            ),
            @ApiResponse(
                    responseCode = "409",
                    description = "Conflictos con restricciones de unicidad (partido ya existente o datos inválidos)",
                    content = @Content(
                            mediaType = "application/problem+json",
                            schema = @Schema(implementation = ProblemDetail.class),
                            examples = {
                                    @ExampleObject(name = "Fecha y lugar duplicado", value = """
                                                {
                                                  "type": "https://api.recreadejuerga.com/errores/campos-duplicados",
                                                  "title": "Campos duplicados",
                                                  "status": 409,
                                                  "detail": "Ya está programado un partido el día 2025-06-22T21:00 en Estadio Benito Villamarín",
                                                  "instance": "/partidos/alta",
                                                  "campos": {
                                                    "fecha-lugar": "Ya está programado un partido el día 2025-06-22T21:00 en Estadio Benito Villamarín"
                                                  }
                                                }
                                            """),
                                    @ExampleObject(name = "Combinación local/visitante duplicada", value = """
                                                {
                                                  "type": "https://api.recreadejuerga.com/errores/campos-duplicados",
                                                  "title": "Campos duplicados",
                                                  "status": 409,
                                                  "detail": "Ya existe un partido con Real Madrid CF como local y FC Barcelona como visitante",
                                                  "instance": "/partidos/alta",
                                                  "campos": {
                                                    "equipo-local-visitante": "Ya existe un partido con Real Madrid CF como local y FC Barcelona como visitante"
                                                  }
                                                }
                                            """),
                                    @ExampleObject(name = "Estado inválido", value = """
                                                {
                                                  "type": "https://api.recreadejuerga.com/errores/campos-duplicados",
                                                  "title": "Campos duplicados",
                                                  "status": 409,
                                                  "detail": "El estado debe ser 'Pendiente' o 'Finalizado'",
                                                  "instance": "/partidos/alta",
                                                  "campos": {
                                                    "estado": "El estado debe ser 'Pendiente' o 'Finalizado'"
                                                  }
                                                }
                                            """)
                            }
                    )
            )
    })
    @PostMapping("/alta")
    public ResponseEntity<PartidoDTO> crear(
            @io.swagger.v3.oas.annotations.parameters.RequestBody(
                    description = "Partido a crear",
                    required = true,
                    content = @Content(
                            mediaType = "application/json",
                            schema = @Schema(implementation = PartidoFormularioDTO.class),
                            examples = {
                                    @ExampleObject("""
                                                {
                                                  "fecha": "2025-06-22T21:00:00",
                                                  "lugar": "Estadio Benito Villamarín",
                                                  "estado": "Pendiente",
                                                  "equipoLocalId": "a4f0c3e8-1e35-4cb3-a7f1-d8d1c5b09f33",
                                                  "equipoVisitanteId": "b9d1f2e4-8f26-4db7-b918-9f8a78e932ef",
                                                  "golesLocal": 3,
                                                  "golesVisitante": 2,
                                                  "mvpId": "c4f3e1a8-9880-42f5-8cf7-56464e88888a"
                                                }
                                            """)
                            }
                    )
            )
            @Valid @RequestBody PartidoFormularioDTO partido
    ) {
        return ResponseEntity.status(HttpStatus.CREATED).body(partidoServicio.insertarPartido(partido));
    }

    @Operation(
            summary = "Modificar un partido en la base de datos",
            description = "Edita los datos de un partido existente mediante su ID. Verifica duplicidad por fecha/lugar y combinación de equipos, además de que el MVP y los equipos existan.",
            tags = {"parámetros", "actualizar"}
    )
    @ApiResponses({
            @ApiResponse(
                    responseCode = "200",
                    description = "Partido actualizado correctamente",
                    content = @Content(
                            mediaType = "application/json",
                            schema = @Schema(implementation = PartidoDTO.class),
                            examples = {
                                    @ExampleObject("""
                                                {
                                                  "id": "8a7c0e4e-56e3-4f99-8fc4-1e3a5c3fae7d",
                                                  "fecha": "2025-06-15T20:30:00",
                                                  "lugar": "Estadio Santiago Bernabéu",
                                                  "estado": "Finalizado",
                                                  "equipoLocal": {
                                                    "id": "f1a8c0a2-d1ef-45b8-812b-6c9f6f8d3240",
                                                    "nombre": "Real Madrid CF",
                                                    "url_logo": "https://example.com/logos/realmadrid.png"
                                                  },
                                                  "equipoVisitante": {
                                                    "id": "b2b9d3f4-45cb-43de-a1de-8f4fae3f2f2e",
                                                    "nombre": "FC Barcelona",
                                                    "url_logo": "https://example.com/logos/barcelona.png"
                                                  },
                                                  "golesLocal": 3,
                                                  "golesVisitante": 2,
                                                  "mvp": {
                                                    "id": "c4f3e1a8-9880-42f5-8cf7-56464e88888a",
                                                    "nombre": "Jude Bellingham",
                                                    "apodo": "Belli",
                                                    "dorsal": 5,
                                                    "equipoId": "f1a8c0a2-d1ef-45b8-812b-6c9f6f8d3240"
                                                  }
                                                }
                                            """)
                            }
                    )
            ),
            @ApiResponse(
                    responseCode = "404",
                    description = "Jugador, equipo o partido no encontrado",
                    content = @Content(
                            mediaType = "application/problem+json",
                            schema = @Schema(implementation = ProblemDetail.class),
                            examples = {
                                    @ExampleObject(name = "Jugador no encontrado", value = """
                                                {
                                                  "type": "https://api.recreadejuerga.com/errores/jugadores-no-encontrados",
                                                  "title": "Jugadores no encontrados",
                                                  "status": 404,
                                                  "detail": "El jugador con id (UUID) no fue encontrado.",
                                                  "instance": "/partidos/{id}"
                                                }
                                            """),
                                    @ExampleObject(name = "Equipo no encontrado", value = """
                                                {
                                                  "type": "https://api.recreadejuerga.com/errores/equipo-no-encontrado",
                                                  "title": "Equipo no encontrado",
                                                  "status": 404,
                                                  "detail": "No se encontró un equipo con el ID: UUID",
                                                  "instance": "/partidos/{id}"
                                                }
                                            """),
                                    @ExampleObject(name = "Partido no encontrado", value = """
                                                {
                                                  "type": "https://api.recreadejuerga.com/errores/partido-no-encontrado",
                                                  "title": "Partido no encontrado",
                                                  "status": 404,
                                                  "detail": "No hemos encontrado ningún partido con el ID: UUID",
                                                  "instance": "/partidos/{id}"
                                                }
                                            """)
                            }
                    )
            ),
            @ApiResponse(
                    responseCode = "409",
                    description = "Conflictos con restricciones de unicidad",
                    content = @Content(
                            mediaType = "application/problem+json",
                            schema = @Schema(implementation = ProblemDetail.class),
                            examples = {
                                    @ExampleObject(name = "Fecha y lugar duplicado", value = """
                                                {
                                                  "type": "https://api.recreadejuerga.com/errores/campos-duplicados",
                                                  "title": "Campos duplicados",
                                                  "status": 409,
                                                  "detail": "Ya está programado un partido el día 2025-06-22T21:00 en Estadio Benito Villamarín",
                                                  "instance": "/partidos/{id}",
                                                  "campos": {
                                                    "fecha-lugar": "Ya está programado un partido el día 2025-06-22T21:00 en Estadio Benito Villamarín"
                                                  }
                                                }
                                            """),
                                    @ExampleObject(name = "Combinación local/visitante duplicada", value = """
                                                {
                                                  "type": "https://api.recreadejuerga.com/errores/campos-duplicados",
                                                  "title": "Campos duplicados",
                                                  "status": 409,
                                                  "detail": "Ya existe un partido con Real Madrid CF como local y FC Barcelona como visitante",
                                                  "instance": "/partidos/{id}",
                                                  "campos": {
                                                    "equipo-local-visitante": "Ya existe un partido con Real Madrid CF como local y FC Barcelona como visitante"
                                                  }
                                                }
                                            """),
                                    @ExampleObject(name = "Estado inválido", value = """
                                                {
                                                  "type": "https://api.recreadejuerga.com/errores/campos-duplicados",
                                                  "title": "Campos duplicados",
                                                  "status": 409,
                                                  "detail": "El estado debe ser 'Pendiente' o 'Finalizado'",
                                                  "instance": "/partidos/{id}",
                                                  "campos": {
                                                    "estado": "El estado debe ser 'Pendiente' o 'Finalizado'"
                                                  }
                                                }
                                            """)
                            }
                    )
            )
    })
    @PutMapping("/{id}")
    public ResponseEntity<PartidoDTO> editar(
            @io.swagger.v3.oas.annotations.parameters.RequestBody(
                    description = "Partido para editar",
                    required = true,
                    content = @Content(
                            mediaType = "application/json",
                            schema = @Schema(implementation = PartidoFormularioDTO.class),
                            examples = {
                                    @ExampleObject("""
                                                {
                                                  "fecha": "2025-06-22T21:00:00",
                                                  "lugar": "Estadio Benito Villamarín",
                                                  "estado": "Pendiente",
                                                  "equipoLocalId": "a4f0c3e8-1e35-4cb3-a7f1-d8d1c5b09f33",
                                                  "equipoVisitanteId": "b9d1f2e4-8f26-4db7-b918-9f8a78e932ef",
                                                  "golesLocal": 3,
                                                  "golesVisitante": 2,
                                                  "mvpId": "c4f3e1a8-9880-42f5-8cf7-56464e88888a"
                                                }
                                            """)
                            }
                    )
            )
            @Valid @RequestBody PartidoFormularioDTO partido,
            @Parameter(description = "Identificador del partido") @PathVariable UUID id
    ) {
        PartidoDTO actualizado = partidoServicio.modificarPartido(partido, id);
        return ResponseEntity.ok(actualizado);
    }


    @Operation(
            summary = "Borrar un partido de la base de datos",
            description = "Elimina un partido existente mediante su ID. Si el partido no se encuentra, devuelve un error 404.",
            tags = {"parámetros", "eliminar"}
    )
    @ApiResponses({
            @ApiResponse(
                    responseCode = "204",
                    description = "El partido fue eliminado correctamente"
            ),
            @ApiResponse(
                    responseCode = "404",
                    description = "Partido no encontrado",
                    content = @Content(
                            mediaType = "application/problem+json",
                            schema = @Schema(implementation = ProblemDetail.class),
                            examples = {
                                    @ExampleObject(
                                            name = "Partido no encontrado",
                                            value = """
                                                        {
                                                          "type": "https://api.recreadejuerga.com/errores/partido-no-encontrado",
                                                          "title": "Partido no encontrado",
                                                          "status": 404,
                                                          "detail": "No hemos encontrado ningún partido con el ID: 8a7c0e4e-56e3-4f99-8fc4-1e3a5c3fae7d",
                                                          "instance": "/partidos/8a7c0e4e-56e3-4f99-8fc4-1e3a5c3fae7d"
                                                        }
                                                    """
                                    )
                            }
                    )
            )
    })
    @DeleteMapping("/{id}")
    public ResponseEntity<?> eliminar(
            @Parameter(description = "Identificador del partido") @PathVariable UUID id) {
        partidoServicio.eliminarPartido(id);
        return ResponseEntity.noContent().build();
    }

}
