package com.recreadejuerga.recrea.controladores;

import com.recreadejuerga.recrea.dtos.usuario.LoginRequest;
import com.recreadejuerga.recrea.dtos.usuario.LoginResponse;
import com.recreadejuerga.recrea.dtos.usuario.UserRegisterDTO;
import com.recreadejuerga.recrea.entidades.Usuario;
import com.recreadejuerga.recrea.seguridad.JwtTokenProvider;
import com.recreadejuerga.recrea.servicios.UsuarioServicio;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.ExampleObject;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ProblemDetail;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/auth")
@CrossOrigin(origins = "http://localhost:4200", allowCredentials = "true")
@Tag(name = "Autenticación", description = "Registro e inicio de sesión de usuarios")
public class AuthControlador {

    @Autowired
    private UsuarioServicio userService;

    @Autowired
    private AuthenticationManager authManager;

    @Autowired
    private JwtTokenProvider jwtTokenProvider;

    @Operation(
            summary = "Registro de nuevo usuario",
            description = "Permite registrar un nuevo usuario con nombre, correo y contraseña."
    )
    @ApiResponses({
            @ApiResponse(
                    responseCode = "200",
                    description = "Usuario registrado exitosamente",
                    content = @Content(
                            mediaType = "application/json",
                            schema = @Schema(implementation = Usuario.class),
                            examples = @ExampleObject("""
                                {
                                  "id": "b1c2d3e4-1234-4567-89ab-0abc00000001",
                                  "username": "user1",
                                  "email": "user1@jwt.io",
                                  "roles": ["ROLE_USER"]
                                }
                            """)
                    )
            ),
            @ApiResponse(
                    responseCode = "400",
                    description = "Error en los datos de entrada",
                    content = @Content(
                            mediaType = "application/problem+json",
                            schema = @Schema(implementation = ProblemDetail.class),
                            examples = @ExampleObject("""
                                {
                                  "type": "https://api.recreadejuerga.com/errores/registro-invalido",
                                  "title": "Datos inválidos",
                                  "status": 400,
                                  "detail": "Las contraseñas no coinciden o el usuario ya existe",
                                  "instance": "/auth/register"
                                }
                            """)
                    )
            )
    })
    @PostMapping("/register")
    public Usuario save(
            @io.swagger.v3.oas.annotations.parameters.RequestBody(
                    description = "Datos para registrar un nuevo usuario",
                    required = true,
                    content = @Content(
                            mediaType = "application/json",
                            schema = @Schema(implementation = UserRegisterDTO.class),
                            examples = @ExampleObject("""
                                {
                                  "username": "user1",
                                  "email": "user1@jwt.io",
                                  "password": "admin",
                                  "password2": "admin"
                                }
                            """)
                    )
            )
            @Valid @RequestBody UserRegisterDTO userDTO
    ) {
        return this.userService.save(userDTO);
    }

    @Operation(
            summary = "Inicio de sesión",
            description = "Permite autenticar a un usuario con su nombre de usuario y contraseña. Devuelve un JWT válido."
    )
    @ApiResponses({
            @ApiResponse(
                    responseCode = "200",
                    description = "Autenticación exitosa",
                    content = @Content(
                            mediaType = "application/json",
                            schema = @Schema(implementation = LoginResponse.class),
                            examples = @ExampleObject("""
                                {
                                  "username": "user1",
                                  "authorities": ["ROLE_USER"],
                                  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
                                }
                            """)
                    )
            ),
            @ApiResponse(
                    responseCode = "401",
                    description = "Credenciales incorrectas",
                    content = @Content(
                            mediaType = "application/problem+json",
                            schema = @Schema(implementation = ProblemDetail.class),
                            examples = @ExampleObject("""
                                {
                                  "type": "https://api.recreadejuerga.com/errores/login-invalido",
                                  "title": "Credenciales inválidas",
                                  "status": 401,
                                  "detail": "Nombre de usuario o contraseña incorrectos",
                                  "instance": "/auth/login"
                                }
                            """)
                    )
            )
    })
    @PostMapping("/login")
    public LoginResponse login(
            @io.swagger.v3.oas.annotations.parameters.RequestBody(
                    description = "Credenciales para iniciar sesión",
                    required = true,
                    content = @Content(
                            mediaType = "application/json",
                            schema = @Schema(implementation = LoginRequest.class),
                            examples = @ExampleObject("""
                                {
                                  "username": "user1",
                                  "password": "admin"
                                }
                            """)
                    )
            )
            @Valid @RequestBody LoginRequest loginDTO
    ) {
        Authentication authDTO = new UsernamePasswordAuthenticationToken(loginDTO.username(), loginDTO.password());
        Authentication authentication = this.authManager.authenticate(authDTO);
        Usuario user = (Usuario) authentication.getPrincipal();
        String token = this.jwtTokenProvider.generateToken(authentication);

        return new LoginResponse(
                user.getUsername(),
                user.getAuthorities().stream().map(GrantedAuthority::getAuthority).toList(),
                token
        );
    }
}
