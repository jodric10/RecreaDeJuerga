INSERT INTO equipos (id, nombre, url_logo, eslogan, descripcion, url_equipo) VALUES
  ('d72d7c7e-1e1a-4e63-8e56-3c16b1f01201', 'Elespot Mandangon SP', 'assets/logos/elespot_mandangon.png', NULL, NULL, NULL),
  ('a91e0f64-29e0-4c98-9f84-604d1a28d102', 'El Colectivo', 'assets/logos/colectivo.png', NULL, NULL, NULL),
  ('8431d13a-bd3e-4dc0-8946-2efdb9898fa1', 'More Kapa FS', 'assets/logos/more_kapa.png', NULL, NULL, NULL),
  ('ec16775b-4411-49d1-a19b-d458d85f1801', 'Guajes', 'assets/logos/guajes.png', NULL, NULL, NULL),
  ('7a688bea-2027-4e9a-a90c-76fbd301f4b2', 'Recrea de Juerga', 'assets/logos/recrea_de_juerga.png', 'Jugamos como bebemos: sin miedo y hasta el final', 'Somos un equipo que se apoya en todo momento, con compromiso y entrega total. Dejamos el alma en cada partido, creyendo hasta el final sin importar las circunstancias. Ya sea bajo el sol, la lluvia, la niebla o el viento, siempre estamos listos para jugar al fútbol, porque es lo que nos une. En el Recrea de Juerga jugamos para ganar, sí, pero también para competir con respeto y deportividad. Nos adaptamos a cualquier estilo: jugando bonito, replegados, con garra o con golpes, lo importante es dejarlo todo por el equipo. El Recrea de Juerga acaba de nacer, pero ya late con historia. Y lo que sentimos por este escudo no se explica... se demuestra.', 'assets/img/recreaDeJuerga.png'),
  ('c27e21fc-ef6b-44a1-ae5a-c3b28539c0d3', 'Palillos a la Mar', 'assets/logos/palillos_a_la_mar.png', NULL, NULL, NULL),
  ('b8d5213e-bebf-4d07-a3ee-43793194b964', 'Man Red', 'assets/logos/man_red.png', NULL, NULL, NULL),
  ('ea84a2a2-0176-4a3c-8926-52bda3081b4a', 'Golesalavés', 'assets/logos/golesalaves.png', NULL, NULL, NULL),
  ('bb4f1ee8-510e-45f9-a9f8-7d54e845ec10', 'Green Park United', 'assets/logos/green_park.png', NULL, NULL, NULL),
  ('e10f5b5c-00ae-41ad-a2c3-2f3a9cb28233', 'Comando Navacerrada', 'assets/logos/comando_navacerrada.png', NULL, NULL, NULL),
  ('f3c4e948-b0a5-4294-8012-22f6f2de6e0f', 'Los Potros FC', 'assets/logos/potros.png', NULL, NULL, NULL),
  ('e78d5c6e-003d-45c9-b991-d7c60ccfeabc', 'Maped', 'assets/logos/maped.png', NULL, NULL, NULL),
  ('1f94515c-fc16-4c4f-b1dc-7c6f648ad7f2', 'Mambo FC', 'assets/logos/mambo.png', NULL, NULL, NULL)
ON CONFLICT (nombre) DO UPDATE
SET url_logo = EXCLUDED.url_logo,
    eslogan = EXCLUDED.eslogan,
    descripcion = EXCLUDED.descripcion,
    url_equipo = EXCLUDED.url_equipo;

INSERT INTO jugadores (
    id, nombre, apodo, dorsal, posicion, pie_dominante, goles_totales, asistencias_totales,
    fortalezas, fecha_nacimiento,nacionalidad, equipo_id,cromo, foto_pose, num_coleccionable
) VALUES
('ecf8164a-2220-46fe-affb-7679a03f3a6d', 'Jorge González Pérez', 'González', 11, 'Ala', 'Derecho', 9, 15, 'Calidad, control, pase, arranque', '2004-05-03', 'España',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'), null, 'http://example.com/foto_pose1.png', null),

('522fb925-c88d-4680-84d8-1dfacfd0c70b', 'Nacho Manzano Pérez', 'Manzano', 17, 'Ala', 'Derecho', 4, 7, 'Pulmón, visión, box to box', '2004-09-17', 'España',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'), null, 'http://example.com/foto_pose2.png', null),

('34fb45a0-93db-4fc8-b5fe-77cd67600cee', 'Daniel Manzano Pérez', 'Dani', 35, 'Cierre', 'Derecho', 2, 5, 'Visión, pase, control', '2007-08-09', 'España',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'), 'assets/cromos/dani.png','assets/poses/dani.png',1),

('a3e96069-e2ea-4029-b23d-ae6b856f942d', 'Jorge Sánchez Rodríguez', 'Kalibuchi', 2, 'Cierre', 'Izquierdo', 4, 5, 'Golpeo potente, defensa, asociación', '2004-09-17', 'España',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'), 'assets/cromos/kali.png','assets/poses/kali.png', 2),

('e0e8f259-73ee-4005-9369-235c3f6c31c9', 'Adrián Carvajal Sánchez', 'Adri', 19, 'Pívot', 'Derecho', 23, 11, 'Físico, velocidad, remate', '2004-03-22', 'España',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'), null,'http://example.com/foto_pose5.png',null),

('86c4cb1c-144c-4660-bb47-bdf440501ded', 'Santiago Alejandre Chaya', 'Santi', 14, 'Ala', 'Derecho', 13, 8, 'Fuerza, resistencia, velocidad', '2004-08-18', 'España',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'), 'assets/cromos/chaya.png','assets/poses/chaya.png',3),

('e2a9b4dc-0247-4526-98c5-a2020b2d5cf4', 'Alberto González Pérez', 'Alberoto', 5, 'Ala', 'Derecho', 2, 7, 'Inteligencia, apoyo, sacrificio', '1999-07-20', 'España',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'), null, 'http://example.com/foto_pose2.png', null),

('b1ec4c9f-79f7-4c84-a9b3-8e2c6631f8a0', 'Raúl García Rodrigo', 'Ra', 1, 'Portero', 'Derecho', 3, 3, 'Reflejos, colocación, visión', '2004-12-04', 'España',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'), null,'http://example.com/foto_pose3.png', null),

('f217f7a2-bb7e-4729-b0a8-6f5f90a58f17', 'Fernando Méndez Lera', 'Fer', 8, 'Ala', 'Izquierdo', 15, 8, 'Desborde, zurda, disparo', '2007-01-27', 'España',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'), 'assets/cromos/fer.png', 'assets/poses/fer.png',6),

('ac548370-00ff-4060-b4bb-284378c6c9d9', 'Alfonso Perís Pérez', 'Fonsi', 12, 'Pívot', 'Derecho', 4, 3, 'Compromiso, movilidad, físico', '2004-10-17', 'España',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'), 'assets/cromos/fonsi.png', 'assets/poses/fonsi.png', 4),

('1e9a00be-308e-4a30-98a1-e7254ecb03fa', 'Mario Rodríguez Díaz', 'Mario', 20, 'Ala', 'Derecho', 2, 3, 'Calidad, sacrificio, apoyo', '2004-06-11', 'España',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'), 'assets/cromos/mario.png', 'assets/poses/mario.png',5)

ON CONFLICT (equipo_id, dorsal) DO UPDATE SET
  nombre = EXCLUDED.nombre,
  apodo = EXCLUDED.apodo,
  posicion = EXCLUDED.posicion,
  pie_dominante = EXCLUDED.pie_dominante,
  goles_totales = EXCLUDED.goles_totales,
  asistencias_totales = EXCLUDED.asistencias_totales,
  fortalezas = EXCLUDED.fortalezas,
  fecha_nacimiento = EXCLUDED.fecha_nacimiento,
  nacionalidad= EXCLUDED.nacionalidad,
  cromo = EXCLUDED.cromo,
  foto_pose = EXCLUDED.foto_pose,
  num_coleccionable= EXCLUDED.num_coleccionable;

INSERT INTO jugadores_parecidos (id,jugador_id, parecido) VALUES
('0a1d3d10-1234-4a1f-9b01-000000000001', (SELECT id FROM jugadores WHERE nombre = 'Jorge González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Milinković-Savić'),
('0a1d3d10-1234-4a1f-9b01-000000000002', (SELECT id FROM jugadores WHERE nombre = 'Jorge González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'David Silva'),
('0a1d3d10-1234-4a1f-9b01-000000000003', (SELECT id FROM jugadores WHERE nombre = 'Jorge González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Isco'),

('0a1d3d10-1234-4a1f-9b01-000000000004', (SELECT id FROM jugadores WHERE nombre = 'Nacho Manzano Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Camavinga'),
('0a1d3d10-1234-4a1f-9b01-000000000005', (SELECT id FROM jugadores WHERE nombre = 'Nacho Manzano Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Valverde'),
('0a1d3d10-1234-4a1f-9b01-000000000006', (SELECT id FROM jugadores WHERE nombre = 'Nacho Manzano Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Saúl'),

('0a1d3d10-1234-4a1f-9b01-000000000007', (SELECT id FROM jugadores WHERE nombre = 'Daniel Manzano Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Xabi Alonso'),
('0a1d3d10-1234-4a1f-9b01-000000000008', (SELECT id FROM jugadores WHERE nombre = 'Daniel Manzano Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Busquets'),
('0a1d3d10-1234-4a1f-9b01-000000000009', (SELECT id FROM jugadores WHERE nombre = 'Daniel Manzano Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Parejo'),

('0a1d3d10-1234-4a1f-9b01-000000000010', (SELECT id FROM jugadores WHERE nombre = 'Jorge Sánchez Rodríguez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Koulibaly'),
('0a1d3d10-1234-4a1f-9b01-000000000011', (SELECT id FROM jugadores WHERE nombre = 'Jorge Sánchez Rodríguez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Alaba'),
('0a1d3d10-1234-4a1f-9b01-000000000012', (SELECT id FROM jugadores WHERE nombre = 'Jorge Sánchez Rodríguez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Valverde'),

('0a1d3d10-1234-4a1f-9b01-000000000013', (SELECT id FROM jugadores WHERE nombre = 'Adrián Carvajal Sánchez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Luis Suárez'),
('0a1d3d10-1234-4a1f-9b01-000000000014', (SELECT id FROM jugadores WHERE nombre = 'Adrián Carvajal Sánchez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Chicharito'),
('0a1d3d10-1234-4a1f-9b01-000000000015', (SELECT id FROM jugadores WHERE nombre = 'Adrián Carvajal Sánchez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Carlos Vela'),

('0a1d3d10-1234-4a1f-9b01-000000000016', (SELECT id FROM jugadores WHERE nombre = 'Santiago Alejandre Chaya' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Llorente'),
('0a1d3d10-1234-4a1f-9b01-000000000017', (SELECT id FROM jugadores WHERE nombre = 'Santiago Alejandre Chaya' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Valverde'),
('0a1d3d10-1234-4a1f-9b01-000000000018', (SELECT id FROM jugadores WHERE nombre = 'Santiago Alejandre Chaya' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'En-Nesyri'),

('0a1d3d10-1234-4a1f-9b01-000000000019', (SELECT id FROM jugadores WHERE nombre = 'Alberto González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'David Silva'),
('0a1d3d10-1234-4a1f-9b01-000000000020', (SELECT id FROM jugadores WHERE nombre = 'Alberto González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Kroos'),
('0a1d3d10-1234-4a1f-9b01-000000000021', (SELECT id FROM jugadores WHERE nombre = 'Alberto González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Fabián Ruiz'),

('0a1d3d10-1234-4a1f-9b01-000000000022', (SELECT id FROM jugadores WHERE nombre = 'Raúl García Rodrigo' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Casillas'),
('0a1d3d10-1234-4a1f-9b01-000000000023', (SELECT id FROM jugadores WHERE nombre = 'Raúl García Rodrigo' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Éderson'),
('0a1d3d10-1234-4a1f-9b01-000000000024', (SELECT id FROM jugadores WHERE nombre = 'Raúl García Rodrigo' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Busquets'),

('0a1d3d10-1234-4a1f-9b01-000000000025', (SELECT id FROM jugadores WHERE nombre = 'Fernando Méndez Lera' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Di María'),
('0a1d3d10-1234-4a1f-9b01-000000000026', (SELECT id FROM jugadores WHERE nombre = 'Fernando Méndez Lera' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Asensio'),
('0a1d3d10-1234-4a1f-9b01-000000000027', (SELECT id FROM jugadores WHERE nombre = 'Fernando Méndez Lera' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Mertens'),

('0a1d3d10-1234-4a1f-9b01-000000000028', (SELECT id FROM jugadores WHERE nombre = 'Alfonso Perís Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Diego Costa'),
('0a1d3d10-1234-4a1f-9b01-000000000029', (SELECT id FROM jugadores WHERE nombre = 'Alfonso Perís Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Morata'),
('0a1d3d10-1234-4a1f-9b01-000000000030', (SELECT id FROM jugadores WHERE nombre = 'Alfonso Perís Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Correa'),

('0a1d3d10-1234-4a1f-9b01-000000000031', (SELECT id FROM jugadores WHERE nombre = 'Mario Rodríguez Díaz' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Canales'),
('0a1d3d10-1234-4a1f-9b01-000000000032', (SELECT id FROM jugadores WHERE nombre = 'Mario Rodríguez Díaz' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Fornals'),
('0a1d3d10-1234-4a1f-9b01-000000000033', (SELECT id FROM jugadores WHERE nombre = 'Mario Rodríguez Díaz' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')), 'Rubén García')
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

('22142dcb-09a3-4d11-b18d-68a5d63be5d2','2024-11-17 00:00:00', 'Descanso', 'Finalizado',  (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'), NULL, NULL, NULL, NULL),

('ca64e6c6-b226-44de-b2ec-8e245d0e4739','2024-11-24 16:00:00', 'P. Felipe – Pista Central', 'Finalizado',
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'),
 (SELECT id FROM equipos WHERE nombre = 'El Colectivo'),
 2, 3,
 (SELECT id FROM jugadores WHERE nombre = 'Santiago Alejandre Chaya' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'))),

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
 4, 5,
 (SELECT id FROM jugadores WHERE nombre = 'Santiago Alejandre Chaya' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'))),

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

('42e00ec4-680a-4df4-b4c3-8706fa5c1174','2025-03-23 00:00:00', 'Descanso', 'Finalizado',  (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'), NULL, NULL, NULL, NULL),

('f38068f2-5f86-4d90-a1ae-3f8f0e57011a','2025-03-30 16:00:00', 'P. Felipe – Pista Central', 'Finalizado',
 (SELECT id FROM equipos WHERE nombre = 'El Colectivo'),
 (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'),
 6, 2,
 (SELECT id FROM jugadores WHERE nombre = 'Santiago Alejandre Chaya' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga'))),

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

INSERT INTO estadisticas_jugador_partido (
    id, jugador_id, partido_id, goles, asistencias, amarilla, roja, portero
) VALUES
(
    '63f8e4dc-7b4d-4cb7-9c23-943d4cf912a1',
    (SELECT id FROM jugadores WHERE nombre = 'Adrián Carvajal Sánchez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
    (SELECT id FROM partidos WHERE fecha = '2024-10-06 17:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
    2, 0, FALSE, FALSE, TRUE
),
(
    '5ad33b71-daa5-4ed1-975c-3e1cb7dc16d2',
    (SELECT id FROM jugadores WHERE nombre = 'Nacho Manzano Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
    (SELECT id FROM partidos WHERE fecha = '2024-10-06 17:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
    1, 0, FALSE, FALSE, FALSE
),
(
    '3eaf0a96-7f1d-4423-bb76-442ee14261c9',
    (SELECT id FROM jugadores WHERE nombre = 'Alfonso Perís Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
    (SELECT id FROM partidos WHERE fecha = '2024-10-06 17:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
    0, 0, FALSE, FALSE, TRUE
),
(
    'c01cdb15-0124-4c48-bf36-58989fe05a90',
    (SELECT id FROM jugadores WHERE nombre = 'Mario Rodríguez Díaz' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
    (SELECT id FROM partidos WHERE fecha = '2024-10-06 17:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
    0, 0, FALSE, FALSE, FALSE
),
(
    'f8a0a234-fef4-419c-8d23-58f9573535c1',
    (SELECT id FROM jugadores WHERE nombre = 'Jorge González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
    (SELECT id FROM partidos WHERE fecha = '2024-10-06 17:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
    0, 1, FALSE, FALSE, TRUE
),

(
    '8a7f661b-64a7-41a0-bafe-61b08d1cd489',
    (SELECT id FROM jugadores WHERE nombre = 'Adrián Carvajal Sánchez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
    (SELECT id FROM partidos WHERE fecha = '2024-10-20 20:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
    2, 1, FALSE, FALSE, FALSE
),
(
    '5e6dff27-0b8d-4ec9-93be-950226df0ed7',
    (SELECT id FROM jugadores WHERE nombre = 'Santiago Alejandre Chaya' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
    (SELECT id FROM partidos WHERE fecha = '2024-10-20 20:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
    1, 1, FALSE, FALSE, FALSE
),
(
    'a39d0556-0ea0-4f1d-a9c6-e23f20666342',
    (SELECT id FROM jugadores WHERE nombre = 'Jorge González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
    (SELECT id FROM partidos WHERE fecha = '2024-10-20 20:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
    1, 2, FALSE, FALSE, FALSE
),
(
    '9fcb31fa-11f7-490f-a0be-b5246f846fc1',
    (SELECT id FROM jugadores WHERE nombre = 'Alfonso Perís Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
    (SELECT id FROM partidos WHERE fecha = '2024-10-20 20:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
    1, 0, FALSE, FALSE, FALSE
),
(
    '3e8f98ea-6c68-4cc2-a282-9e706b7a7b2d',
    (SELECT id FROM jugadores WHERE nombre = 'Raúl García Rodrigo' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
    (SELECT id FROM partidos WHERE fecha = '2024-10-20 20:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
    0, 0, FALSE, FALSE, TRUE
),
(
    '37f558fa-52cb-4749-a432-b63f32aa5074',
    (SELECT id FROM jugadores WHERE nombre = 'Nacho Manzano Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
    (SELECT id FROM partidos WHERE fecha = '2024-10-20 20:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
    0, 0, FALSE, FALSE, FALSE
),
(
    'f69d4134-3556-4292-90db-99d5a89e5645',
    (SELECT id FROM jugadores WHERE nombre = 'Jorge Sánchez Rodríguez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
    (SELECT id FROM partidos WHERE fecha = '2024-10-20 20:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
    0, 0, FALSE, FALSE, FALSE
),
(
    '9c5ec8b3-4b4f-4cf9-9fcd-4ff9c924c26d',
    (SELECT id FROM jugadores WHERE nombre = 'Alberto González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
    (SELECT id FROM partidos WHERE fecha = '2024-10-20 20:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
    0, 0, FALSE, FALSE, FALSE
),
(
    '6a3c4ae4-1a3b-4e41-8267-5b3e4e3fa760',
    (SELECT id FROM jugadores WHERE nombre = 'Mario Rodríguez Díaz' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
    (SELECT id FROM partidos WHERE fecha = '2024-10-20 20:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
    0, 0, FALSE, FALSE, FALSE
),

('63a1e7a6-7051-4f91-b80d-ec13c53176db',
 (SELECT id FROM jugadores WHERE nombre = 'Adrián Carvajal Sánchez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-10-27 16:00:00' AND lugar = 'La Granadilla'),
 1, 2, FALSE, FALSE, FALSE),

('d4f149e0-5536-4c82-8322-89b073e05461',
 (SELECT id FROM jugadores WHERE nombre = 'Raúl García Rodrigo' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-10-27 16:00:00' AND lugar = 'La Granadilla'),
 1, 0, FALSE, FALSE, TRUE),

('0d6d2c7f-99d3-4e23-9f58-8fef43b8bda5',
 (SELECT id FROM jugadores WHERE nombre = 'Nacho Manzano Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-10-27 16:00:00' AND lugar = 'La Granadilla'),
 1, 1, FALSE, FALSE, FALSE),

('3ec73ae3-07ac-4cc0-b26b-45a6bb7b4370',
 (SELECT id FROM jugadores WHERE nombre = 'Alfonso Perís Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-10-27 16:00:00' AND lugar = 'La Granadilla'),
 1, 0, FALSE, FALSE, FALSE),

('8441ab39-df33-464f-a5c3-53a7f87c4d4c',
 (SELECT id FROM jugadores WHERE nombre = 'Santiago Alejandre Chaya' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-10-27 16:00:00' AND lugar = 'La Granadilla'),
 0, 0, FALSE, FALSE, FALSE),

('bb56e963-f6a5-4f3b-ae3a-e3f5b72e28c7',
 (SELECT id FROM jugadores WHERE nombre = 'Jorge Sánchez Rodríguez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-10-27 16:00:00' AND lugar = 'La Granadilla'),
 0, 0, FALSE, FALSE, FALSE),

('9d85886a-4462-42fb-ae59-1faea30ac891',
 (SELECT id FROM jugadores WHERE nombre = 'Alberto González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-10-27 16:00:00' AND lugar = 'La Granadilla'),
 0, 0, FALSE, FALSE, FALSE),

('f671ce70-96f7-4cf8-9b6b-e0cc2f38e85b',
 (SELECT id FROM jugadores WHERE nombre = 'Mario Rodríguez Díaz' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-10-27 16:00:00' AND lugar = 'La Granadilla'),
 0, 0, FALSE, FALSE, FALSE),

('1b72a3a9-39b6-4ad2-8971-2bfeeb8abcf2',
 (SELECT id FROM jugadores WHERE nombre = 'Jorge González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-10-27 16:00:00' AND lugar = 'La Granadilla'),
 0, 1, FALSE, FALSE, FALSE),

('3e9d063f-0f85-4390-a829-37d38e5891ae',
 (SELECT id FROM jugadores WHERE nombre = 'Jorge González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-11-10 16:00:00' AND lugar = 'P. Felipe – Pista Central'),
 2, 0, FALSE, FALSE, FALSE),

('d951413c-c5f0-4cf2-8f0a-632e5a7e69b0',
 (SELECT id FROM jugadores WHERE nombre = 'Nacho Manzano Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-11-10 16:00:00' AND lugar = 'P. Felipe – Pista Central'),
 0, 0, FALSE, FALSE, FALSE),

('a6eb136d-1d1b-4223-bd0f-48956d9eb9a3',
 (SELECT id FROM jugadores WHERE nombre = 'Alberto González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-11-10 16:00:00' AND lugar = 'P. Felipe – Pista Central'),
 0, 0, FALSE, FALSE, FALSE),

('ee83f3b2-bf26-49c2-950f-1e9c2ea8c8dc',
 (SELECT id FROM jugadores WHERE nombre = 'Mario Rodríguez Díaz' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-11-10 16:00:00' AND lugar = 'P. Felipe – Pista Central'),
 0, 0, FALSE, TRUE, FALSE),

('d78ffda1-13e0-4aa6-9603-e9607f3736f4',
 (SELECT id FROM jugadores WHERE nombre = 'Adrián Carvajal Sánchez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-11-10 16:00:00' AND lugar = 'P. Felipe – Pista Central'),
 0, 0, FALSE, FALSE, FALSE),

('3fa6742c-0b33-429a-8f7e-b442e775bead',
 (SELECT id FROM jugadores WHERE nombre = 'Alfonso Perís Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-11-10 16:00:00' AND lugar = 'P. Felipe – Pista Central'),
 0, 0, FALSE, FALSE, FALSE),

('149e3f7c-2d82-4e5d-a6d6-65a48b116c95',
 (SELECT id FROM jugadores WHERE nombre = 'Raúl García Rodrigo' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-11-10 16:00:00' AND lugar = 'P. Felipe – Pista Central'),
 0, 0, FALSE, FALSE, TRUE),

('24558760-8c5b-4ec7-b9c1-c7c3e6c1c430',
 (SELECT id FROM jugadores WHERE nombre = 'Santiago Alejandre Chaya' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-11-24 16:00:00' AND lugar = 'P. Felipe – Pista Central'),
 2, 0, FALSE, FALSE, FALSE),

('b54a2d5b-4f5c-4fd0-a14f-8f3adf5071dc',
 (SELECT id FROM jugadores WHERE nombre = 'Raúl García Rodrigo' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-11-24 16:00:00' AND lugar = 'P. Felipe – Pista Central'),
 0, 0, FALSE, FALSE, TRUE),

('aa5e79d4-8913-47bb-a1ee-5f296ccdcaf8',
 (SELECT id FROM jugadores WHERE nombre = 'Daniel Manzano Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-11-24 16:00:00' AND lugar = 'P. Felipe – Pista Central'),
 0, 0, FALSE, FALSE, FALSE),

('0a3f09a2-1819-4043-8650-c82ce6611d8f',
 (SELECT id FROM jugadores WHERE nombre = 'Alfonso Perís Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-11-24 16:00:00' AND lugar = 'P. Felipe – Pista Central'),
 0, 0, FALSE, FALSE, FALSE),

('8b32ce99-bc71-4db5-b6a9-05e3c7e1c90e',
 (SELECT id FROM jugadores WHERE nombre = 'Mario Rodríguez Díaz' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-11-24 16:00:00' AND lugar = 'P. Felipe – Pista Central'),
 0, 0, FALSE, FALSE, FALSE),

('9ea05ab8-129e-49cf-bb83-768f1c41095c',
 (SELECT id FROM jugadores WHERE nombre = 'Alberto González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-11-24 16:00:00' AND lugar = 'P. Felipe – Pista Central'),
 0, 0, FALSE, TRUE, FALSE),

('35813f3c-6167-4b79-a3be-4ffb2ad24b44',
 (SELECT id FROM jugadores WHERE nombre = 'Jorge Sánchez Rodríguez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-11-24 16:00:00' AND lugar = 'P. Felipe – Pista Central'),
 0, 0, FALSE, TRUE, FALSE),

('9ef221ed-f8bb-4f4f-a3bc-d09c37a2be27',
 (SELECT id FROM jugadores WHERE nombre = 'Adrián Carvajal Sánchez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-11-24 16:00:00' AND lugar = 'P. Felipe – Pista Central'),
 0, 1, FALSE, TRUE, FALSE),

('ebc1f91a-92e3-487f-97fa-d3f839edb933',
 (SELECT id FROM jugadores WHERE nombre = 'Jorge González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-11-24 16:00:00' AND lugar = 'P. Felipe – Pista Central'),
 0, 1, FALSE, FALSE, FALSE),

('0fb67d86-7b63-4cb6-87c1-3fc79cdbe92b',
 (SELECT id FROM jugadores WHERE nombre = 'Santiago Alejandre Chaya' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-12-01 16:00:00' AND lugar = 'La Granadilla'),
 1, 1, FALSE, FALSE, FALSE),

('f4f8186b-7f28-4867-8c92-0de6e9624728',
 (SELECT id FROM jugadores WHERE nombre = 'Jorge González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-12-01 16:00:00' AND lugar = 'La Granadilla'),
 1, 0, FALSE, FALSE, FALSE),

('9937b85d-203b-4cd9-a6db-f2c1d34a1ea3',
 (SELECT id FROM jugadores WHERE nombre = 'Jorge Sánchez Rodríguez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-12-01 16:00:00' AND lugar = 'La Granadilla'),
 0, 0, FALSE, FALSE, FALSE),

('2f7c79cb-c6e5-46c6-a7d4-d8d04ee96c92',
 (SELECT id FROM jugadores WHERE nombre = 'Alberto González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-12-01 16:00:00' AND lugar = 'La Granadilla'),
 0, 1, FALSE, FALSE, FALSE),

('a29a5f46-f787-4c9e-98e6-08c2925c43bb',
 (SELECT id FROM jugadores WHERE nombre = 'Alfonso Perís Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-12-01 16:00:00' AND lugar = 'La Granadilla'),
 0, 0, FALSE, FALSE, FALSE),

('fa46e586-b5eb-4878-a208-72601a8fa7ed',
 (SELECT id FROM jugadores WHERE nombre = 'Daniel Manzano Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-12-01 16:00:00' AND lugar = 'La Granadilla'),
 0, 0, FALSE, FALSE, FALSE),

('a462ed3f-c84d-4ab4-9826-4eb18d9cd0e3',
 (SELECT id FROM jugadores WHERE nombre = 'Raúl García Rodrigo' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-12-01 16:00:00' AND lugar = 'La Granadilla'),
 0, 0, FALSE, FALSE, TRUE),

('9c4f3cc5-3de0-4ac9-87b8-949002bd1598',
 (SELECT id FROM jugadores WHERE nombre = 'Fernando Méndez Lera' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-12-15 20:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 4, 1, FALSE, FALSE, FALSE),

('3b8a2b4e-bcd2-4040-9f15-d5a00b5c1f58',
 (SELECT id FROM jugadores WHERE nombre = 'Adrián Carvajal Sánchez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-12-15 20:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 2, 2, FALSE, FALSE, FALSE),

('70aa867e-82cb-4327-9be9-709009d6fa7a',
 (SELECT id FROM jugadores WHERE nombre = 'Daniel Manzano Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-12-15 20:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 2, 1, FALSE, FALSE, FALSE),

('e02df420-cce5-4b90-a74b-6d414f0c0e36',
 (SELECT id FROM jugadores WHERE nombre = 'Mario Rodríguez Díaz' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-12-15 20:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 1, 1, FALSE, FALSE, FALSE),

('db29de44-cd3e-4d6a-8c3b-2c2d59c8421d',
 (SELECT id FROM jugadores WHERE nombre = 'Raúl García Rodrigo' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-12-15 20:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 1, 1, FALSE, FALSE, TRUE),

('6b6ea6bb-754b-4e4e-9e64-7f835998e758',
 (SELECT id FROM jugadores WHERE nombre = 'Alberto González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-12-15 20:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 1, 1, FALSE, FALSE, FALSE),

('bf9a3a42-5ec2-4de1-85d4-1f9fa4421ba0',
 (SELECT id FROM jugadores WHERE nombre = 'Jorge González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-12-15 20:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 1, 1, FALSE, FALSE, TRUE),

('b021a658-d93c-4d4f-85be-e1958ae76344',
 (SELECT id FROM jugadores WHERE nombre = 'Alfonso Perís Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2024-12-15 20:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 0, 1, FALSE, FALSE, FALSE),

('80c24e4a-75a3-43a5-842f-1d7b87cf50dc',
 (SELECT id FROM jugadores WHERE nombre = 'Santiago Alejandre Chaya' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-12 17:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 2, 0, FALSE, FALSE, FALSE),

('9cb14258-226f-49e3-8495-4cc514c9a2ff',
 (SELECT id FROM jugadores WHERE nombre = 'Jorge González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-12 17:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 1, 2, FALSE, FALSE, TRUE),

('5d0ed67f-2cf3-4cfd-abc9-57e7fa2cc80b',
 (SELECT id FROM jugadores WHERE nombre = 'Adrián Carvajal Sánchez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-12 17:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 1, 0, FALSE, FALSE, FALSE),

('dc8b0f42-8f20-4be1-80ed-5952a3f6f2fb',
 (SELECT id FROM jugadores WHERE nombre = 'Jorge Sánchez Rodríguez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-12 17:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 1, 0, FALSE, FALSE, FALSE),

('b8362ab6-206e-4fe8-8005-1fc457bf47b4',
 (SELECT id FROM jugadores WHERE nombre = 'Alfonso Perís Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-12 17:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 0, 0, FALSE, FALSE, FALSE),

('c0939827-9d7a-41b7-9502-4909f8ad2364',
 (SELECT id FROM jugadores WHERE nombre = 'Fernando Méndez Lera' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-12 17:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 0, 1, FALSE, FALSE, FALSE),

('78c7cf11-4fa6-42c2-a02d-4cb81e77f2cb',
 (SELECT id FROM jugadores WHERE nombre = 'Nacho Manzano Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-12 17:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 0, 0, FALSE, FALSE, FALSE),

('9d01c496-68e2-4451-81ec-705118d16a43',
 (SELECT id FROM jugadores WHERE nombre = 'Mario Rodríguez Díaz' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-12 17:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 0, 0, FALSE, FALSE, FALSE),

('3c4b3e0f-1244-4c74-ae5b-b6b4f5d6d365',
 (SELECT id FROM jugadores WHERE nombre = 'Alberto González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-12 17:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 0, 1, FALSE, FALSE, TRUE),

('b3ae4077-3736-4401-80c6-c740b34f82a6',
 (SELECT id FROM jugadores WHERE nombre = 'Jorge Sánchez Rodríguez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-19 19:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 1, 1, FALSE, FALSE, FALSE),

('23fae0f1-19fc-4f21-9679-b8dca26b0be2',
 (SELECT id FROM jugadores WHERE nombre = 'Adrián Carvajal Sánchez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-19 19:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 2, 1, FALSE, FALSE, FALSE),

('8e50ddc5-19d2-4b2c-b7b7-fc54696345b1',
 (SELECT id FROM jugadores WHERE nombre = 'Fernando Méndez Lera' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-19 19:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 1, 0, FALSE, FALSE, FALSE),

('18d99996-d037-4a65-a3e1-535b3c5dc2cf',
 (SELECT id FROM jugadores WHERE nombre = 'Jorge González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-19 19:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 0, 1, FALSE, FALSE, TRUE),

('cbf2036a-6b7d-4499-a3b5-d4d8b1df3464',
 (SELECT id FROM jugadores WHERE nombre = 'Alfonso Perís Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-19 19:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 0, 0, FALSE, FALSE, FALSE),

('de80b6e6-73d4-45a2-bb96-fb5c41bb92ee',
 (SELECT id FROM jugadores WHERE nombre = 'Nacho Manzano Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-19 19:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 0, 0, FALSE, FALSE, FALSE),

('c5f3188e-9f30-4467-8451-15a4bdb5c01f',
 (SELECT id FROM jugadores WHERE nombre = 'Mario Rodríguez Díaz' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-19 19:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 0, 0, FALSE, FALSE, FALSE),

('3cc52bc3-69e2-4b08-9e2d-c31f181177c3',
 (SELECT id FROM jugadores WHERE nombre = 'Alberto González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-19 19:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 0, 1, FALSE, FALSE, TRUE),

('ec158780-79b7-4e62-8c84-32cb319b18cf',
 (SELECT id FROM jugadores WHERE nombre = 'Santiago Alejandre Chaya' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-19 19:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 0, 0, FALSE, FALSE, FALSE),

('7ea1cfa8-56b5-4647-99cf-6a9e48269a28',
 (SELECT id FROM jugadores WHERE nombre = 'Adrián Carvajal Sánchez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-26 18:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 2, 1, FALSE, FALSE, FALSE),

('e3f1a97f-897e-4e8e-a7a8-c0f6cd4cbd0d',
 (SELECT id FROM jugadores WHERE nombre = 'Alberto González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-26 18:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 1, 0, FALSE, FALSE, FALSE),

('409730a4-f062-4fe8-8c13-f4cf4c0ea053',
 (SELECT id FROM jugadores WHERE nombre = 'Santiago Alejandre Chaya' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-26 18:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 1, 1, FALSE, FALSE, FALSE),

('5fc8417a-c300-4a0d-8c91-c3b95658994b',
 (SELECT id FROM jugadores WHERE nombre = 'Daniel Manzano Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-26 18:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 1, 0, FALSE, FALSE, FALSE),

('9f27e982-9ab4-49dc-a8f3-f362c56fcde2',
 (SELECT id FROM jugadores WHERE nombre = 'Raúl García Rodrigo' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-26 18:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 0, 0, FALSE, FALSE, TRUE),

('f253f098-18e5-4569-9622-6f3ed319c6e0',
 (SELECT id FROM jugadores WHERE nombre = 'Mario Rodríguez Díaz' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-26 18:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 0, 0, FALSE, FALSE, FALSE),

('de8d8f80-36c0-4680-88c8-9a52cd250e5d',
 (SELECT id FROM jugadores WHERE nombre = 'Alfonso Perís Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-26 18:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 0, 0, FALSE, FALSE, FALSE),

('eb49dfd7-9a0d-41a0-a9a5-43b4c0bb282b',
 (SELECT id FROM jugadores WHERE nombre = 'Fernando Méndez Lera' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-26 18:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 0, 2, FALSE, FALSE, FALSE),

('1cda121d-f9fc-456a-bd3e-4ac08d3f10c7',
 (SELECT id FROM jugadores WHERE nombre = 'Jorge González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-01-26 18:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 0, 1, FALSE, FALSE, TRUE),

('4ef6fe06-b81a-4f47-aabe-4209bcff2a9f',
 (SELECT id FROM jugadores WHERE nombre = 'Adrián Carvajal Sánchez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-02-02 18:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 1, 0, FALSE, FALSE, FALSE),

('6b17a4e5-bef4-430b-860c-62288a9fa276',
 (SELECT id FROM jugadores WHERE nombre = 'Fernando Méndez Lera' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-02-02 18:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 1, 0, FALSE, FALSE, FALSE),

('0413dc3d-bfd6-45a6-9a2f-e89c758f8039',
 (SELECT id FROM jugadores WHERE nombre = 'Mario Rodríguez Díaz' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-02-02 18:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 0, 0, FALSE, FALSE, FALSE),

('8c5468a6-5564-489c-b0cb-e9dcf06e4536',
 (SELECT id FROM jugadores WHERE nombre = 'Jorge González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-02-02 18:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 0, 1, FALSE, FALSE, FALSE),

('64d8bb25-92fa-4b6b-bae7-00651ae1e5ff',
 (SELECT id FROM jugadores WHERE nombre = 'Alberto González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-02-02 18:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 0, 0, FALSE, FALSE, FALSE),

('6ab3df67-f8ae-4c46-bf4b-fd178905ff02',
 (SELECT id FROM jugadores WHERE nombre = 'Santiago Alejandre Chaya' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-02-02 18:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 0, 0, FALSE, FALSE, FALSE),

('3de32451-5a2c-4668-961e-1306c05b2750',
 (SELECT id FROM jugadores WHERE nombre = 'Jorge Sánchez Rodríguez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-02-02 18:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 0, 1, FALSE, FALSE, FALSE),

('d553a8cb-8ac3-4e09-9611-72aa9935e182',
 (SELECT id FROM jugadores WHERE nombre = 'Alfonso Perís Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-02-02 18:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 0, 0, FALSE, FALSE, FALSE),

('a1f70ab0-5bfa-43cd-b2e3-3f1b464fb3fa',
 (SELECT id FROM jugadores WHERE nombre = 'Raúl García Rodrigo' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-02-02 18:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 0, 0, FALSE, FALSE, TRUE),

('91894f8a-589e-4f4a-b09e-07ad9209e070',
 (SELECT id FROM jugadores WHERE nombre = 'Fernando Méndez Lera' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-02-09 19:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 3, 1, FALSE, FALSE, FALSE),

('b6d6f62a-fc8e-4424-8d0c-377746a94242',
 (SELECT id FROM jugadores WHERE nombre = 'Santiago Alejandre Chaya' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-02-09 19:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 2, 1, FALSE, FALSE, FALSE),

('e3e0cf91-6fc7-4715-a42f-93fc9b2a5122',
 (SELECT id FROM jugadores WHERE nombre = 'Adrián Carvajal Sánchez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-02-09 19:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 1, 1, FALSE, FALSE, FALSE),

('c101ce93-3582-4ed3-9051-91f3a6ae46a2',
 (SELECT id FROM jugadores WHERE nombre = 'Alfonso Perís Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-02-09 19:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 1, 0, FALSE, FALSE, FALSE),

('627e2d79-e88e-4724-8029-2bb7d86b3e6f',
 (SELECT id FROM jugadores WHERE nombre = 'Raúl García Rodrigo' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-02-09 19:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 0, 0, FALSE, FALSE, TRUE),

('cb462bc9-b3a2-4bcf-a028-e793a85f7cb7',
 (SELECT id FROM jugadores WHERE nombre = 'Jorge González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-02-09 19:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 0, 2, FALSE, FALSE, FALSE),

('2be4163c-e5d4-463e-ae1e-1e83f24fd7b9',
 (SELECT id FROM jugadores WHERE nombre = 'Jorge Sánchez Rodríguez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-02-09 19:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 0, 0, FALSE, FALSE, FALSE),

('cfe7df92-8dc5-4c2a-91fc-3c3d27dc11df',
 (SELECT id FROM jugadores WHERE nombre = 'Mario Rodríguez Díaz' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-02-09 19:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 0, 1, FALSE, FALSE, FALSE),

('63f796b4-1f4d-47bb-b2ea-7d9894d24a1f',
 (SELECT id FROM jugadores WHERE nombre = 'Nacho Manzano Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-02-09 19:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 0, 0, FALSE, FALSE, FALSE),

('f214b604-c40e-4127-a11a-c1c8ccdb66c3',
 (SELECT id FROM jugadores WHERE nombre = 'Jorge Sánchez Rodríguez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-02-23 17:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 1, 1, FALSE, FALSE, FALSE),

('b169320e-b220-4327-88ef-e50323dd633c',
 (SELECT id FROM jugadores WHERE nombre = 'Fernando Méndez Lera' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-02-23 17:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 3, 2, FALSE, FALSE, FALSE),

('62002c72-95ec-4c94-8939-e16fdc9601a0',
 (SELECT id FROM jugadores WHERE nombre = 'Adrián Carvajal Sánchez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-02-23 17:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 3, 1, FALSE, FALSE, FALSE),

('acdb1705-1558-4c9a-96c7-9bcb32cce2ae',
 (SELECT id FROM jugadores WHERE nombre = 'Santiago Alejandre Chaya' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-02-23 17:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 1, 1, FALSE, FALSE, FALSE),

('0a8df6ef-06db-4321-b5c8-c60dc274fd41',
 (SELECT id FROM jugadores WHERE nombre = 'Mario Rodríguez Díaz' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-02-23 17:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 1, 0, FALSE, FALSE, FALSE),

('f253eb64-2c92-4909-b43b-b6cd43e0f418',
 (SELECT id FROM jugadores WHERE nombre = 'Raúl García Rodrigo' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-02-23 17:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 0, 0, FALSE, FALSE, TRUE),

('47b4022c-0cb3-4d16-b67c-6792f5e7a538',
 (SELECT id FROM jugadores WHERE nombre = 'Nacho Manzano Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-02-23 17:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 0, 1, FALSE, FALSE, FALSE),

('0b708fe9-51f2-41bb-9703-9172731083d6',
 (SELECT id FROM jugadores WHERE nombre = 'Adrián Carvajal Sánchez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-03-02 20:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 4, 0, FALSE, FALSE, FALSE),

('ef80e357-9175-4740-b2ea-7f7a7e8a509e',
 (SELECT id FROM jugadores WHERE nombre = 'Fernando Méndez Lera' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-03-02 20:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 1, 1, FALSE, FALSE, FALSE),

('fd313bb7-d163-4d46-b7e4-8f9d3422c6fc',
 (SELECT id FROM jugadores WHERE nombre = 'Raúl García Rodrigo' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-03-02 20:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 0, 0, FALSE, FALSE, TRUE),

('cb69b4c7-e963-4074-96f6-33ddf62eb56d',
 (SELECT id FROM jugadores WHERE nombre = 'Jorge González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-03-02 20:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 0, 1, FALSE, FALSE, FALSE),

('82fdb364-4ae9-41f1-a21f-f236c9ff4821',
 (SELECT id FROM jugadores WHERE nombre = 'Nacho Manzano Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-03-02 20:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 0, 1, FALSE, FALSE, FALSE),

('66e58b40-7d8d-4637-8fc3-f844b0451f39',
 (SELECT id FROM jugadores WHERE nombre = 'Mario Rodríguez Díaz' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-03-02 20:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 0, 1, FALSE, FALSE, FALSE),

('2f53b29c-51d8-40fd-b239-f2c997ff0e08',
 (SELECT id FROM jugadores WHERE nombre = 'Alberto González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-03-02 20:00:00' AND lugar = 'B.P.GALDOS Pista Techada'),
 0, 1, FALSE, FALSE, FALSE),

 ('72e9622f-62de-4f13-a8f1-2f4a3c0f1a79',
  (SELECT id FROM jugadores WHERE nombre = 'Adrián Carvajal Sánchez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
  (SELECT id FROM partidos WHERE fecha = '2025-03-09 16:00:00' AND lugar = 'La Granadilla'),
  1, 0, FALSE, FALSE, FALSE),

 ('79897dbb-9824-4c43-9139-2d44062fda88',
  (SELECT id FROM jugadores WHERE nombre = 'Fernando Méndez Lera' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
  (SELECT id FROM partidos WHERE fecha = '2025-03-09 16:00:00' AND lugar = 'La Granadilla'),
  1, 1, FALSE, FALSE, FALSE),

 ('6d4b73da-13ee-4f26-96a2-1f1f2ac00a15',
  (SELECT id FROM jugadores WHERE nombre = 'Santiago Alejandre Chaya' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
  (SELECT id FROM partidos WHERE fecha = '2025-03-09 16:00:00' AND lugar = 'La Granadilla'),
  2, 0, FALSE, FALSE, FALSE),

 ('92d2ff02-6a09-4635-8f4e-37f0fcce19e9',
  (SELECT id FROM jugadores WHERE nombre = 'Jorge Sánchez Rodríguez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
  (SELECT id FROM partidos WHERE fecha = '2025-03-09 16:00:00' AND lugar = 'La Granadilla'),
  1, 1, FALSE, FALSE, FALSE),

 ('e2176cfd-8719-45d6-b98b-b6a0505a7a43',
  (SELECT id FROM jugadores WHERE nombre = 'Raúl García Rodrigo' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
  (SELECT id FROM partidos WHERE fecha = '2025-03-09 16:00:00' AND lugar = 'La Granadilla'),
  0, 0, FALSE, FALSE, TRUE),

 ('8ee8e218-c264-49fa-8730-4e9a1b9e87ae',
  (SELECT id FROM jugadores WHERE nombre = 'Mario Rodríguez Díaz' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
  (SELECT id FROM partidos WHERE fecha = '2025-03-09 16:00:00' AND lugar = 'La Granadilla'),
  0, 1, FALSE, FALSE, FALSE),

 ('39f3d5ff-3e17-4683-9d43-28dcf93c4c83',
  (SELECT id FROM jugadores WHERE nombre = 'Nacho Manzano Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
  (SELECT id FROM partidos WHERE fecha = '2025-03-09 16:00:00' AND lugar = 'La Granadilla'),
  0, 1, FALSE, FALSE, FALSE),

('b5c1b54a-947c-4f78-a5d4-bf6523fc3065',
 (SELECT id FROM jugadores WHERE nombre = 'Adrián Carvajal Sánchez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-03-16 16:00:00' AND lugar = 'P. Felipe – Pista Central'),
 1, 0, TRUE, TRUE, FALSE),

('d540fcff-29f5-4a5f-84f5-e79ec6a20a13',
 (SELECT id FROM jugadores WHERE nombre = 'Jorge González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-03-16 16:00:00' AND lugar = 'P. Felipe – Pista Central'),
 1, 0, FALSE, FALSE, FALSE),

('fd1092db-f1cf-4709-8b5f-b80c1ce1a3b1',
 (SELECT id FROM jugadores WHERE nombre = 'Jorge Sánchez Rodríguez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-03-16 16:00:00' AND lugar = 'P. Felipe – Pista Central'),
 0, 0, TRUE, TRUE, FALSE),

('2a6c5a41-6a0b-4b3c-b370-66b6c62c8a96',
 (SELECT id FROM jugadores WHERE nombre = 'Nacho Manzano Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-03-16 16:00:00' AND lugar = 'P. Felipe – Pista Central'),
 0, 0, TRUE, TRUE, FALSE),

('8c6f52b7-1136-4c5b-93b4-86b83d347d8a',
 (SELECT id FROM jugadores WHERE nombre = 'Raúl García Rodrigo' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-03-16 16:00:00' AND lugar = 'P. Felipe – Pista Central'),
 0, 0, FALSE, FALSE, TRUE),

('63f063fd-7ed6-4d8a-8024-16c66ec3a922',
 (SELECT id FROM jugadores WHERE nombre = 'Mario Rodríguez Díaz' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-03-16 16:00:00' AND lugar = 'P. Felipe – Pista Central'),
 0, 0, FALSE, FALSE, FALSE),

('1ac93c02-c0cb-406f-a5ec-5f31e0d4ef0f',
 (SELECT id FROM jugadores WHERE nombre = 'Alberto González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-03-16 16:00:00' AND lugar = 'P. Felipe – Pista Central'),
 0, 0, FALSE, FALSE, FALSE),

('5a31809c-40d2-4ff3-9d0c-cdb4a238f099',
 (SELECT id FROM jugadores WHERE nombre = 'Santiago Alejandre Chaya' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-03-30 16:00:00' AND lugar = 'P. Felipe – Pista Central'),
 1, 0, FALSE, FALSE, FALSE),

('eae2ab21-8792-4a2a-b238-1275b20846d3',
 (SELECT id FROM jugadores WHERE nombre = 'Fernando Méndez Lera' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-03-30 16:00:00' AND lugar = 'P. Felipe – Pista Central'),
 1, 0, FALSE, FALSE, FALSE),

('5dc42638-5edb-435e-94cb-e43c6e42b97d',
 (SELECT id FROM jugadores WHERE nombre = 'Raúl García Rodrigo' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-03-30 16:00:00' AND lugar = 'P. Felipe – Pista Central'),
 0, 0, FALSE, FALSE, TRUE),

('e7efb8c7-d4f0-41ff-b005-2a055690fdf8',
 (SELECT id FROM jugadores WHERE nombre = 'Jorge González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-03-30 16:00:00' AND lugar = 'P. Felipe – Pista Central'),
 0, 0, FALSE, FALSE, FALSE),

('c60a4f42-0a76-4c35-808f-b1218ad6ffbb',
 (SELECT id FROM jugadores WHERE nombre = 'Mario Rodríguez Díaz' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-03-30 16:00:00' AND lugar = 'P. Felipe – Pista Central'),
 0, 0, FALSE, FALSE, FALSE),

('4507b775-f04a-4cb7-9b6a-204a4f9c6f64',
 (SELECT id FROM jugadores WHERE nombre = 'Daniel Manzano Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-03-30 16:00:00' AND lugar = 'P. Felipe – Pista Central'),
 0, 0, FALSE, FALSE, FALSE),

('e2f9d170-1e61-4370-99fa-f5240ea41390',
 (SELECT id FROM jugadores WHERE nombre = 'Alberto González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-03-30 16:00:00' AND lugar = 'P. Felipe – Pista Central'),
 0, 0, FALSE, FALSE, FALSE),

('4d1e8ba5-c4f7-408c-bc62-f40b265dfb94',
 (SELECT id FROM jugadores WHERE nombre = 'Jorge González Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-04-06 16:00:00' AND lugar = 'La Granadilla'),
 2, 2, FALSE, FALSE, TRUE),

('7a19a355-efdc-4b63-84b4-254ff0bcf8e7',
 (SELECT id FROM jugadores WHERE nombre = 'Nacho Manzano Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-04-06 16:00:00' AND lugar = 'La Granadilla'),
 1, 1, FALSE, FALSE, FALSE),

('e74c099a-5db1-4c49-b6ea-4ea6d8b2f73f',
 (SELECT id FROM jugadores WHERE nombre = 'Raúl García Rodrigo' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-04-06 16:00:00' AND lugar = 'La Granadilla'),
 1, 1, FALSE, FALSE, TRUE),

('be019b11-1043-4c32-993c-0c8ef4c00982',
 (SELECT id FROM jugadores WHERE nombre = 'Mario Rodríguez Díaz' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-04-06 16:00:00' AND lugar = 'La Granadilla'),
 0, 0, FALSE, FALSE, FALSE),

('3c12c63e-bfc5-4fd2-b9eb-259e4e1b5d25',
 (SELECT id FROM jugadores WHERE nombre = 'Santiago Alejandre Chaya' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-04-06 16:00:00' AND lugar = 'La Granadilla'),
 0, 0, FALSE, FALSE, FALSE),

('9a8ab2a1-96e0-432e-bf30-49e7a5fe82ef',
 (SELECT id FROM jugadores WHERE nombre = 'Alfonso Perís Pérez' AND equipo_id = (SELECT id FROM equipos WHERE nombre = 'Recrea de Juerga')),
 (SELECT id FROM partidos WHERE fecha = '2025-04-06 16:00:00' AND lugar = 'La Granadilla'),
 1, 0, FALSE, FALSE, FALSE)

ON CONFLICT (jugador_id, partido_id) DO UPDATE SET
    goles = EXCLUDED.goles,
    asistencias = EXCLUDED.asistencias,
    amarilla = EXCLUDED.amarilla,
    roja = EXCLUDED.roja,
    portero = EXCLUDED.portero;
