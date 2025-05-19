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
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
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
            description = "Permite obtener la información de los partidos de un equipo si se le proporciona un equipo_id",
            tags = {"parámetros","detalles"}
    )
    @ApiResponse(
            description = "Información detallada de los partidos de un equipo ordenados de más antiguos a mas recientes", responseCode = "200",
            content = @Content(
                    mediaType = "application/json",
                    schema = @Schema(implementation = PartidoDTO.class),
                    examples = {
                            @ExampleObject("""
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
                                      },
                                      {
                                        "id": "ae934cfa-bbfc-4e01-8ef1-0bfa27a6ed00",
                                        "fecha": "2025-06-20T18:00:00",
                                        "lugar": "Estadio Wanda Metropolitano",
                                        "estado": "Pendiente",
                                        "equipoLocal": {
                                          "id": "c1d4e9f2-1e54-4e8a-b97f-15fbb2cb5529",
                                          "nombre": "Atlético de Madrid",
                                          "url_logo": "https://example.com/logos/atletico.png"
                                        },
                                        "equipoVisitante": {
                                          "id": "d4c8e7a3-9b43-4201-a3f7-8e42f6c5e7f2",
                                          "nombre": "Sevilla FC",
                                          "url_logo": "https://example.com/logos/sevilla.png"
                                        },
                                        "golesLocal": null,
                                        "golesVisitante": null,
                                        "mvp": null
                                      }
                                    ]
                                    """)
                    }
            )
    )
    @GetMapping("/{equipo_id}")
    public ResponseEntity<List<PartidoDTO>> getPartidosDeUnEquipo(@Parameter(description = "Identificador del equipo") @PathVariable UUID equipo_id){
        List<PartidoDTO> partidosEquipo= partidoServicio.getPartidosDeUnEquipo(equipo_id);
        return ResponseEntity.ok(partidosEquipo);
    }

    @Operation(
            summary = "Para insertar un partido en la base de datos",
            description = "Permite insertar un partido proporcionando un DTO con los datos",
            tags = {"parámetros","creación"}
    )
    @ApiResponse(
            description = "El partido insertado en la base de datos", responseCode = "200",
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
    )
    @PostMapping("/alta")
    public ResponseEntity<PartidoDTO> crear(@io.swagger.v3.oas.annotations.parameters.RequestBody(
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
    ) @Valid @RequestBody PartidoFormularioDTO partido) {
        return ResponseEntity.status(HttpStatus.CREATED).body(partidoServicio.insertarPartido(partido));
    }

    @Operation(
            summary = "Para modificar un partido en la base de datos",
            description = "Permite editar un partido proporcionando un DTO con los datos y un id",
            tags = {"parámetros","actualizar"}
    )
    @ApiResponse(
            description = "El partido actualizado en la base de datos", responseCode = "200",
            content = @Content(
                    mediaType = "application/json",
                    schema = @Schema(implementation = JugadorDTO.class),
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
    )
    @PutMapping("/{id}")
    public ResponseEntity<PartidoDTO> editar(@io.swagger.v3.oas.annotations.parameters.RequestBody(
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
    ) @Valid @RequestBody PartidoFormularioDTO partido, @Parameter(description = "Identificador del partido") @PathVariable UUID id){
        PartidoDTO actualizado = partidoServicio.modificarPartido(partido, id);
        return ResponseEntity.ok(actualizado);
    }


    @Operation(
            summary = "Para borrar un partido de la base de datos",
            description = "Permite borrar un partido mediante un id",
            tags = {"parámetros","eliminar"}
    )
    @ApiResponse(
            description = "El partido eliminado en la base de datos", responseCode = "204"
    )
    @DeleteMapping("/{id}")
    public ResponseEntity<?> eliminar(@Parameter(description = "Identificador del partido") @PathVariable UUID id){
        partidoServicio.eliminarPartido(id);
        return ResponseEntity.noContent().build();
    }
}
