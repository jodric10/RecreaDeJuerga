package com.recreadejuerga.recrea.controladores;

import com.recreadejuerga.recrea.dtos.equipo.EquipoDTO;
import com.recreadejuerga.recrea.dtos.equipo.EquipoFormularioDTO;
import com.recreadejuerga.recrea.servicios.EquipoServicio;
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
@RequestMapping("/equipos")
@Tag(name = "Equipos", description = "Gestión básica de los equipos")
public class EquipoControlador {

    @Autowired
    private EquipoServicio equipoServicio;

    @Operation(
            summary = "Obtener una lista de todos los equipos",
            description = "Permite obtener la información de todos los equipos. Si no hay equipos registrados, se devuelve un error 404.",
            tags = {"todos", "detalles"}
    )
    @ApiResponses({
            @ApiResponse(
                    responseCode = "200",
                    description = "Información detallada de todos los equipos",
                    content = @Content(
                            mediaType = "application/json",
                            schema = @Schema(implementation = EquipoDTO.class),
                            examples = {
                                    @ExampleObject("""
                                                [
                                                  {
                                                    "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
                                                    "nombre": "Real Madrid CF",
                                                    "url_logo": "http://example.com/logo1.png"
                                                  },
                                                  {
                                                    "id": "3fa85f64-5717-4562-b3fc-2c963f54rds2",
                                                    "nombre": "Barcelona FC",
                                                    "url_logo": "http://example.com/logo2.png"
                                                  }
                                                ]
                                            """)
                            }
                    )
            ),
            @ApiResponse(
                    responseCode = "404",
                    description = "No hay equipos registrados en la base de datos",
                    content = @Content(
                            mediaType = "application/problem+json",
                            schema = @Schema(implementation = ProblemDetail.class),
                            examples = {
                                    @ExampleObject("""
                                                {
                                                  "type": "https://api.recreadejuerga.com/errores/equipo-no-encontrado",
                                                  "title": "Equipo no encontrado",
                                                  "status": 404,
                                                  "detail": "No se encontró ningún equipo registrado",
                                                  "instance": "/equipos"
                                                }
                                            """)
                            }
                    )
            )
    })
    @GetMapping
    public ResponseEntity<List<EquipoDTO>> getEquipos() {
        List<EquipoDTO> equipos = equipoServicio.getEquipos();
        return ResponseEntity.ok(equipos);
    }

    @Operation(
            summary = "Obtener un equipo concreto",
            description = "Permite obtener la información de un equipo si se le proporciona un ID válido. Devuelve un error 404 si el equipo no existe.",
            tags = {"parámetros", "detalles"}
    )
    @ApiResponses({
            @ApiResponse(
                    responseCode = "200",
                    description = "Información detallada del equipo",
                    content = @Content(
                            mediaType = "application/json",
                            schema = @Schema(implementation = EquipoDTO.class),
                            examples = {
                                    @ExampleObject("""
                                                {
                                                  "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
                                                  "nombre": "Real Madrid FC",
                                                  "url_logo": "http://example.com/logo1.png"
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
                                                  "detail": "No se encontró un equipo con el ID: 3fa85f64-5717-4562-b3fc-2c963f66afa6",
                                                  "instance": "/equipos/3fa85f64-5717-4562-b3fc-2c963f66afa6"
                                                }
                                            """)
                            }
                    )
            )
    })
    @GetMapping("/{id}")
    public ResponseEntity<EquipoDTO> getEquipoById(
            @Parameter(description = "Identificador del equipo") @PathVariable UUID id) {
        return ResponseEntity.ok(equipoServicio.getEquipo(id));
    }


    @Operation(
            summary = "Para crear un equipo en la base de datos",
            description = "Permite crear un equipo proporcionando un DTO. Devuelve error si el nombre ya existe o hay conflicto de integridad.",
            tags = {"parámetros", "creación"}
    )
    @ApiResponses({
            @ApiResponse(
                    responseCode = "201",
                    description = "Equipo creado correctamente",
                    content = @Content(
                            mediaType = "application/json",
                            schema = @Schema(implementation = EquipoDTO.class),
                            examples = @ExampleObject("""
                                        {
                                          "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
                                          "nombre": "Real Madrid FC",
                                          "url_logo": "http://example.com/logo1.png"
                                        }
                                    """)
                    )
            ),
            @ApiResponse(
                    responseCode = "409",
                    description = "Equipo ya existente o campos duplicados",
                    content = @Content(
                            mediaType = "application/problem+json",
                            schema = @Schema(implementation = ProblemDetail.class),
                            examples = {
                                    @ExampleObject(name = "Equipo ya existente", value = """
                                                {
                                                  "type": "https://api.recreadejuerga.com/errores/equipo-ya-existente",
                                                  "title": "Equipo ya existente",
                                                  "status": 409,
                                                  "detail": "Ya existe un equipo con el nombre 'Real Madrid FC'",
                                                  "instance": "/equipos/alta"
                                                }
                                            """),
                                    @ExampleObject(name = "Campo duplicado", value = """
                                                {
                                                  "type": "https://api.recreadejuerga.com/errores/campos-duplicados",
                                                  "title": "Campos duplicados",
                                                  "status": 409,
                                                  "detail": "Ya existe un equipo con ese nombre (Real Madrid FC)",
                                                  "instance": "/equipos/alta",
                                                  "campos": {
                                                    "nombre": "Ya existe un equipo con ese nombre (Real Madrid FC)"
                                                  }
                                                }
                                            """)
                            }
                    )
            )
    })
    @PostMapping("/alta")
    public ResponseEntity<EquipoDTO> crear(
            @io.swagger.v3.oas.annotations.parameters.RequestBody(
                    description = "Equipo a crear",
                    required = true,
                    content = @Content(
                            mediaType = "application/json",
                            schema = @Schema(implementation = EquipoFormularioDTO.class),
                            examples = @ExampleObject("""
                                        {
                                          "nombre": "Real Madrid FC",
                                          "url_logo": "http://example.com/logo1.png"
                                        }
                                    """)
                    )
            ) @Valid @RequestBody EquipoFormularioDTO equipo) {
        return ResponseEntity.status(HttpStatus.CREATED).body(equipoServicio.insertarEquipo(equipo));
    }


    @Operation(
            summary = "Para modificar un equipo en la base de datos",
            description = "Permite editar un equipo proporcionando un DTO con los datos y un id",
            tags = {"parámetros", "actualizar"}
    )
    @ApiResponses({
            @ApiResponse(
                    responseCode = "200",
                    description = "El equipo actualizado en la base de datos",
                    content = @Content(
                            mediaType = "application/json",
                            schema = @Schema(implementation = EquipoDTO.class),
                            examples = {
                                    @ExampleObject("""
                                                {
                                                  "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
                                                  "nombre": "Real Madrid FC",
                                                  "url_logo": "http://example.com/logo1.png",
                                                  "clasificacion": {
                                                    "posicion": 1,
                                                    "puntos": 80,
                                                    "partidosJugados": 35
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
                                                  "detail": "No se encontró un equipo con el ID: 3fa85f64-5717-4562-b3fc-2c963f66afa6",
                                                  "instance": "/equipos/3fa85f64-5717-4562-b3fc-2c963f66afa6"
                                                }
                                            """)
                            }
                    )
            ),
            @ApiResponse(
                    responseCode = "409",
                    description = "Conflicto por campos duplicados",
                    content = @Content(
                            mediaType = "application/problem+json",
                            schema = @Schema(implementation = ProblemDetail.class),
                            examples = {
                                    @ExampleObject("""
                                                {
                                                  "type": "https://api.recreadejuerga.com/errores/campos-duplicados",
                                                  "title": "Campos duplicados",
                                                  "status": 409,
                                                  "detail": "Ya existe un equipo con ese nombre (Real Madrid FC)",
                                                  "instance": "/equipos/3fa85f64-5717-4562-b3fc-2c963f66afa6",
                                                  "campos": {
                                                    "nombre": "Este nombre ya está en uso"
                                                  }
                                                }
                                            """)
                            }
                    )
            )
    })
    @PutMapping("/{id}")
    public ResponseEntity<EquipoDTO> editar(
            @io.swagger.v3.oas.annotations.parameters.RequestBody(
                    description = "Equipo para editar",
                    required = true,
                    content = @Content(
                            mediaType = "application/json",
                            schema = @Schema(implementation = EquipoFormularioDTO.class),
                            examples = {
                                    @ExampleObject("""
                                                {
                                                  "nombre": "Real Madrid FC",
                                                  "url_logo": "http://example.com/logo1.png"
                                                }
                                            """)
                            }
                    )
            )
            @Valid @RequestBody EquipoFormularioDTO equipo,
            @Parameter(description = "Identificador del equipo") @PathVariable UUID id
    ) {
        EquipoDTO actualizado = equipoServicio.modificarEquipo(equipo, id);
        return ResponseEntity.ok(actualizado);
    }


    @Operation(
            summary = "Para borrar un equipo de la base de datos",
            description = "Permite borrar un equipo mediante un id",
            tags = {"parámetros", "eliminar"}
    )
    @ApiResponses({
            @ApiResponse(
                    responseCode = "204",
                    description = "El equipo eliminado en la base de datos"
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
                                                  "detail": "No se encontró un equipo con el ID: 3fa85f64-5717-4562-b3fc-2c963f66afa6",
                                                  "instance": "/equipos/3fa85f64-5717-4562-b3fc-2c963f66afa6"
                                                }
                                            """)
                            }
                    )
            )
    })
    @DeleteMapping("/{id}")
    public ResponseEntity<?> eliminar(
            @Parameter(description = "Identificador del equipo") @PathVariable UUID id) {
        equipoServicio.eliminarEquipo(id);
        return ResponseEntity.noContent().build();
    }

}
