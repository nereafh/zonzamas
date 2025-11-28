-- 2. TABLA CURSOS (MODIFICADA - Requisito: Letra y Curso)
CREATE TABLE cursos (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    nombre_grado    VARCHAR(50) NOT NULL,           -- Ej: "DAW", "DAM"
    curso_numero    INT NOT NULL,                   -- Ej: 1, 2
    letra           CHAR(1) NOT NULL,               -- Ej: 'A', 'B' (Requisito explícito)
    -- Concatenado en vista sería: "1 DAW A"
    UNIQUE(nombre_grado, curso_numero, letra)       -- Evita duplicados como dos "1 DAW A"

    
);

INSERT INTO cursos (nombre_grado, curso_numero, letra) VALUES
('DAW', 1, 'A'),
('DAW', 1, 'B'),
('DAW', 2, 'A'),
('DAW', 2, 'B'),
('DAM', 1, 'A'),
('DAM', 1, 'B'),
('DAM', 2, 'A'),
('DAM', 2, 'B');