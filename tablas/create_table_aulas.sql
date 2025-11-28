-- 3. TABLA MÓDULOS (MODIFICADA - Requisito: Color y Siglas)
CREATE TABLE aulas (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    nombre          VARCHAR(100) NOT NULL,              -- Ej: "Desarrollo Entorno Servidor"
    curso_asignado  INT NOT NULL,                       -- FK opcional si un módulo pertenece estrictamente a un curso
    FOREIGN KEY (curso_asignado) REFERENCES cursos(id)

);

INSERT INTO aulas (nombre, curso_asignado) VALUES
('Aula 101', 1),
('Aula 102', 1),
('Aula 103', 2),
('Aula 104', 3),
('Aula 105', 4),
('Aula 106', 5),
('Aula 107', 6),
('Aula 108', 7),
('Aula 109', 8),
('Aula 110', 2);