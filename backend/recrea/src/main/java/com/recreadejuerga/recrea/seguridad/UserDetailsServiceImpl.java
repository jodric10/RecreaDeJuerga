package com.recreadejuerga.recrea.seguridad;

import com.recreadejuerga.recrea.error.UsuarioNoEncontradoException;
import com.recreadejuerga.recrea.servicios.UsuarioServicio;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

/*
Permite que Spring Security sepa cómo extraer el usuario de base de datos
para realizar la autenticación
 */
@Service
public class UserDetailsServiceImpl implements UserDetailsService{

    Logger log = LoggerFactory.getLogger(UserDetailsServiceImpl.class);

    private final UsuarioServicio usuarioService;

    public UserDetailsServiceImpl(UsuarioServicio usuarioService) {
        this.usuarioService = usuarioService;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        log.debug("loadUserByUsername {}", username);
        return this.usuarioService.findByUsername(username);
    }
}
