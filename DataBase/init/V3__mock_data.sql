-- =====================
-- INSERTAR ROLES
-- =====================
INSERT INTO roles (nombre_rol) VALUES
('ADMIN'),
('USUARIO');


-- =====================
-- INSERTAR USUARIOS
-- =====================
INSERT INTO usuarios (id_rol, nombre, email, password_hash) VALUES
(2, 'Admin', 'admin@gmail.com', '1234'),
(1, 'Juan Pérez', 'juan.perez@example.com', 'pass123'),
(1, 'María Gómez', 'maria.gomez@example.com', 'pass123'),
(1, 'Carlos Ruiz', 'carlos.ruiz@example.com', 'pass123');


-- =====================
-- INSERTAR GÉNEROS
-- =====================
INSERT INTO generos_libros (nombre_genero) VALUES
('Novela'),
('Ciencia'),
('Fantasía'),
('Historia'),
('Tecnología');


-- =====================
-- INSERTAR LIBROS
-- =====================
INSERT INTO libros (id_genero, titulo, autor, fecha, cantidad_total, cantidad_disponible) VALUES
(1, 'Cien Años de Soledad', 'Gabriel García Márquez', '1967-05-30', 5, 5),
(2, 'Breves Respuestas a Grandes Preguntas', 'Stephen Hawking', '2018-10-16', 3, 3),
(3, 'El Hobbit', 'J. R. R. Tolkien', '1937-09-21', 4, 4),
(4, 'Sapiens: De Animales a Dioses', 'Yuval Noah Harari', '2011-01-01', 6, 6),
(5, 'Clean Code', 'Robert C. Martin', '2008-08-11', 3, 3);


-- =====================
-- INSERTAR PRÉSTAMOS
-- (nota: estos activan el trigger de disminuir disponibilidad automáticamente)
-- =====================
-- INSERT INTO prestamos (id_usuario, id_libro, fecha_prestamo, devuelto) VALUES
-- (2, 1, NOW() - INTERVAL '10 days', FALSE), -- Juan presta "Cien años de soledad"
-- (3, 3, NOW() - INTERVAL '5 days', TRUE), -- María presta "El Hobbit" pero lo devolvió
-- (4, 5, NOW() - INTERVAL '2 days', FALSE); -- Carlos presta "Clean Code"


-- =====================
-- INSERTAR CALIFICACIONES
-- =====================
INSERT INTO calificaciones (id_usuario, id_libro, puntaje, comentario) VALUES
(2, 1, 5, 'Una obra maestra.'),
(3, 3, 4, 'Muy entretenido y bien escrito.'),
(4, 5, 5, 'Indispensable para programadores.');


-- =====================
-- INSERTAR VISUALIZACIONES
-- =====================
INSERT INTO visualizaciones (id_usuario, id_libro, fecha) VALUES
(2, 1, NOW() - INTERVAL '12 days'),
(3, 3, NOW() - INTERVAL '6 days'),
(4, 4, NOW() - INTERVAL '1 day'),
(2, 5, NOW());


-- =====================
-- INSERTAR ACCIONES PERMITIDAS
-- =====================
INSERT INTO acciones (nombre_accion) VALUES
('VISUALIZAR'),
('PRESTAR'),
('DEVOLVER'),
('CALIFICAR');