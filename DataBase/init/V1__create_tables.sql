-- V1__create_tables.sql
-- Este Archivo es el encargado de crear el esquema básico: roles, usuarios, libros, prestamos, calificaciones, historial etc

CREATE TABLE roles (
  id_rol SERIAL PRIMARY KEY,
  nombre_rol VARCHAR(30) NOT NULL UNIQUE
);

-- Por el momento la contraseña se almacena como cualquier otro dato
CREATE TABLE usuarios (
  id_usuario SERIAL PRIMARY KEY,
  id_rol INT NOT NULL REFERENCES roles(id_rol),
  nombre VARCHAR(30) NOT NULL,
  email VARCHAR(50) NOT NULL UNIQUE,
  password_hash VARCHAR(30) NOT NULL
  
);

CREATE TABLE generos_libros(
    id_genero SERIAL PRIMARY KEY,
    nombre_genero VARCHAR(100)
);

CREATE TABLE libros (
  id_libro SERIAL PRIMARY KEY,
  id_genero INT NOT NULL REFERENCES generos_libros(id_genero),
  titulo VARCHAR(100) NOT NULL,
  autor VARCHAR(100),
  fecha DATE,
  cantidad_total INT DEFAULT 1 CHECK (cantidad_total >= 0),
  cantidad_disponible INT DEFAULT 1 CHECK (cantidad_disponible >= 0),
  portada VARCHAR(500)
);

CREATE TABLE prestamos (
  id_prestamo SERIAL PRIMARY KEY,
  id_usuario INT NOT NULL REFERENCES usuarios(id_usuario),
  id_libro INT NOT NULL REFERENCES libros(id_libro),
  fecha_prestamo TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  fecha_devolucion TIMESTAMP WITHOUT TIME ZONE,
  devuelto BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE calificaciones (
  id_calificacion SERIAL PRIMARY KEY,
  id_usuario INT NOT NULL REFERENCES usuarios(id_usuario),
  id_libro INT NOT NULL REFERENCES libros(id_libro),
  puntaje INT NOT NULL CHECK (puntaje BETWEEN 1 AND 5),
  comentario TEXT,
  fecha TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  UNIQUE (id_usuario, id_libro)
);

CREATE TABLE historial_actividad (
  id_historial SERIAL PRIMARY KEY,
  id_usuario INT NOT NULL REFERENCES usuarios(id_usuario),
  id_libro INT NULL REFERENCES libros(id_libro),
  accion VARCHAR(50) NOT NULL,
  fecha_hora TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now()
);

-- Las acciones pueden ser mirar, consultar o prestar
CREATE TABLE acciones(
  id_accion SERIAL PRIMARY KEY,
  nombre_accion VARCHAR (20)
);

CREATE TABLE visualizaciones(
  id_visualizacion SERIAL PRIMARY KEY,
  id_usuario INT NOT NULL REFERENCES usuarios(id_usuario),
  id_libro INT NULL REFERENCES libros(id_libro),
  fecha TIMESTAMP DEFAULT NOW()
);

-- índices recomendados
CREATE INDEX idx_libros_titulo ON libros (titulo);
CREATE INDEX idx_prestamos_usuario ON prestamos (id_usuario);
CREATE INDEX idx_calificaciones_libro ON calificaciones (id_libro);
