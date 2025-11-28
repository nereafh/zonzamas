-- 4. TABLA HORARIOS (RECICLADA pero adaptada)
-- Es diferente a la de módulos porque define CUÁNDO ocurre la clase.
CREATE TABLE horarios (
    id                  INT AUTO_INCREMENT PRIMARY KEY,
    dia                 CHAR(01) NOT NULL,                -- [L]unes, [M]artes, [M]iercoles, [J]ueves, [V]iernes NOT NULL,
    hora_inicio         TIME NOT NULL,
    hora_fin            TIME NOT NULL,
    
    -- RELACIONES
    id_modulo INT NOT NULL,      -- Qué se imparte (y de aquí sacamos el color y siglas)
    id_profesor INT NOT NULL,    -- Quién lo imparte (FK a tabla PERSONAS)
    id_aula INT NULL,            -- Dónde (Reciclamos la tabla Aulas del ejercicio anterior)
    
    FOREIGN KEY (id_modulo) REFERENCES modulos(id),
    FOREIGN KEY (id_profesor) REFERENCES personas(id),
    -- Validación extra: Asegurarse por código que la persona sea 'Profesor'
    FOREIGN KEY (id_aula) REFERENCES aulas(id) 



);


-- Ejemplos de inserción
INSERT INTO horarios (dia, hora_inicio, hora_fin, id_modulo, id_profesor, id_aula) VALUES
('L', '09:00:00', '10:00:00', 1, 1, 1),
('M', '10:00:00', '11:00:00', 2, 3, 2),
('X', '11:00:00', '12:00:00', 3, 2, 3),
('J', '12:00:00', '13:00:00', 4, 5, 4),
('V', '13:00:00', '14:00:00', 5, 4, 5);

INSERT INTO horarios (dia, hora_inicio, hora_fin, id_modulo, id_profesor, id_aula) VALUES
('L', '10:00:00', '11:00:00', 6, 6, 6),
('M', '11:00:00', '12:00:00', 7, 7, 7),
('X', '12:00:00', '13:00:00', 8, 8, 8),
('J', '13:00:00', '14:00:00', 9, 9, 9),
('V', '14:00:00', '15:00:00', 10, 1, 10);

INSERT  INTO horarios (dia, hora_inicio, hora_fin, id_modulo, id_profesor, id_aula) VALUES
('L', '15:00:00', '16:00:00', 1, 2, 1),
('M', '16:00:00', '17:00:00', 2, 3, 2),
('X', '17:00:00', '18:00:00', 3, 4, 3),
('J', '18:00:00', '19:00:00', 4, 5, 4),
('V', '19:00:00', '20:00:00', 5, 6, 5);