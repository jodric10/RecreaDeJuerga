package com.recreadejuerga.recrea.controladores;

import com.recreadejuerga.recrea.dtos.clasificacion.ClasificacionDTO;
import com.recreadejuerga.recrea.dtos.clasificacion.ClasificacionEditarDTO;
import com.recreadejuerga.recrea.servicios.ClasificacionServicio;
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
import org.springframework.http.ProblemDetail;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/clasificacion")
@Tag(name = "Clasificación", description = "Gestión básica de la clasificación")
public class ClasificacionControlador {

    @Autowired
    private ClasificacionServicio clasificacionServicio;

    @Operation(
            summary = "Obtener la clasificación de la liga",
            description = "Permite obtener la información de la clasificación de la liga ordenada por puntos.",
            tags = {"todos", "detalles"}
    )
    @ApiResponses({
            @ApiResponse(
                    responseCode = "200",
                    description = "Información detallada de la clasificación de la liga",
                    content = @Content(
                            mediaType = "application/json",
                            array = @ArraySchema(schema = @Schema(implementation = ClasificacionDTO.class)),
                            examples = @ExampleObject("""
                                        [
                                          {
                                            "id": "b1c2d3e4-1111-4a22-8bbb-0abc00000001",
                                            "puntos": 55,
                                            "partidosJugados": 20,
                                            "ganados": 18,
                                            "empatados": 1,
                                            "perdidos": 1,
                                            "golesFavor": 55,
                                            "golesContra": 15,
                                            "diferenciaGoles": 40,
                                            "promedioTfTc": 3.67,
                                            "equipo": {
                                              "id": "b1c2d3e4-1111-4a22-8bbb-0abc00000001",
                                              "nombre": "Real Madrid",
                                              "urlLogo": "https://cdn.recrea.com/logos/realmadrid.png"
                                            }
                                          }
                                        ]
                                    """)
                    )
            ),
            @ApiResponse(
                    responseCode = "404",
                    description = "Clasificación no encontrada",
                    content = @Content(
                            mediaType = "application/problem+json",
                            schema = @Schema(implementation = ProblemDetail.class),
                            examples = @ExampleObject("""
                                        {
                                          "type": "https://api.recreadejuerga.com/errores/clasificacion-no-encontrada",
                                          "title": "Clasificación no encontrada",
                                          "status": 404,
                                          "detail": "No hay datos de clasificación disponibles",
                                          "instance": "/clasificaciones"
                                        }
                                    """)
                    )
            )
    })
    @GetMapping
    public ResponseEntity<List<ClasificacionDTO>> getClasificacion() {
        List<ClasificacionDTO> clasificacion = clasificacionServicio.getClasificacion();
        return ResponseEntity.ok(clasificacion);
    }


    @Operation(
            summary = "Modificar la clasificación de un equipo",
            description = "Edita los datos de una clasificación existente mediante su ID. Si no se encuentra la clasificación o el equipo relacionado, se devuelve un error 404.",
            tags = {"parámetros", "actualizar"}
    )
    @ApiResponses({
            @ApiResponse(
                    responseCode = "200",
                    description = "La clasificación del equipo actualizada en la base de datos",
                    content = @Content(
                            mediaType = "application/json",
                            schema = @Schema(implementation = ClasificacionDTO.class),
                            examples = @ExampleObject("""
                                        {
                                            "id": "c2d3e4f5-2222-4b33-9ccc-0abc00000002",
                                            "puntos": 48,
                                            "partidosJugados": 20,
                                            "ganados": 15,
                                            "empatados": 3,
                                            "perdidos": 2,
                                            "golesFavor": 48,
                                            "golesContra": 20,
                                            "diferenciaGoles": 28,
                                            "promedioTfTc": 2.40,
                                            "equipo": {
                                              "id": "c2d3e4f5-2222-4b33-9ccc-0abc00000002",
                                              "nombre": "FC Barcelona",
                                              "urlLogo": "https://cdn.recrea.com/logos/barcelona.png"
                                            }
                                        }
                                    """)
                    )
            ),
            @ApiResponse(
                    responseCode = "404",
                    description = "Clasificación o equipo no encontrado",
                    content = @Content(
                            mediaType = "application/problem+json",
                            schema = @Schema(implementation = ProblemDetail.class),
                            examples = @ExampleObject("""
                                        {
                                          "type": "https://api.recreadejuerga.com/errores/clasificacion-no-encontrada",
                                          "title": "Clasificación no encontrada",
                                          "status": 404,
                                          "detail": "No se encontró un equipo con el ID: c2d3e4f5-2222-4b33-9ccc-0abc00000002",
                                          "instance": "/clasificaciones/{id}"
                                        }
                                    """)
                    )
            )
    })
    @PutMapping("/{id}")
    public ResponseEntity<ClasificacionDTO> editar(
            @io.swagger.v3.oas.annotations.parameters.RequestBody(
                    description = "Clasificación de un equipo para modificar",
                    required = true,
                    content = @Content(
                            mediaType = "application/json",
                            schema = @Schema(implementation = ClasificacionEditarDTO.class),
                            examples = @ExampleObject("""
                                        {
                                            "puntos": 58,
                                            "partidosJugados": 21,
                                            "ganados": 19,
                                            "empatados": 1,
                                            "perdidos": 1,
                                            "golesAFavor": 60,
                                            "golesContra": 16
                                        }
                                    """)
                    )
            )
            @Valid @RequestBody ClasificacionEditarDTO clasificacion,
            @Parameter(description = "Identificador de la clasificación de un equipo") @PathVariable UUID id
    ) {
        ClasificacionDTO actualizado = clasificacionServicio.modificarClasificacion(clasificacion, id);
        return ResponseEntity.ok(actualizado);
    }

}
