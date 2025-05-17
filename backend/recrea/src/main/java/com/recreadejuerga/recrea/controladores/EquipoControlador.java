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
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
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
            description = "Permite obtener la información de todos los equipos",
            tags = {"todos","detalles"}
    )
    @ApiResponse(
            description = "Información detallada de todos los equipos", responseCode = "200",
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
    )
    @GetMapping
    public ResponseEntity<List<EquipoDTO>> getEquipos(){
        List<EquipoDTO> equipos= equipoServicio.getEquipos();
        return ResponseEntity.ok(equipos);
    }

    @Operation(
            summary = "Obtener un equipo concreto",
            description = "Permite obtener la información de un equipo si se le proporciona un id",
            tags = {"parámetros","detalles"}
    )
    @ApiResponse(
            description = "Información detallada del equipo", responseCode = "200",
            content = @Content(
                    mediaType = "application/json",
                    schema = @Schema(implementation = EquipoDTO.class),
                    examples = {
                            @ExampleObject("""
                                    {
                                      "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
                                      "nombre": "Real Madrid FC",
                                      "url_logo": "http://example.com/logo1.png",
                                    }
                                    """)
                    }
            )
    )
    @GetMapping("/{id}")
    public ResponseEntity<EquipoDTO> getEquipoById(@Parameter(description = "Identificador del equipo") @PathVariable UUID id){
        return ResponseEntity.ok(equipoServicio.getEquipo(id));
    }

    @Operation(
            summary = "Para crear un equipo en la base de datos",
            description = "Permite crear un equipo proporcionando un DTO",
            tags = {"parámetros","creación"}
    )
    @ApiResponse(
            description = "El equipo creado en la base de datos", responseCode = "200",
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
    )
    @PostMapping("/alta")
    public ResponseEntity<EquipoDTO> crear(@io.swagger.v3.oas.annotations.parameters.RequestBody(
            description = "Equipo a crear",
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
    ) @Valid @RequestBody EquipoFormularioDTO equipo) {
        return ResponseEntity.status(HttpStatus.CREATED).body(equipoServicio.insertarEquipo(equipo));
    }

    @Operation(
            summary = "Para modificar un equipo en la base de datos",
            description = "Permite editar un equipo proporcionando un DTO con los datos y un id",
            tags = {"parámetros","actualizar"}
    )
    @ApiResponse(
            description = "El equipo actualizado en la base de datos", responseCode = "200",
            content = @Content(
                    mediaType = "application/json",
                    schema = @Schema(implementation = EquipoDTO.class),
                    examples = {
                            @ExampleObject("""
                                    {
                                        "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
                                        "nombre": "Real Madrid FC",
                                        "url_logo": "http://example.com/logo1.png",
                                        clasificacion: {
                                            "posicion": 1,
                                            "puntos":80,
                                            "partidosJugados":35
                                        }
                                    }
                                    """)
                    }
            )
    )
    @PutMapping("/{id}")
    public ResponseEntity<EquipoDTO> editar(@io.swagger.v3.oas.annotations.parameters.RequestBody(
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
    ) @Valid @RequestBody EquipoFormularioDTO equipo, @Parameter(description = "Identificador del equipo") @PathVariable UUID id){
        EquipoDTO actualizado = equipoServicio.modificarEquipo(equipo, id);
        return ResponseEntity.ok(actualizado);
    }

    @Operation(
            summary = "Para borrar un equipo de la base de datos",
            description = "Permite borrar un equipo mediante un id",
            tags = {"parámetros","eliminar"}
    )
    @ApiResponse(
            description = "El equipo eliminado en la base de datos", responseCode = "204"
    )
    @DeleteMapping("/{id}")
    public ResponseEntity<?> eliminar(@Parameter(description = "Identificador del equipo") @PathVariable UUID id){
        equipoServicio.eliminarEquipo(id);
        return ResponseEntity.noContent().build();
    }

}
