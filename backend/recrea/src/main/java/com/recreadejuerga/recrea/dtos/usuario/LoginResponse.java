package com.recreadejuerga.recrea.dtos.usuario;

import java.util.List;

public record LoginResponse(String username, List<String> authorities, String token) {
}

