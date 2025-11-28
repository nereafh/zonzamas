-- 1. TABLA PERSONAS (NUEVA - Requisito: Tabla común)
-- Aquí se guardan tanto alumnos como profesores. 
-- Se usa un campo 'tipo' o 'rol' para diferenciarlos.

CREATE TABLE personas (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    nombre      VARCHAR(100) NOT NULL,
    apellidos   VARCHAR(100) NOT NULL,
    email       VARCHAR(150) UNIQUE,
    tipo        CHAR(1) NOT NULL,        -- [P]rofesor, [A]lumno
    creado_en   TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    -- Otros datos que estimes necesarios
);

INSERT INTO personas (nombre, apellidos, email, tipo) VALUES
('Andrés', 'Calamaro', 'andrescalamaro@gmail.com', 'P'),
('Marcela', 'Santos Pérez', 'marcelasantos@gmail.com', 'P'),
('Emilia', 'García Torres', 'emigg@gmail.com', 'P'),
('Juan Carlos', 'Ortega Vélez', 'juanca@gmail.com', 'P'),
('Luna', 'Martínez López', 'lunamarti@gmail.com', 'P'),
('Felipe', 'Gómez Ruiz', 'felipe2024@gmail.com', 'A'),
('Tomás', 'Herrera Díaz', 'herreradiaz@gmail.com', 'A'),
('Carla', 'Jiménez Rojas', 'carla321@gmail.com', 'A'),
('Diego', 'Morales Núñez', 'diegomorales@gmail.com', 'A'),
('Vanessa', 'Ramírez Solís', 'vanessarami@gmail.com', 'A');