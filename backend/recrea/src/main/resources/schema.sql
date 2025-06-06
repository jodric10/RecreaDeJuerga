
CREATE TABLE IF NOT EXISTS usuario (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255),
    password VARCHAR(255),
    email VARCHAR(255) UNIQUE
);

CREATE TABLE IF NOT EXISTS usuario_roles (
    usuario_id INTEGER NOT NULL,
    role VARCHAR(255),
    FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);

CREATE TABLE IF NOT EXISTS equipos (
  id         UUID        PRIMARY KEY,
  nombre     VARCHAR(100) NOT NULL,
  url_logo   TEXT,
  CONSTRAINT uk_equipo_nombre UNIQUE (nombre)
);

CREATE TABLE IF NOT EXISTS jugadores (
  id                   UUID      PRIMARY KEY,
  nombre               TEXT      NOT NULL,
  apodo                TEXT,
  dorsal               INT       NOT NULL,
  posicion             TEXT,
  pie_dominante        TEXT,
  goles_totales        INT       DEFAULT 0,
  asistencias_totales  INT       DEFAULT 0,
  fortalezas           TEXT,
  fecha_nacimiento     DATE,
  nacionalidad         VARCHAR(50),
  equipo_id            UUID      NOT NULL REFERENCES equipos(id) ON DELETE CASCADE,
  foto_frontal         TEXT,
  foto_tarjeta         TEXT,
  foto_pose            TEXT,
  CONSTRAINT uk_jugador_equipo_dorsal UNIQUE(equipo_id, dorsal)
);

CREATE TABLE IF NOT EXISTS jugadores_parecidos (
  id         UUID      PRIMARY KEY,
  jugador_id UUID      REFERENCES jugadores(id) ON DELETE CASCADE,
  parecido   TEXT      NOT NULL,
  CONSTRAINT uk_jugador_parecido UNIQUE(jugador_id, parecido)
);

CREATE TABLE IF NOT EXISTS partidos (
  id               UUID      PRIMARY KEY,
  fecha            TIMESTAMP NOT NULL,
  lugar            TEXT      NOT NULL,
  estado           TEXT,
  equipo_local     UUID      REFERENCES equipos(id) ON DELETE SET NULL,
  equipo_visitante UUID      REFERENCES equipos(id) ON DELETE SET NULL,
  goles_local      INT,
  goles_visitante  INT,
  mvp_id           UUID      REFERENCES jugadores(id) ON DELETE SET NULL,
  CONSTRAINT uk_partido_fecha_lugar UNIQUE(fecha, lugar),
  CONSTRAINT uk_partido_equipo_local_equipo_visitante UNIQUE(equipo_local, equipo_visitante)
);

CREATE TABLE IF NOT EXISTS clasificaciones (
  equipo_id         UUID      PRIMARY KEY REFERENCES equipos(id) ON DELETE CASCADE,
  puntos            INT       NOT NULL,
  partidos_jugados  INT       NOT NULL,
  ganados           INT       NOT NULL,
  empatados         INT       NOT NULL,
  perdidos          INT       NOT NULL,
  goles_a_favor     INT       NOT NULL,
  goles_contra      INT       NOT NULL,
  diferencia_goles  INT       NOT NULL,
  promedio_tf_tc    NUMERIC(4,2)
);

CREATE TABLE IF NOT EXISTS estadisticas_jugador_partido (
  id          UUID      PRIMARY KEY,
  jugador_id  UUID      REFERENCES jugadores(id) ON DELETE CASCADE,
  partido_id  UUID      REFERENCES partidos(id) ON DELETE CASCADE,
  goles       INT       DEFAULT 0,
  asistencias INT       DEFAULT 0,
  amarilla    BOOLEAN   DEFAULT FALSE,
  roja        BOOLEAN   DEFAULT FALSE,
  portero     BOOLEAN   DEFAULT FALSE,
  CONSTRAINT unique_jugador_partido UNIQUE(jugador_id, partido_id)
);