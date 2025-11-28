-- 3. TABLA MÓDULOS (MODIFICADA - Requisito: Color y Siglas)
CREATE TABLE modulos (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    nombre          VARCHAR(100) NOT NULL,              -- Ej: "Desarrollo Entorno Servidor"
    siglas          VARCHAR(10) NOT NULL,               -- Ej: "DWES" (Requisito explícito)
    color           VARCHAR(7) NOT NULL UNIQUE,         -- Ej: "#FF5733" (Requisito: Color único)
    curso_asignado  INT NOT NULL,                       -- FK opcional si un módulo pertenece estrictamente a un curso
    FOREIGN KEY (curso_asignado) REFERENCES cursos(id)

);

INSERT INTO modulos (nombre, siglas, color, curso_asignado) VALUES
('Desarrollo Entorno Servidor', 'DWES', '#FF5733', 4),
('Desarrollo Aplicaciones Web', 'DAW', '#33FF57', 3),
('Sistemas de Gestión Empresarial', 'SGE', '#3357FF', 2),
('Diseño de Interfaces Web', 'DIW', '#FF33A1', 3),
('Programación Multimedia', 'PMM', '#A133FF', 2),
('Administración de Sistemas Informáticos', 'ASI', '#33FFA1', 4),
('Redes y Seguridad Informática', 'RSI', '#FFA133', 5),
('Bases de Datos Avanzadas', 'BDA', '#33A1FF', 6),
('Desarrollo de Aplicaciones Móviles', 'DAM', '#A1FF33', 7),
('Gestión de Proyectos Informáticos', 'GPI', '#FF3333', 8);

/*
INSERT INTO cursos (nombre_grado, curso_numero, letra) VALUES
('DAW', 1, 'A'),
('DAW', 1, 'B'),
('DAW', 2, 'A'),
('DAW', 2, 'B'),
('DAM', 1, 'A'),
('DAM', 1, 'B'),
('DAM', 2, 'A'),
('DAM', 2, 'B');
*/