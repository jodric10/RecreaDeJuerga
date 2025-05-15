INSERT INTO equipos (id, nombre, url_logo) VALUES
  ('d72d7c7e-1e1a-4e63-8e56-3c16b1f01201', 'Elespot Mandangon SP', 'http://example.com/logo1.png'),
  ('a91e0f64-29e0-4c98-9f84-604d1a28d102', 'El Colectivo', 'http://example.com/logo2.png'),
  ('8431d13a-bd3e-4dc0-8946-2efdb9898fa1', 'More Kapa FS', 'http://example.com/logo3.png'),
  ('ec16775b-4411-49d1-a19b-d458d85f1801', 'Guajes', 'http://example.com/logo4.png'),
  ('7a688bea-2027-4e9a-a90c-76fbd301f4b2', 'Recrea de Juerga', 'http://example.com/logo5.png'),
  ('c27e21fc-ef6b-44a1-ae5a-c3b28539c0d3', 'Palillos a la Mar', 'http://example.com/logo6.png'),
  ('b8d5213e-bebf-4d07-a3ee-43793194b964', 'Man Red', 'http://example.com/logo7.png'),
  ('ea84a2a2-0176-4a3c-8926-52bda3081b4a', 'Golesalavés', 'http://example.com/logo8.png'),
  ('bb4f1ee8-510e-45f9-a9f8-7d54e845ec10', 'Green Park United', 'http://example.com/logo9.png'),
  ('e10f5b5c-00ae-41ad-a2c3-2f3a9cb28233', 'Comando Navacerrada', 'http://example.com/logo10.png'),
  ('f3c4e948-b0a5-4294-8012-22f6f2de6e0f', 'Los Potros FC', 'http://example.com/logo11.png'),
  ('e78d5c6e-003d-45c9-b991-d7c60ccfeabc', 'Maped', 'http://example.com/logo12.png'),
  ('1f94515c-fc16-4c4f-b1dc-7c6f648ad7f2', 'Mambo FC', 'http://example.com/logo13.png')

ON CONFLICT (nombre) DO UPDATE
SET url_logo = EXCLUDED.url_logo;

INSERT INTO jugadores (
    id, nombre, apodo, dorsal, posicion, pie_dominante, goles_totales, asistencias_totales,
    fortalezas, fecha_nacimiento,nacionalidad, equipo_id, foto_frontal, foto_tarjeta, foto_pose
) VALUES
('ecf8164a-2220-46fe-affb-7679a03f3a6d', 'Jorge González Pérez', 'González', 11, 'Ala', 'Derecho', 9, 15, 'Calidad, control, pase, arranque', '2004-05-03', 'España',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'), 'http://example.com/foto_frontal1.png', 'http://example.com/foto_tarjeta1.png', 'http://example.com/foto_pose1.png'),

('522fb925-c88d-4680-84d8-1dfacfd0c70b', 'Nacho Manzano Pérez', 'Manzano', 17, 'Ala', 'Derecho', 4, 7, 'Pulmón, visión, box to box', '2004-09-17', 'España',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'), 'http://example.com/foto_frontal2.png', 'http://example.com/foto_tarjeta2.png', 'http://example.com/foto_pose2.png'),

('34fb45a0-93db-4fc8-b5fe-77cd67600cee', 'Daniel Manzano Pérez', 'Dani', 35, 'Cierre', 'Derecho', 2, 5, 'Visión, pase, control', '2007-08-09', 'España',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'), 'http://example.com/foto_frontal3.png', 'http://example.com/foto_tarjeta3.png', 'http://example.com/foto_pose3.png'),

('a3e96069-e2ea-4029-b23d-ae6b856f942d', 'Jorge Sánchez Rodríguez', 'Kalibuchi', 2, 'Cierre', 'Izquierdo', 4, 5, 'Golpeo potente, defensa, asociación', '2004-09-17', 'España',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'), 'http://example.com/foto_frontal4.png', 'http://example.com/foto_tarjeta4.png', 'http://example.com/foto_pose4.png'),

('e0e8f259-73ee-4005-9369-235c3f6c31c9', 'Adrián Carvajal Sánchez', 'Adri', 19, 'Pívot', 'Derecho', 23, 11, 'Físico, velocidad, remate', '2004-03-22', 'España',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'), 'http://example.com/foto_frontal5.png', 'http://example.com/foto_tarjeta5.png', 'http://example.com/foto_pose5.png'),

('86c4cb1c-144c-4660-bb47-bdf440501ded', 'Santiago Alejandro Chaya', 'Santi', 14, 'Pívot', 'Derecho', 13, 8, 'Fuerza, resistencia, velocidad', '2004-08-18', 'España',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'), 'http://example.com/foto_frontal1.png', 'http://example.com/foto_tarjeta1.png', 'http://example.com/foto_pose1.png'),

('e2a9b4dc-0247-4526-98c5-a2020b2d5cf4', 'Alberto González Pérez', 'Alberoto', 5, 'Ala', 'Derecho', 2, 7, 'Inteligencia, apoyo, sacrificio', '1999-07-20', 'España',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'), 'http://example.com/foto_frontal2.png', 'http://example.com/foto_tarjeta2.png', 'http://example.com/foto_pose2.png'),

('b1ec4c9f-79f7-4c84-a9b3-8e2c6631f8a0', 'Raúl García Rodrigo', 'Ra', 1, 'Portero', 'Derecho', 3, 3, 'Reflejos, colocación, visión', '2004-12-04', 'España',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'), 'http://example.com/foto_frontal3.png', 'http://example.com/foto_tarjeta3.png', 'http://example.com/foto_pose3.png'),

('f217f7a2-bb7e-4729-b0a8-6f5f90a58f17', 'Fernando Méndez Lera', 'Fer', 8, 'Ala', 'Izquierdo', 15, 8, 'Desborde, zurda, disparo', '2007-01-27', 'España',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'), 'http://example.com/foto_frontal4.png', 'http://example.com/foto_tarjeta4.png', 'http://example.com/foto_pose4.png'),

('ac548370-00ff-4060-b4bb-284378c6c9d9', 'Alfonso Peris Pérez', 'Fonsi', 12, 'Pívot', 'Derecho', 4, 3, 'Compromiso, movilidad, físico', '2004-10-17', 'España',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'), 'http://example.com/foto_frontal5.png', 'http://example.com/foto_tarjeta5.png', 'http://example.com/foto_pose5.png'),

('1e9a00be-308e-4a30-98a1-e7254ecb03fa', 'Mario Rodríguez Díaz', 'Mario', 21, 'Ala', 'Derecho', 2, 3, 'Calidad, sacrificio, apoyo', '2004-06-11', 'España',
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

INSERT INTO partidos (id,fecha, lugar, estado, equipo_local, equipo_visitante, goles_local, goles_visitante, mvp_id) VALUES
-- Partidos 2024
('0c2d761a-4fa3-447e-b5c1-48eaffddd068','2024-10-06 17:00:00', 'B.P.GALDOS Pista Techada', 'Finalizado',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'),
 (SELECT id FROM equipos WHERE nombre = 'Elespot Mandangon SP'),
 3, 10,
 (SELECT id FROM jugadores WHERE nombre = 'Nacho Manzano Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'))),

('cf574a93-e8ec-4f5c-9081-4a0c300d0843','2024-10-20 20:00:00', 'B.P.GALDOS Pista Techada', 'Finalizado',
 (SELECT id FROM equipos WHERE nombre = 'Comando Navacerrada'),
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'),
 0, 5,
 (SELECT id FROM jugadores WHERE nombre = 'Raúl García Rodrigo' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'))),

('8d3464bb-7356-4fb9-a1f3-3c2a40a700af','2024-10-27 16:00:00', 'La Granadilla', 'Finalizado',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'),
 (SELECT id FROM equipos WHERE nombre = 'Maped'),
 4, 1,
 (SELECT id FROM jugadores WHERE nombre = 'Raúl García Rodrigo' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'))),

('88f4c5d2-98f3-4d57-8f2a-1aa94f47ffb6','2024-11-10 16:00:00', 'P. Felipe – Pista Central', 'Finalizado',
 (SELECT id FROM equipos WHERE nombre = 'More Kapa FS'),
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'),
 5, 2,
 (SELECT id FROM jugadores WHERE nombre = 'Jorge González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'))),

('22142dcb-09a3-4d11-b18d-68a5d63be5d2','2024-11-17 00:00:00', 'Descanso', 'Finalizado', NULL, NULL, NULL, NULL, NULL),

('ca64e6c6-b226-44de-b2ec-8e245d0e4739','2024-11-24 16:00:00', 'P. Felipe – Pista Central', 'Finalizado',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'),
 (SELECT id FROM equipos WHERE nombre = 'El Colectivo'),
 2, 3,
 (SELECT id FROM jugadores WHERE nombre = 'Santiago Alejandro Chaya' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'))),

('1b94f28a-ecf1-4d71-a6ee-481e4e548ab7','2024-12-01 16:00:00', 'La Granadilla', 'Finalizado',
 (SELECT id FROM equipos WHERE nombre = 'Los Potros FC'),
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'),
 2, 2,
 (SELECT id FROM jugadores WHERE nombre = 'Jorge González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'))),

('70ffecf5-1601-4cf1-8576-d5561b2a8d74','2024-12-15 20:00:00', 'B.P.GALDOS Pista Techada', 'Finalizado',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'),
 (SELECT id FROM equipos WHERE nombre = 'Mambo FC'),
 12, 2,
 (SELECT id FROM jugadores WHERE nombre = 'Fernando Méndez Lera' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'))),

-- Partidos 2025
('b622c245-0a2d-4974-94e9-f7330fc72520','2025-01-12 17:00:00', 'B.P.GALDOS Pista Techada', 'Finalizado',
 (SELECT id FROM equipos WHERE nombre = 'Palillos a la Mar'),
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'),
 5, 4,
 (SELECT id FROM jugadores WHERE nombre = 'Santiago Alejandro Chaya' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'))),

('31236241-e4e3-4cd4-a2f1-f7a595b2eb63','2025-01-19 19:00:00', 'B.P.GALDOS Pista Techada', 'Finalizado',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'),
 (SELECT id FROM equipos WHERE nombre = 'Golesalavés'),
 4, 3,
 (SELECT id FROM jugadores WHERE nombre = 'Jorge Sánchez Rodríguez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'))),

('b93b170b-5c4b-4f53-b248-c2ed83f19f91','2025-01-26 18:00:00', 'B.P.GALDOS Pista Techada', 'Finalizado',
 (SELECT id FROM equipos WHERE nombre = 'Green Park United'),
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'),
 4, 5,
 (SELECT id FROM jugadores WHERE nombre = 'Alberto González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'))),

('469bbad9-6102-4870-89f2-71e8820fbb88','2025-02-02 18:00:00', 'B.P.GALDOS Pista Techada', 'Finalizado',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'),
 (SELECT id FROM equipos WHERE nombre = 'Guajes'),
 2, 2,
 (SELECT id FROM jugadores WHERE nombre = 'Mario Rodríguez Díaz' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'))),

('cd158a41-fd60-42f5-85e2-929a831e5a0d','2025-02-09 19:00:00', 'B.P.GALDOS Pista Techada', 'Finalizado',
 (SELECT id FROM equipos WHERE nombre = 'Man Red'),
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'),
 5, 7,
 (SELECT id FROM jugadores WHERE nombre = 'Fernando Méndez Lera' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'))),

('bff6c8f0-24ad-4636-9f99-3c61c1b50386','2025-02-23 17:00:00', 'B.P.GALDOS Pista Techada', 'Finalizado',
 (SELECT id FROM equipos WHERE nombre = 'Elespot Mandangon SP'),
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'),
 7, 9,
 (SELECT id FROM jugadores WHERE nombre = 'Jorge Sánchez Rodríguez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'))),

('2783d4a6-f725-4e68-b505-287fca82d776','2025-03-02 20:00:00', 'B.P.GALDOS Pista Techada', 'Finalizado',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'),
 (SELECT id FROM equipos WHERE nombre = 'Comando Navacerrada'),
 5, 3,
 (SELECT id FROM jugadores WHERE nombre = 'Adrián Carvajal Sánchez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'))),

('ec0b8806-b9ef-420c-9753-9c10e1e678cd','2025-03-09 16:00:00', 'La Granadilla', 'Finalizado',
 (SELECT id FROM equipos WHERE nombre = 'Maped'),
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'),
 0, 5,
 (SELECT id FROM jugadores WHERE nombre = 'Adrián Carvajal Sánchez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'))),

('fd2c5db4-d57b-4e04-9487-679c173f6140','2025-03-16 16:00:00', 'P. Felipe – Pista Central', 'Finalizado',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'),
 (SELECT id FROM equipos WHERE nombre = 'More Kapa FS'),
 2, 3,
 (SELECT id FROM jugadores WHERE nombre = 'Jorge González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'))),

('42e00ec4-680a-4df4-b4c3-8706fa5c1174','2025-03-23 00:00:00', 'Descanso', 'Finalizado', NULL, NULL, NULL, NULL, NULL),

('f38068f2-5f86-4d90-a1ae-3f8f0e57011a','2025-03-30 16:00:00', 'P. Felipe – Pista Central', 'Finalizado',
 (SELECT id FROM equipos WHERE nombre = 'El Colectivo'),
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'),
 6, 2,
 (SELECT id FROM jugadores WHERE nombre = 'Santiago Alejandro Chaya' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'))),

('6f65314e-4430-4f25-901e-961ae84a75eb','2025-04-06 16:00:00', 'La Granadilla', 'Finalizado',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'),
 (SELECT id FROM equipos WHERE nombre = 'Los Potros FC'),
 5, 1,
 (SELECT id FROM jugadores WHERE nombre = 'Raúl García Rodrigo' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'))),

-- Partidos pendientes
('01ff0a7a-90f5-41f2-8e6e-3e1e2a1f94e6','2025-04-27 20:00:00', 'B.P.GALDOS Pista Techada', 'Pendiente',
 (SELECT id FROM equipos WHERE nombre = 'Mambo FC'),
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'), NULL, NULL, NULL),

('fa10b71c-f5dc-48b5-ae15-7fd7f7b23184','2025-05-11 17:00:00', 'B.P.GALDOS Pista Techada', 'Pendiente',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'),
 (SELECT id FROM equipos WHERE nombre = 'Palillos a la Mar'), NULL, NULL, NULL),

('d9d4231e-6de6-4c73-b99e-dce10f3ff31c','2025-05-18 19:00:00', 'B.P.GALDOS Pista Techada', 'Pendiente',
 (SELECT id FROM equipos WHERE nombre = 'Golesalavés'),
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'), NULL, NULL, NULL),

('4734c4a2-c0e2-456f-805e-c8b01b973f99','2025-05-25 18:00:00', 'B.P.GALDOS Pista Techada', 'Pendiente',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'),
 (SELECT id FROM equipos WHERE nombre = 'Green Park United'), NULL, NULL, NULL),

('ba246c14-929e-4c59-a8ad-f6d3c6c9b1fb','2025-06-01 18:00:00', 'B.P.GALDOS Pista Techada', 'Pendiente',
 (SELECT id FROM equipos WHERE nombre = 'Guajes'),
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'), NULL, NULL, NULL),

('7f4a2df4-b1f3-4cd4-87e6-70cd9e5b1bc9','2025-06-08 19:00:00', 'B.P.GALDOS Pista Techada', 'Pendiente',
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
    equipo_id, puntos, partidos_jugados, ganados, empatados, perdidos,
    goles_a_favor, goles_contra, diferencia_goles, promedio_tf_tc) VALUES
((SELECT id FROM equipos WHERE nombre = 'Elespot Mandangon SP'),48, 19, 16, 0, 3, 165, 61, 104, 2.70),
((SELECT id FROM equipos WHERE nombre = 'El Colectivo'),42, 18, 14, 0, 4, 72, 38, 34, 1.89),
((SELECT id FROM equipos WHERE nombre = 'More Kapa FS'),40, 18, 13, 3, 2, 99, 43, 56, 2.30),
((SELECT id FROM equipos WHERE nombre = 'Guajes'),35, 18, 11, 2, 5, 80, 56, 24, 1.43),
((SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'),35, 18, 11, 2, 5, 81, 62, 19, 1.31),
((SELECT id FROM equipos WHERE nombre = 'Palillos a la Mar'),34, 19, 12, 2, 5, 84, 55, 29, 1.53),
((SELECT id FROM equipos WHERE nombre = 'Man Red'),31, 19, 10, 1, 8, 65, 50, 15, 1.30),
((SELECT id FROM equipos WHERE nombre = 'Golesalavés'),28, 18, 10, 0, 8, 83, 62, 21, 1.34),
((SELECT id FROM equipos WHERE nombre = 'Green Park United'),20, 18, 6, 2, 10, 54, 86, -32, 0.63),
((SELECT id FROM equipos WHERE nombre = 'Comando Navacerrada'),15, 18, 5, 0, 13, 56, 92, -36, 0.61),
((SELECT id FROM equipos WHERE nombre = 'Los Potros FC'),13, 19, 4, 1, 14, 59, 90, -31, 0.66),
((SELECT id FROM equipos WHERE nombre = 'Maped'),6, 18, 2, 0, 16, 30, 101, -71, 0.30),
((SELECT id FROM equipos WHERE nombre = 'Mambo FC'),-1, 18, 0, 0, 17, 26, 158, -132, 0.16)

ON CONFLICT (equipo_id) DO UPDATE
SET
  puntos = EXCLUDED.puntos,
  partidos_jugados = EXCLUDED.partidos_jugados,
  ganados = EXCLUDED.ganados,
  empatados = EXCLUDED.empatados,
  perdidos = EXCLUDED.perdidos,
  goles_a_favor = EXCLUDED.goles_a_favor,
  goles_contra = EXCLUDED.goles_contra,
  diferencia_goles = EXCLUDED.diferencia_goles,
  promedio_tf_tc = EXCLUDED.promedio_tf_tc;

INSERT INTO estadisticas_jugador_partido (jugador_id, partido_id, goles, asistencias, amarilla, roja, portero) VALUES
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