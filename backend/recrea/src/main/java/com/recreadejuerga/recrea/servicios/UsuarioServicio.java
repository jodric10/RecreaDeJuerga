package com.recreadejuerga.recrea.servicios;

import com.recreadejuerga.recrea.dtos.usuario.UserRegisterDTO;
import com.recreadejuerga.recrea.entidades.Usuario;
import com.recreadejuerga.recrea.repositorios.UsuarioRepositorio;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UsuarioServicio {

    private final UsuarioRepositorio repo;
    private final PasswordEncoder passwordEncoder;

    public UsuarioServicio(UsuarioRepositorio repository, PasswordEncoder passwordEncoder) {
        this.repo = repository;
        this.passwordEncoder = passwordEncoder;
    }

    public Optional<Usuario> findByUsername(String username) {
        return this.repo.findByUsername(username);
    }

    public Usuario save(UserRegisterDTO userDTO) {
        Usuario user = new Usuario(
                null,
                userDTO.username(),
                passwordEncoder.encode(userDTO.password()),
                userDTO.email(),
                List.of("ADMIN")
        );
        return this.repo.save(user);
    }
}
