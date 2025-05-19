package com.recreadejuerga.recrea.controladores;


import com.recreadejuerga.recrea.dtos.jugador.JugadorDTO;
import com.recreadejuerga.recrea.dtos.jugador.JugadorFormularioDTO;
import com.recreadejuerga.recrea.servicios.JugadorServicio;
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
@RequestMapping("/jugadores")
@Tag(name = "Jugadores", description = "Gestión básica de los jugadores")
public class JugadorControlador {

    @Autowired
    private JugadorServicio jugadorServicio;

    @Operation(
            summary = "Obtener todos los jugadores de un equipo en concreto",
            description = "Permite obtener la información de los jugadores de un equipo si se le proporciona un equipo_id",
            tags = {"parámetros","detalles"}
    )
    @ApiResponse(
            description = "Información detallada de los jugadores de un equipo", responseCode = "200",
            content = @Content(
                    mediaType = "application/json",
                    schema = @Schema(implementation = JugadorDTO.class),
                    examples = {
                            @ExampleObject("""
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
                                      },
                                      {
                                        "id": "a7fcbfa4-b123-4ab8-a60b-8a7dbdc4e1e9",
                                        "nombre": "Jude Bellingham",
                                        "apodo": "Belli",
                                        "dorsal": 5,
                                        "posicion": "Mediocampista Ofensivo",
                                        "pieDominante": "Derecho",
                                        "golesTotales": 23,
                                        "asistenciasTotales": 7,
                                        "fortalezas": "Llegada al área, visión de juego, conducción, definición, liderazgo",
                                        "fechaNacimiento": "2003-06-29",
                                        "fotoFrontal": "https://example.com/fotos/bellingham-frontal.jpg",
                                        "fotoTarjeta": "https://example.com/fotos/bellingham-tarjeta.jpg",
                                        "fotoPose": "https://example.com/fotos/bellingham-pose.jpg",
                                        "parecidos": [
                                          {
                                            "id": "b1111111-bbbb-4ccc-dddd-eeeeeeeeeeee",
                                            "parecido": "Steven Gerrard"
                                          },
                                          {
                                            "id": "b2222222-bbbb-4ccc-dddd-eeeeeeeeeeee",
                                            "parecido": "Zinedine Zidane"
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
    )
    @GetMapping("equipo/{equipo_id}")
    public ResponseEntity<List<JugadorDTO>> getJugadoresOfATeam( @Parameter(description = "Identificador del equipo") @PathVariable UUID equipo_id){
        List<JugadorDTO> jugadores_equipo= jugadorServicio.getJugadoresByEquipo(equipo_id);
        return ResponseEntity.ok(jugadores_equipo);
    }

    @Operation(
            summary = "Obtener un jugador concreto",
            description = "Permite obtener la información de un jugador si se le proporciona un id",
            tags = {"parámetros","detalles"}
    )
    @ApiResponse(
            description = "Información detallada de un jugador", responseCode = "200",
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
    )
    @GetMapping("/{id}")
    public ResponseEntity<JugadorDTO> getJugadorById(@Parameter(description = "Identificador del jugador")  @PathVariable UUID id){
        return ResponseEntity.ok(jugadorServicio.getJugadorById(id));
    }


    @Operation(
            summary = "Para insertar un jugador de un equipo en la base de datos",
            description = "Permite insertar un jugador de un equipo proporcionando un DTO con los datos y un id",
            tags = {"parámetros","creación"}
    )
    @ApiResponse(
            description = "El equipo insertado en la base de datos", responseCode = "200",
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
    )
    @PostMapping("/alta")
    public ResponseEntity<JugadorDTO> crear(@io.swagger.v3.oas.annotations.parameters.RequestBody(
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
    ) @Valid @RequestBody JugadorFormularioDTO jugador) {
        return ResponseEntity.status(HttpStatus.CREATED).body(jugadorServicio.insertarJugador(jugador));
    }

    @Operation(
            summary = "Para modificar un jugador en la base de datos",
            description = "Permite editar un jugador proporcionando un DTO con los datos y un id",
            tags = {"parámetros","actualizar"}
    )
    @ApiResponse(
            description = "El jugador actualizado en la base de datos", responseCode = "200",
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
    )
    @PutMapping("/{id}")
    public ResponseEntity<JugadorDTO> editar(@io.swagger.v3.oas.annotations.parameters.RequestBody(
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
    ) @Valid @RequestBody JugadorFormularioDTO jugador, @Parameter(description = "Identificador del jugador") @PathVariable UUID id){
        JugadorDTO actualizado = jugadorServicio.modificarJugador(jugador, id);
        return ResponseEntity.ok(actualizado);
    }


    @Operation(
            summary = "Para borrar un jugador de la base de datos",
            description = "Permite borrar un jugador mediante un id",
            tags = {"parámetros","eliminar"}
    )
    @ApiResponse(
            description = "El jugador eliminado en la base de datos", responseCode = "204"
    )
    @DeleteMapping("/{id}")
    public ResponseEntity<?> eliminar(@Parameter(description = "Identificador del jugador") @PathVariable UUID id){
        jugadorServicio.eliminarJugador(id);
        return ResponseEntity.noContent().build();
    }
}
