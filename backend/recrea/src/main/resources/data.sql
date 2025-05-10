INSERT INTO equipos (nombre, url_logo) VALUES
  ('Elespot Mandangon SP', 'http://example.com/logo1.png'),
  ('El Colectivo', 'http://example.com/logo2.png'),
  ('More Kapa FS', 'http://example.com/logo3.png'),
  ('Guajes', 'http://example.com/logo4.png'),
  ('Recrea de Juerga', 'http://example.com/logo5.png'),
  ('Palillos a la Mar', 'http://example.com/logo6.png'),
  ('Man Red', 'http://example.com/logo7.png'),
  ('Golesalavés', 'http://example.com/logo8.png'),
  ('Green Park United', 'http://example.com/logo9.png'),
  ('Comando Navacerrada', 'http://example.com/logo10.png'),
  ('Los Potros FC', 'http://example.com/logo11.png'),
  ('Maped', 'http://example.com/logo12.png'),
  ('Mambo FC', 'http://example.com/logo13.png')
ON CONFLICT (nombre)
DO UPDATE SET url_logo = EXCLUDED.url_logo;


INSERT INTO nacionalidades (nombre, codigo_iso, icono) VALUES
  ('España', 'ES', '🇪🇸'),
  ('Chile',  'CL', '🇨🇱')
ON CONFLICT (nombre) DO UPDATE
SET icono = EXCLUDED.icono;

INSERT INTO jugadores (
    nombre, apodo, dorsal, posicion, pie_dominante, goles_totales, asistencias_totales,
    fortalezas, fecha_nacimiento, equipo_id, foto_frontal, foto_tarjeta, foto_pose
) VALUES
('Jorge González Pérez', 'González', 11, 'Ala', 'Derecho', 9, 15, 'Calidad, control, pase, arranque', '2004-05-03',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'), 'http://example.com/foto_frontal1.png', 'http://example.com/foto_tarjeta1.png', 'http://example.com/foto_pose1.png'),

('Nacho Manzano Pérez', 'Manzano', 17, 'Ala', 'Derecho', 4, 7, 'Pulmón, visión, box to box', '2004-09-17',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'), 'http://example.com/foto_frontal2.png', 'http://example.com/foto_tarjeta2.png', 'http://example.com/foto_pose2.png'),

('Daniel Manzano Pérez', 'Dani', 35, 'Cierre', 'Derecho', 2, 5, 'Visión, pase, control', '2007-08-09',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'), 'http://example.com/foto_frontal3.png', 'http://example.com/foto_tarjeta3.png', 'http://example.com/foto_pose3.png'),

('Jorge Sánchez Rodríguez', 'Kalibuchi', 2, 'Cierre', 'Izquierdo', 4, 5, 'Golpeo potente, defensa, asociación', '2004-09-17',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'), 'http://example.com/foto_frontal4.png', 'http://example.com/foto_tarjeta4.png', 'http://example.com/foto_pose4.png'),

('Adrián Carvajal Sánchez', 'Adri', 19, 'Pívot', 'Derecho', 23, 11, 'Físico, velocidad, remate', '2004-03-22',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'), 'http://example.com/foto_frontal5.png', 'http://example.com/foto_tarjeta5.png', 'http://example.com/foto_pose5.png'),

('Santiago Alejandro Chaya', 'Santi', 14, 'Pívot', 'Derecho', 13, 8, 'Fuerza, resistencia, velocidad', '2004-08-18',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'), 'http://example.com/foto_frontal1.png', 'http://example.com/foto_tarjeta1.png', 'http://example.com/foto_pose1.png'),

('Alberto González Pérez', 'Alberoto', 5, 'Ala', 'Derecho', 2, 7, 'Inteligencia, apoyo, sacrificio', '1999-07-20',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'), 'http://example.com/foto_frontal2.png', 'http://example.com/foto_tarjeta2.png', 'http://example.com/foto_pose2.png'),

('Raúl García Rodrigo', 'Ra', 1, 'Portero', 'Derecho', 3, 3, 'Reflejos, colocación, visión', '2004-12-04',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'), 'http://example.com/foto_frontal3.png', 'http://example.com/foto_tarjeta3.png', 'http://example.com/foto_pose3.png'),

('Fernando Méndez Lera', 'Fer', 8, 'Ala', 'Izquierdo', 15, 8, 'Desborde, zurda, disparo', '2007-01-27',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'), 'http://example.com/foto_frontal4.png', 'http://example.com/foto_tarjeta4.png', 'http://example.com/foto_pose4.png'),

('Alfonso Peris Pérez', 'Fonsi', 12, 'Pívot', 'Derecho', 4, 3, 'Compromiso, movilidad, físico', '2004-10-17',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'), 'http://example.com/foto_frontal5.png', 'http://example.com/foto_tarjeta5.png', 'http://example.com/foto_pose5.png'),

('Mario Rodríguez Díaz', 'Mario', 21, 'Ala', 'Derecho', 2, 3, 'Calidad, sacrificio, apoyo', '2004-06-11',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'), 'http://example.com/foto_frontal6.png', 'http://example.com/foto_tarjeta6.png', 'http://example.com/foto_pose6.png')

ON CONFLICT (equipo_id, dorsal) DO UPDATE SET
  nombre = EXCLUDED.nombre,
  apodo = EXCLUDED.apodo,
  posicion = EXCLUDED.posicion,
  pie_dominante = EXCLUDED.pie_dominante,
  goles_totales = EXCLUDED.goles_totales,
  asistencias_totales = EXCLUDED.asistencias_totales,
  fortalezas = EXCLUDED.fortalezas,
  fecha_nacimiento = EXCLUDED.fecha_nacimiento,
  foto_frontal = EXCLUDED.foto_frontal,
  foto_tarjeta = EXCLUDED.foto_tarjeta,
  foto_pose = EXCLUDED.foto_pose;

  INSERT INTO jugadores_nacionalidad (jugador_id, nacionalidad_id)
  VALUES
    ((SELECT id FROM jugadores WHERE nombre = 'Jorge González Pérez'),
     (SELECT id FROM nacionalidades WHERE nombre = 'España')),

    ((SELECT id FROM jugadores WHERE nombre = 'Nacho Manzano Pérez'),
     (SELECT id FROM nacionalidades WHERE nombre = 'España')),

    ((SELECT id FROM jugadores WHERE nombre = 'Daniel Manzano Pérez'),
     (SELECT id FROM nacionalidades WHERE nombre = 'España')),

    ((SELECT id FROM jugadores WHERE nombre = 'Jorge Sánchez Rodríguez'),
     (SELECT id FROM nacionalidades WHERE nombre = 'España')),
    ((SELECT id FROM jugadores WHERE nombre = 'Jorge Sánchez Rodríguez'),
     (SELECT id FROM nacionalidades WHERE nombre = 'Chile')),

    ((SELECT id FROM jugadores WHERE nombre = 'Adrián Carvajal Sánchez'),
     (SELECT id FROM nacionalidades WHERE nombre = 'España')),

    ((SELECT id FROM jugadores WHERE nombre = 'Santiago Alejandro Chaya'),
     (SELECT id FROM nacionalidades WHERE nombre = 'España')),

    ((SELECT id FROM jugadores WHERE nombre = 'Alberto González Pérez'),
     (SELECT id FROM nacionalidades WHERE nombre = 'España')),

    ((SELECT id FROM jugadores WHERE nombre = 'Raúl García Rodrigo'),
     (SELECT id FROM nacionalidades WHERE nombre = 'España')),

    ((SELECT id FROM jugadores WHERE nombre = 'Fernando Méndez Lera'),
     (SELECT id FROM nacionalidades WHERE nombre = 'España')),

    ((SELECT id FROM jugadores WHERE nombre = 'Alfonso Peris Pérez'),
     (SELECT id FROM nacionalidades WHERE nombre = 'España')),

    ((SELECT id FROM jugadores WHERE nombre = 'Mario Rodríguez Díaz'),
     (SELECT id FROM nacionalidades WHERE nombre = 'España'))
  ON CONFLICT DO NOTHING;


INSERT INTO jugadores_parecidos (jugador_id, parecido) VALUES
((SELECT id FROM jugadores WHERE nombre = 'Jorge González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Milinković-Savić'),
((SELECT id FROM jugadores WHERE nombre = 'Jorge González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'David Silva'),
((SELECT id FROM jugadores WHERE nombre = 'Jorge González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Isco'),

((SELECT id FROM jugadores WHERE nombre = 'Nacho Manzano Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Camavinga'),
((SELECT id FROM jugadores WHERE nombre = 'Nacho Manzano Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Valverde'),
((SELECT id FROM jugadores WHERE nombre = 'Nacho Manzano Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Saúl'),

((SELECT id FROM jugadores WHERE nombre = 'Daniel Manzano Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Xabi Alonso'),
((SELECT id FROM jugadores WHERE nombre = 'Daniel Manzano Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Busquets'),
((SELECT id FROM jugadores WHERE nombre = 'Daniel Manzano Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Parejo'),

((SELECT id FROM jugadores WHERE nombre = 'Jorge Sánchez Rodríguez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Koulibaly'),
((SELECT id FROM jugadores WHERE nombre = 'Jorge Sánchez Rodríguez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Alaba'),
((SELECT id FROM jugadores WHERE nombre = 'Jorge Sánchez Rodríguez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Valverde'),

((SELECT id FROM jugadores WHERE nombre = 'Adrián Carvajal Sánchez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Luis Suárez'),
((SELECT id FROM jugadores WHERE nombre = 'Adrián Carvajal Sánchez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Chicharito'),
((SELECT id FROM jugadores WHERE nombre = 'Adrián Carvajal Sánchez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Carlos Vela'),

((SELECT id FROM jugadores WHERE nombre = 'Santiago Alejandro Chaya' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Llorente'),
((SELECT id FROM jugadores WHERE nombre = 'Santiago Alejandro Chaya' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Valverde'),
((SELECT id FROM jugadores WHERE nombre = 'Santiago Alejandro Chaya' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'En-Nesyri'),

((SELECT id FROM jugadores WHERE nombre = 'Alberto González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'David Silva'),
((SELECT id FROM jugadores WHERE nombre = 'Alberto González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Kroos'),
((SELECT id FROM jugadores WHERE nombre = 'Alberto González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Fabián Ruiz'),

((SELECT id FROM jugadores WHERE nombre = 'Raúl García Rodrigo' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Casillas'),
((SELECT id FROM jugadores WHERE nombre = 'Raúl García Rodrigo' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Éderson'),
((SELECT id FROM jugadores WHERE nombre = 'Raúl García Rodrigo' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Busquets'),

((SELECT id FROM jugadores WHERE nombre = 'Fernando Méndez Lera' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Di María'),
((SELECT id FROM jugadores WHERE nombre = 'Fernando Méndez Lera' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Asensio'),
((SELECT id FROM jugadores WHERE nombre = 'Fernando Méndez Lera' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Mertens'),

((SELECT id FROM jugadores WHERE nombre = 'Alfonso Peris Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Diego Costa'),
((SELECT id FROM jugadores WHERE nombre = 'Alfonso Peris Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Morata'),
((SELECT id FROM jugadores WHERE nombre = 'Alfonso Peris Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Correa'),

((SELECT id FROM jugadores WHERE nombre = 'Mario Rodríguez Díaz' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Canales'),
((SELECT id FROM jugadores WHERE nombre = 'Mario Rodríguez Díaz' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Fornals'),
((SELECT id FROM jugadores WHERE nombre = 'Mario Rodríguez Díaz' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Rubén García')
ON CONFLICT (jugador_id, parecido) DO NOTHING;

INSERT INTO partidos (fecha, lugar, estado, equipo_local, equipo_visitante, goles_local, goles_visitante, mvp_id) VALUES
-- Partidos 2024
('2024-10-06 17:00:00', 'B.P.GALDOS Pista Techada', 'Finalizado',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'),
 (SELECT id FROM equipos WHERE nombre = 'Elespot Mandangon SP'),
 3, 10,
 (SELECT id FROM jugadores WHERE nombre = 'Nacho Manzano Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'))),

('2024-10-20 20:00:00', 'B.P.GALDOS Pista Techada', 'Finalizado',
 (SELECT id FROM equipos WHERE nombre = 'Comando Navacerrada'),
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'),
 0, 5,
 (SELECT id FROM jugadores WHERE nombre = 'Raúl García Rodrigo' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'))),

('2024-10-27 16:00:00', 'La Granadilla', 'Finalizado',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'),
 (SELECT id FROM equipos WHERE nombre = 'Maped'),
 4, 1,
 (SELECT id FROM jugadores WHERE nombre = 'Raúl García Rodrigo' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'))),

('2024-11-10 16:00:00', 'P. Felipe – Pista Central', 'Finalizado',
 (SELECT id FROM equipos WHERE nombre = 'More Kapa FS'),
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'),
 5, 2,
 (SELECT id FROM jugadores WHERE nombre = 'Jorge González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'))),

('2024-11-17 00:00:00', 'Descanso', 'Finalizado', NULL, NULL, NULL, NULL, NULL),

('2024-11-24 16:00:00', 'P. Felipe – Pista Central', 'Finalizado',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'),
 (SELECT id FROM equipos WHERE nombre = 'El Colectivo'),
 2, 3,
 (SELECT id FROM jugadores WHERE nombre = 'Santiago Alejandro Chaya' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'))),

('2024-12-01 16:00:00', 'La Granadilla', 'Finalizado',
 (SELECT id FROM equipos WHERE nombre = 'Los Potros FC'),
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'),
 2, 2,
 (SELECT id FROM jugadores WHERE nombre = 'Jorge González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'))),

('2024-12-15 20:00:00', 'B.P.GALDOS Pista Techada', 'Finalizado',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'),
 (SELECT id FROM equipos WHERE nombre = 'Mambo FC'),
 12, 2,
 (SELECT id FROM jugadores WHERE nombre = 'Fernando Méndez Lera' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'))),

-- Partidos 2025
('2025-01-12 17:00:00', 'B.P.GALDOS Pista Techada', 'Finalizado',
 (SELECT id FROM equipos WHERE nombre = 'Palillos a la Mar'),
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'),
 5, 4,
 (SELECT id FROM jugadores WHERE nombre = 'Santiago Alejandro Chaya' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'))),

('2025-01-19 19:00:00', 'B.P.GALDOS Pista Techada', 'Finalizado',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'),
 (SELECT id FROM equipos WHERE nombre = 'Golesalavés'),
 4, 3,
 (SELECT id FROM jugadores WHERE nombre = 'Jorge Sánchez Rodríguez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'))),

('2025-01-26 18:00:00', 'B.P.GALDOS Pista Techada', 'Finalizado',
 (SELECT id FROM equipos WHERE nombre = 'Green Park United'),
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'),
 4, 5,
 (SELECT id FROM jugadores WHERE nombre = 'Alberto González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'))),

('2025-02-02 18:00:00', 'B.P.GALDOS Pista Techada', 'Finalizado',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'),
 (SELECT id FROM equipos WHERE nombre = 'Guajes'),
 2, 2,
 (SELECT id FROM jugadores WHERE nombre = 'Mario Rodríguez Díaz' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'))),

('2025-02-09 19:00:00', 'B.P.GALDOS Pista Techada', 'Finalizado',
 (SELECT id FROM equipos WHERE nombre = 'Man Red'),
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'),
 5, 7,
 (SELECT id FROM jugadores WHERE nombre = 'Fernando Méndez Lera' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'))),

('2025-02-23 17:00:00', 'B.P.GALDOS Pista Techada', 'Finalizado',
 (SELECT id FROM equipos WHERE nombre = 'Elespot Mandangon SP'),
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'),
 7, 9,
 (SELECT id FROM jugadores WHERE nombre = 'Jorge Sánchez Rodríguez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'))),

('2025-03-02 20:00:00', 'B.P.GALDOS Pista Techada', 'Finalizado',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'),
 (SELECT id FROM equipos WHERE nombre = 'Comando Navacerrada'),
 5, 3,
 (SELECT id FROM jugadores WHERE nombre = 'Adrián Carvajal Sánchez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'))),

('2025-03-09 16:00:00', 'La Granadilla', 'Finalizado',
 (SELECT id FROM equipos WHERE nombre = 'Maped'),
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'),
 0, 5,
 (SELECT id FROM jugadores WHERE nombre = 'Adrián Carvajal Sánchez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'))),

('2025-03-16 16:00:00', 'P. Felipe – Pista Central', 'Finalizado',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'),
 (SELECT id FROM equipos WHERE nombre = 'More Kapa FS'),
 2, 3,
 (SELECT id FROM jugadores WHERE nombre = 'Jorge González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'))),

('2025-03-23 00:00:00', 'Descanso', 'Finalizado', NULL, NULL, NULL, NULL, NULL),

('2025-03-30 16:00:00', 'P. Felipe – Pista Central', 'Finalizado',
 (SELECT id FROM equipos WHERE nombre = 'El Colectivo'),
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'),
 6, 2,
 (SELECT id FROM jugadores WHERE nombre = 'Santiago Alejandro Chaya' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'))),

('2025-04-06 16:00:00', 'La Granadilla', 'Finalizado',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'),
 (SELECT id FROM equipos WHERE nombre = 'Los Potros FC'),
 5, 1,
 (SELECT id FROM jugadores WHERE nombre = 'Raúl García Rodrigo' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'))),

-- Partidos pendientes
('2025-04-27 20:00:00', 'B.P.GALDOS Pista Techada', 'Pendiente',
 (SELECT id FROM equipos WHERE nombre = 'Mambo FC'),
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'), NULL, NULL, NULL),

('2025-05-11 17:00:00', 'B.P.GALDOS Pista Techada', 'Pendiente',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'),
 (SELECT id FROM equipos WHERE nombre = 'Palillos a la Mar'), NULL, NULL, NULL),

('2025-05-18 19:00:00', 'B.P.GALDOS Pista Techada', 'Pendiente',
 (SELECT id FROM equipos WHERE nombre = 'Golesalavés'),
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'), NULL, NULL, NULL),

('2025-05-25 18:00:00', 'B.P.GALDOS Pista Techada', 'Pendiente',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'),
 (SELECT id FROM equipos WHERE nombre = 'Green Park United'), NULL, NULL, NULL),

('2025-06-01 18:00:00', 'B.P.GALDOS Pista Techada', 'Pendiente',
 (SELECT id FROM equipos WHERE nombre = 'Guajes'),
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'), NULL, NULL, NULL),

('2025-06-08 19:00:00', 'B.P.GALDOS Pista Techada', 'Pendiente',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'),
 (SELECT id FROM equipos WHERE nombre = 'Man Red'), NULL, NULL, NULL)
ON CONFLICT (fecha, lugar) DO
UPDATE SET
 estado = EXCLUDED.estado,
 equipo_local = EXCLUDED.equipo_local,
 equipo_visitante = EXCLUDED.equipo_visitante,
 goles_local = EXCLUDED.goles_local,
 goles_visitante = EXCLUDED.goles_visitante,
 mvp_id = EXCLUDED.mvp_id;

INSERT INTO clasificaciones (
    equipo_id, posicion, puntos, partidos_jugados, ganados, empatados, perdidos,
    goles_favor, goles_contra, diferencia_goles, promedio_tf_tc
)
VALUES
((SELECT id FROM equipos WHERE nombre = 'Elespot Mandangon SP'), 1, 48, 19, 16, 0, 3, 165, 61, 104, 2.70),
((SELECT id FROM equipos WHERE nombre = 'El Colectivo'), 2, 42, 18, 14, 0, 4, 72, 38, 34, 1.89),
((SELECT id FROM equipos WHERE nombre = 'More Kapa FS'), 3, 40, 18, 13, 3, 2, 99, 43, 56, 2.30),
((SELECT id FROM equipos WHERE nombre = 'Guajes'), 4, 35, 18, 11, 2, 5, 80, 56, 24, 1.43),
((SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'), 5, 35, 18, 11, 2, 5, 81, 62, 19, 1.31),
((SELECT id FROM equipos WHERE nombre = 'Palillos a la Mar'), 6, 34, 19, 12, 2, 5, 84, 55, 29, 1.53),
((SELECT id FROM equipos WHERE nombre = 'Man Red'), 7, 31, 19, 10, 1, 8, 65, 50, 15, 1.30),
((SELECT id FROM equipos WHERE nombre = 'Golesalavés'), 8, 28, 18, 10, 0, 8, 83, 62, 21, 1.34),
((SELECT id FROM equipos WHERE nombre = 'Green Park United'), 9, 20, 18, 6, 2, 10, 54, 86, -32, 0.63),
((SELECT id FROM equipos WHERE nombre = 'Comando Navacerrada'), 10, 15, 18, 5, 0, 13, 56, 92, -36, 0.61),
((SELECT id FROM equipos WHERE nombre = 'Los Potros FC'), 11, 13, 19, 4, 1, 14, 59, 90, -31, 0.66),
((SELECT id FROM equipos WHERE nombre = 'Maped'), 12, 6, 18, 2, 0, 16, 30, 101, -71, 0.30),
((SELECT id FROM equipos WHERE nombre = 'Mambo FC'), 13, -1, 18, 0, 0, 17, 26, 158, -132, 0.16)
ON CONFLICT (equipo_id) DO UPDATE
SET
  posicion = EXCLUDED.posicion,
  puntos = EXCLUDED.puntos,
  partidos_jugados = EXCLUDED.partidos_jugados,
  ganados = EXCLUDED.ganados,
  empatados = EXCLUDED.empatados,
  perdidos = EXCLUDED.perdidos,
  goles_favor = EXCLUDED.goles_favor,
  goles_contra = EXCLUDED.goles_contra,
  diferencia_goles = EXCLUDED.diferencia_goles,
  promedio_tf_tc = EXCLUDED.promedio_tf_tc;

INSERT INTO estadisticas_jugador_partido (jugador_id, partido_id, goles, asistencias, amarilla, roja, portero)
VALUES
-- Partido 2024-10-06
((SELECT id FROM jugadores WHERE nombre = 'Adrián Carvajal Sánchez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-10-06 17:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 2, 0, FALSE, FALSE, TRUE),

((SELECT id FROM jugadores WHERE nombre = 'Nacho Manzano Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-10-06 17:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 1, 0, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Alfonso Peris Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-10-06 17:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 0, 0, FALSE, FALSE, TRUE),

((SELECT id FROM jugadores WHERE nombre = 'Mario Rodríguez Díaz' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-10-06 17:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 0, 0, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Jorge González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-10-06 17:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 0, 1, FALSE, FALSE, TRUE),

-- Partido 2024-10-20
((SELECT id FROM jugadores WHERE nombre = 'Adrián Carvajal Sánchez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-10-20 20:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 2, 1, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Santiago Alejandro Chaya' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-10-20 20:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 1, 1, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Jorge González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-10-20 20:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 1, 2, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Alfonso Peris Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-10-20 20:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 1, 0, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Raúl García Rodrigo' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-10-20 20:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 0, 0, FALSE, FALSE, TRUE),

((SELECT id FROM jugadores WHERE nombre = 'Nacho Manzano Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-10-20 20:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 0, 0, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Jorge Sánchez Rodríguez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-10-20 20:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 0, 0, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Alberto González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-10-20 20:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 0, 0, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Mario Rodríguez Díaz' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-10-20 20:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 0, 0, FALSE, FALSE, FALSE),

 -- Partido 2024-10-27
 ((SELECT id FROM jugadores WHERE nombre = 'Adrián Carvajal Sánchez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
  (SELECT id FROM partidos WHERE fecha = '2024-10-27 16:00:00' AND lugar = 'La Granadilla'), 1, 2, FALSE, FALSE, FALSE),

 ((SELECT id FROM jugadores WHERE nombre = 'Raúl García Rodrigo' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
  (SELECT id FROM partidos WHERE fecha = '2024-10-27 16:00:00' AND lugar = 'La Granadilla'), 1, 0, FALSE, FALSE, TRUE),

 ((SELECT id FROM jugadores WHERE nombre = 'Nacho Manzano Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
  (SELECT id FROM partidos WHERE fecha = '2024-10-27 16:00:00' AND lugar = 'La Granadilla'), 1, 1, FALSE, FALSE, FALSE),

 ((SELECT id FROM jugadores WHERE nombre = 'Alfonso Peris Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
  (SELECT id FROM partidos WHERE fecha = '2024-10-27 16:00:00' AND lugar = 'La Granadilla'), 1, 0, FALSE, FALSE, FALSE),

 ((SELECT id FROM jugadores WHERE nombre = 'Santiago Alejandro Chaya' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
  (SELECT id FROM partidos WHERE fecha = '2024-10-27 16:00:00' AND lugar = 'La Granadilla'), 0, 0, FALSE, FALSE, FALSE),

 ((SELECT id FROM jugadores WHERE nombre = 'Jorge Sánchez Rodríguez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
  (SELECT id FROM partidos WHERE fecha = '2024-10-27 16:00:00' AND lugar = 'La Granadilla'), 0, 0, FALSE, FALSE, FALSE),

 ((SELECT id FROM jugadores WHERE nombre = 'Alberto González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
  (SELECT id FROM partidos WHERE fecha = '2024-10-27 16:00:00' AND lugar = 'La Granadilla'), 0, 0, FALSE, FALSE, FALSE),

 ((SELECT id FROM jugadores WHERE nombre = 'Mario Rodríguez Díaz' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
  (SELECT id FROM partidos WHERE fecha = '2024-10-27 16:00:00' AND lugar = 'La Granadilla'), 0, 0, FALSE, FALSE, FALSE),

 ((SELECT id FROM jugadores WHERE nombre = 'Jorge González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
  (SELECT id FROM partidos WHERE fecha = '2024-10-27 16:00:00' AND lugar = 'La Granadilla'), 0, 1, FALSE, FALSE, FALSE),

 -- Partido 2024-11-10
 ((SELECT id FROM jugadores WHERE nombre = 'Jorge González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
  (SELECT id FROM partidos WHERE fecha = '2024-11-10 16:00:00' AND lugar = 'P. Felipe – Pista Central'), 2, 0, FALSE, FALSE, FALSE),

 ((SELECT id FROM jugadores WHERE nombre = 'Nacho Manzano Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
  (SELECT id FROM partidos WHERE fecha = '2024-11-10 16:00:00' AND lugar = 'P. Felipe – Pista Central'), 0, 0, FALSE, FALSE, FALSE),

 ((SELECT id FROM jugadores WHERE nombre = 'Alberto González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
  (SELECT id FROM partidos WHERE fecha = '2024-11-10 16:00:00' AND lugar = 'P. Felipe – Pista Central'), 0, 0, FALSE, FALSE, FALSE),

 ((SELECT id FROM jugadores WHERE nombre = 'Mario Rodríguez Díaz' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
  (SELECT id FROM partidos WHERE fecha = '2024-11-10 16:00:00' AND lugar = 'P. Felipe – Pista Central'), 0, 0, FALSE, TRUE, FALSE),

 ((SELECT id FROM jugadores WHERE nombre = 'Adrián Carvajal Sánchez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
  (SELECT id FROM partidos WHERE fecha = '2024-11-10 16:00:00' AND lugar = 'P. Felipe – Pista Central'), 0, 0, FALSE, FALSE, FALSE),

 ((SELECT id FROM jugadores WHERE nombre = 'Alfonso Peris Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
  (SELECT id FROM partidos WHERE fecha = '2024-11-10 16:00:00' AND lugar = 'P. Felipe – Pista Central'), 0, 0, FALSE, FALSE, FALSE),

 ((SELECT id FROM jugadores WHERE nombre = 'Raúl García Rodrigo' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
  (SELECT id FROM partidos WHERE fecha = '2024-11-10 16:00:00' AND lugar = 'P. Felipe – Pista Central'), 0, 0, FALSE, FALSE, TRUE),

  ((SELECT id FROM jugadores WHERE nombre = 'Santiago Alejandro Chaya' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
   (SELECT id FROM partidos WHERE fecha = '2024-11-24 16:00:00' AND lugar = 'P. Felipe – Pista Central'), 2, 0, FALSE, FALSE, FALSE),

  ((SELECT id FROM jugadores WHERE nombre = 'Raúl García Rodrigo' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
   (SELECT id FROM partidos WHERE fecha = '2024-11-24 16:00:00' AND lugar = 'P. Felipe – Pista Central'), 0, 0, FALSE, FALSE, TRUE),

  ((SELECT id FROM jugadores WHERE nombre = 'Daniel Manzano Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
   (SELECT id FROM partidos WHERE fecha = '2024-11-24 16:00:00' AND lugar = 'P. Felipe – Pista Central'), 0, 0, FALSE, FALSE, FALSE),

  ((SELECT id FROM jugadores WHERE nombre = 'Alfonso Peris Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
   (SELECT id FROM partidos WHERE fecha = '2024-11-24 16:00:00' AND lugar = 'P. Felipe – Pista Central'), 0, 0, FALSE, FALSE, FALSE),

  ((SELECT id FROM jugadores WHERE nombre = 'Mario Rodríguez Díaz' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
   (SELECT id FROM partidos WHERE fecha = '2024-11-24 16:00:00' AND lugar = 'P. Felipe – Pista Central'), 0, 0, FALSE, FALSE, FALSE),

  ((SELECT id FROM jugadores WHERE nombre = 'Alberto González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
   (SELECT id FROM partidos WHERE fecha = '2024-11-24 16:00:00' AND lugar = 'P. Felipe – Pista Central'), 0, 0, FALSE, TRUE, FALSE),

  ((SELECT id FROM jugadores WHERE nombre = 'Jorge Sánchez Rodríguez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
   (SELECT id FROM partidos WHERE fecha = '2024-11-24 16:00:00' AND lugar = 'P. Felipe – Pista Central'), 0, 0, FALSE, TRUE, FALSE),

  ((SELECT id FROM jugadores WHERE nombre = 'Adrián Carvajal Sánchez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
   (SELECT id FROM partidos WHERE fecha = '2024-11-24 16:00:00' AND lugar = 'P. Felipe – Pista Central'), 0, 1, FALSE, TRUE, FALSE),

  ((SELECT id FROM jugadores WHERE nombre = 'Jorge González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
   (SELECT id FROM partidos WHERE fecha = '2024-11-24 16:00:00' AND lugar = 'P. Felipe – Pista Central'), 0, 1, FALSE, FALSE, FALSE),

  -- Estadísticas del partido del 2024-12-01 (vs Los Potros FC)
  ((SELECT id FROM jugadores WHERE nombre = 'Santiago Alejandro Chaya' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
   (SELECT id FROM partidos WHERE fecha = '2024-12-01 16:00:00' AND lugar = 'La Granadilla'), 1, 1, FALSE, FALSE, FALSE),

  ((SELECT id FROM jugadores WHERE nombre = 'Jorge González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
   (SELECT id FROM partidos WHERE fecha = '2024-12-01 16:00:00' AND lugar = 'La Granadilla'), 1, 0, FALSE, FALSE, FALSE),

  ((SELECT id FROM jugadores WHERE nombre = 'Jorge Sánchez Rodríguez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
   (SELECT id FROM partidos WHERE fecha = '2024-12-01 16:00:00' AND lugar = 'La Granadilla'), 0, 0, FALSE, FALSE, FALSE),

  ((SELECT id FROM jugadores WHERE nombre = 'Alberto González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
   (SELECT id FROM partidos WHERE fecha = '2024-12-01 16:00:00' AND lugar = 'La Granadilla'), 0, 1, FALSE, FALSE, FALSE),

  ((SELECT id FROM jugadores WHERE nombre = 'Alfonso Peris Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
   (SELECT id FROM partidos WHERE fecha = '2024-12-01 16:00:00' AND lugar = 'La Granadilla'), 0, 0, FALSE, FALSE, FALSE),

  ((SELECT id FROM jugadores WHERE nombre = 'Daniel Manzano Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
   (SELECT id FROM partidos WHERE fecha = '2024-12-01 16:00:00' AND lugar = 'La Granadilla'), 0, 0, FALSE, FALSE, FALSE),

  ((SELECT id FROM jugadores WHERE nombre = 'Raúl García Rodrigo' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
   (SELECT id FROM partidos WHERE fecha = '2024-12-01 16:00:00' AND lugar = 'La Granadilla'), 0, 0, FALSE, FALSE, TRUE),

   -- Estadísticas del partido del 2024-12-15
  ((SELECT id FROM jugadores WHERE nombre = 'Fernando Méndez Lera' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
   (SELECT id FROM partidos WHERE fecha = '2024-12-15 20:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 4, 1, FALSE, FALSE, FALSE),

  ((SELECT id FROM jugadores WHERE nombre = 'Adrián Carvajal Sánchez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
   (SELECT id FROM partidos WHERE fecha = '2024-12-15 20:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 2, 2, FALSE, FALSE, FALSE),

  ((SELECT id FROM jugadores WHERE nombre = 'Daniel Manzano Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
   (SELECT id FROM partidos WHERE fecha = '2024-12-15 20:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 2, 1, FALSE, FALSE, FALSE),

  ((SELECT id FROM jugadores WHERE nombre = 'Mario Rodríguez Díaz' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
   (SELECT id FROM partidos WHERE fecha = '2024-12-15 20:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 1, 1, FALSE, FALSE, FALSE),

  ((SELECT id FROM jugadores WHERE nombre = 'Raúl García Rodrigo' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
   (SELECT id FROM partidos WHERE fecha = '2024-12-15 20:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 1, 1, FALSE, FALSE, TRUE),

  ((SELECT id FROM jugadores WHERE nombre = 'Alberto González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
   (SELECT id FROM partidos WHERE fecha = '2024-12-15 20:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 1, 1, FALSE, FALSE, FALSE),

  ((SELECT id FROM jugadores WHERE nombre = 'Jorge González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
   (SELECT id FROM partidos WHERE fecha = '2024-12-15 20:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 1, 1, FALSE, FALSE, TRUE),

  ((SELECT id FROM jugadores WHERE nombre = 'Alfonso Peris Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
   (SELECT id FROM partidos WHERE fecha = '2024-12-15 20:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 0, 1, FALSE, FALSE, FALSE),

-- Estadísticas del partido del 2025-01-12
((SELECT id FROM jugadores WHERE nombre = 'Santiago Alejandro Chaya' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-12 17:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 2, 0, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Jorge González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-12 17:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 1, 2, FALSE, FALSE, TRUE),

((SELECT id FROM jugadores WHERE nombre = 'Adrián Carvajal Sánchez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-12 17:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 1, 0, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Jorge Sánchez Rodríguez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-12 17:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 1, 0, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Alfonso Peris Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-12 17:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 0, 0, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Fernando Méndez Lera' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-12 17:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 0, 1, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Nacho Manzano Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-12 17:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 0, 0, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Mario Rodríguez Díaz' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-12 17:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 0, 0, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Alberto González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-12 17:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 0, 1, FALSE, FALSE, TRUE),

-- Estadísticas del partido del 2025-01-19
((SELECT id FROM jugadores WHERE nombre = 'Jorge Sánchez Rodríguez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-19 19:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 1, 1, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Adrián Carvajal Sánchez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-19 19:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 2, 1, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Fernando Méndez Lera' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-19 19:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 1, 0, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Jorge González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-19 19:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 0, 1, FALSE, FALSE, TRUE),

((SELECT id FROM jugadores WHERE nombre = 'Alfonso Peris Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-19 19:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 0, 0, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Nacho Manzano Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-19 19:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 0, 0, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Mario Rodríguez Díaz' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-19 19:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 0, 0, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Alberto González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-19 19:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 0, 1, FALSE, FALSE, TRUE),

((SELECT id FROM jugadores WHERE nombre = 'Santiago Alejandro Chaya' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-19 19:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 0, 0, FALSE, FALSE, FALSE),

-- Estadísticas del partido del 2025-01-26
((SELECT id FROM jugadores WHERE nombre = 'Adrián Carvajal Sánchez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-26 18:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 2, 1, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Alberto González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-26 18:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 1, 0, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Santiago Alejandro Chaya' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-26 18:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 1, 1, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Daniel Manzano Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-26 18:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 1, 0, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Raúl García Rodrigo' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-26 18:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 0, 0, FALSE, FALSE, TRUE),

((SELECT id FROM jugadores WHERE nombre = 'Mario Rodríguez Díaz' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-26 18:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 0, 0, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Alfonso Peris Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-26 18:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 0, 0, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Fernando Méndez Lera' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-26 18:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 0, 2, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Jorge González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-26 18:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 0, 1, FALSE, FALSE, TRUE),

 -- Estadísticas del partido del 2025-02-02
((SELECT id FROM jugadores WHERE nombre = 'Adrián Carvajal Sánchez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-02-02 18:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 1, 0, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Fernando Méndez Lera' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-02-02 18:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 1, 0, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Mario Rodríguez Díaz' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-02-02 18:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 0, 0, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Jorge González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-02-02 18:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 0, 1, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Alberto González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-02-02 18:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 0, 0, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Santiago Alejandro Chaya' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-02-02 18:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 0, 0, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Jorge Sánchez Rodríguez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-02-02 18:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 0, 1, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Alfonso Peris Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-02-02 18:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 0, 0, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Raúl García Rodrigo' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-02-02 18:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 0, 0, FALSE, FALSE, TRUE),

 -- Estadísticas del partido del 2025-02-09
((SELECT id FROM jugadores WHERE nombre = 'Fernando Méndez Lera' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-02-09 19:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 3, 1, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Santiago Alejandro Chaya' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-02-09 19:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 2, 1, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Adrián Carvajal Sánchez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-02-09 19:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 1, 1, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Alfonso Peris Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-02-09 19:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 1, 0, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Raúl García Rodrigo' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-02-09 19:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 0, 0, FALSE, FALSE, TRUE),

((SELECT id FROM jugadores WHERE nombre = 'Jorge González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-02-09 19:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 0, 2, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Jorge Sánchez Rodríguez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-02-09 19:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 0, 0, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Mario Rodríguez Díaz' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-02-09 19:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 0, 1, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Nacho Manzano Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-02-09 19:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 0, 0, FALSE, FALSE, FALSE),

 -- Estadísticas del partido del 2025-02-23
((SELECT id FROM jugadores WHERE nombre = 'Jorge Sánchez Rodríguez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-02-23 17:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 1, 1, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Fernando Méndez Lera' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-02-23 17:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 3, 2, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Adrián Carvajal Sánchez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-02-23 17:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 3, 1, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Santiago Alejandro Chaya' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-02-23 17:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 1, 1, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Mario Rodríguez Díaz' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-02-23 17:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 1, 0, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Raúl García Rodrigo' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-02-23 17:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 0, 0, FALSE, FALSE, TRUE),

((SELECT id FROM jugadores WHERE nombre = 'Nacho Manzano Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-02-23 17:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 0, 1, FALSE, FALSE, FALSE),

 -- Estadísticas del partido del 2025-03-02
((SELECT id FROM jugadores WHERE nombre = 'Adrián Carvajal Sánchez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-03-02 20:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 4, 0, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Fernando Méndez Lera' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-03-02 20:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 1, 1, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Raúl García Rodrigo' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-03-02 20:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 0, 0, FALSE, FALSE, TRUE),

((SELECT id FROM jugadores WHERE nombre = 'Jorge González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-03-02 20:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 0, 1, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Nacho Manzano Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-03-02 20:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 0, 1, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Mario Rodríguez Díaz' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-03-02 20:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 0, 1, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Alberto González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-03-02 20:00:00' AND lugar = 'B.P.GALDOS Pista Techada'), 0, 1, FALSE, FALSE, FALSE),

 -- Estadísticas del partido del 2025-03-09
((SELECT id FROM jugadores WHERE nombre = 'Adrián Carvajal Sánchez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-03-09 16:00:00' AND lugar = 'La Granadilla'), 1, 0, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Fernando Méndez Lera' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-03-09 16:00:00' AND lugar = 'La Granadilla'), 1, 1, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Santiago Alejandro Chaya' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-03-09 16:00:00' AND lugar = 'La Granadilla'), 2, 0, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Jorge Sánchez Rodríguez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-03-09 16:00:00' AND lugar = 'La Granadilla'), 1, 1, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Raúl García Rodrigo' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-03-09 16:00:00' AND lugar = 'La Granadilla'), 0, 0, FALSE, FALSE, TRUE),

((SELECT id FROM jugadores WHERE nombre = 'Mario Rodríguez Díaz' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-03-09 16:00:00' AND lugar = 'La Granadilla'), 0, 1, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Nacho Manzano Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-03-09 16:00:00' AND lugar = 'La Granadilla'), 0, 1, FALSE, FALSE, FALSE),

 -- Estadísticas del partido del 2025-03-16
((SELECT id FROM jugadores WHERE nombre = 'Adrián Carvajal Sánchez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-03-16 16:00:00' AND lugar = 'P. Felipe – Pista Central'), 1, 0, TRUE, TRUE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Jorge González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-03-16 16:00:00' AND lugar = 'P. Felipe – Pista Central'), 1, 0, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Jorge Sánchez Rodríguez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-03-16 16:00:00' AND lugar = 'P. Felipe – Pista Central'), 0, 0, TRUE, TRUE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Nacho Manzano Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-03-16 16:00:00' AND lugar = 'P. Felipe – Pista Central'), 0, 0, TRUE, TRUE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Raúl García Rodrigo' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-03-16 16:00:00' AND lugar = 'P. Felipe – Pista Central'), 0, 0, FALSE, FALSE, TRUE),

((SELECT id FROM jugadores WHERE nombre = 'Mario Rodríguez Díaz' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-03-16 16:00:00' AND lugar = 'P. Felipe – Pista Central'), 0, 0, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Alberto González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-03-16 16:00:00' AND lugar = 'P. Felipe – Pista Central'), 0, 0, FALSE, FALSE, FALSE),

 -- Estadísticas del partido del 2025-03-30
((SELECT id FROM jugadores WHERE nombre = 'Santiago Alejandro Chaya' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-03-30 16:00:00' AND lugar = 'P. Felipe – Pista Central'), 1, 0, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Fernando Méndez Lera' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-03-30 16:00:00' AND lugar = 'P. Felipe – Pista Central'), 1, 0, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Raúl García Rodrigo' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-03-30 16:00:00' AND lugar = 'P. Felipe – Pista Central'), 0, 0, FALSE, FALSE, TRUE),

((SELECT id FROM jugadores WHERE nombre = 'Jorge González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-03-30 16:00:00' AND lugar = 'P. Felipe – Pista Central'), 0, 0, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Mario Rodríguez Díaz' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-03-30 16:00:00' AND lugar = 'P. Felipe – Pista Central'), 0, 0, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Daniel Manzano Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-03-30 16:00:00' AND lugar = 'P. Felipe – Pista Central'), 0, 0, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Alberto González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-03-30 16:00:00' AND lugar = 'P. Felipe – Pista Central'), 0, 0, FALSE, FALSE, FALSE),

 -- Estadísticas del partido del 2025-04-06
((SELECT id FROM jugadores WHERE nombre = 'Jorge González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-04-06 16:00:00' AND lugar = 'La Granadilla'), 2, 2, FALSE, FALSE, TRUE),

((SELECT id FROM jugadores WHERE nombre = 'Nacho Manzano Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-04-06 16:00:00' AND lugar = 'La Granadilla'), 1, 1, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Raúl García Rodrigo' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-04-06 16:00:00' AND lugar = 'La Granadilla'), 1, 1, FALSE, FALSE, TRUE),

((SELECT id FROM jugadores WHERE nombre = 'Mario Rodríguez Díaz' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-04-06 16:00:00' AND lugar = 'La Granadilla'), 0, 0, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Santiago Alejandro Chaya' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-04-06 16:00:00' AND lugar = 'La Granadilla'), 0, 0, FALSE, FALSE, FALSE),

((SELECT id FROM jugadores WHERE nombre = 'Alfonso Peris Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-04-06 16:00:00' AND lugar = 'La Granadilla'), 1, 0, FALSE, FALSE, FALSE)
ON CONFLICT (jugador_id, partido_id) DO UPDATE SET
    goles = EXCLUDED.goles,
    asistencias = EXCLUDED.asistencias,
    amarilla = EXCLUDED.amarilla,
    roja = EXCLUDED.roja,
    portero = EXCLUDED.portero;