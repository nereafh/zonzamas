# 3. TABLA MÓDULOS 
CREATE TABLE modulos (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    nombre          VARCHAR(100) NOT NULL,
    siglas          VARCHAR(10) NOT NULL,
    color           VARCHAR(7) NOT NULL UNIQUE,
    curso_asignado  INT NOT NULL,
    FOREIGN KEY (curso_asignado) REFERENCES cursos(id),

    # DATOS AUDITORÍA
    usuario_alta      VARCHAR(255),
    ip_alta           CHAR(15),
    fecha_sis_alta    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    usuario_modi      VARCHAR(255),
    ip_modi           CHAR(15),
    fecha_modi        TIMESTAMP
);

# #############################
# 2.4 MÓDULOS (Asignando IDs fijos para facilitar horarios)
# #############################
INSERT INTO modulos (id, nombre, siglas, color, curso_asignado, usuario_alta, ip_alta) VALUES
# 1 DAW (Curso ID 1)
(1, 'Programación', 'PROG', '#FF5733', 1, 'ADMIN', '127.0.0.1'),
(2, 'Bases de Datos', 'BD', '#33FF57', 1, 'ADMIN', '127.0.0.1'),
(3, 'Lenguajes de Marcas', 'LMSGI', '#3357FF', 1, 'ADMIN', '127.0.0.1'),
(4, 'Sistemas Informáticos', 'SI', '#F333FF', 1, 'ADMIN', '127.0.0.1'),
(5, 'Entornos de Desarrollo', 'ED', '#33FFF5', 1, 'ADMIN', '127.0.0.1'),
(6, 'Formación y Orientación Laboral', 'FOL', '#FF33A8', 1, 'ADMIN', '127.0.0.1'),
# 2 DAW (Curso ID 2)
(7, 'Desarrollo Web en Entorno Servidor', 'DWES', '#A833FF', 2, 'ADMIN', '127.0.0.1'),
(8, 'Desarrollo Web en Entorno Cliente', 'DWEC', '#FF8C33', 2, 'ADMIN', '127.0.0.1'),
(9, 'Diseño de Interfaces Web', 'DIW', '#33FF8C', 2, 'ADMIN', '127.0.0.1'),
(10, 'Despliegue de Aplicaciones Web', 'DAW', '#8C33FF', 2, 'ADMIN', '127.0.0.1'),
(11, 'Empresa e Iniciativa Emprendedora', 'EIE', '#FF3333', 2, 'ADMIN', '127.0.0.1'),

# 1 SMR (Curso ID 3)
(12, 'Montaje y Mantenimiento de Equipos', 'MME', '#338CFF', 3, 'ADMIN', '127.0.0.1'),
(13, 'Sistemas Operativos Monopuesto', 'SOM', '#FFC300', 3, 'ADMIN', '127.0.0.1'),
(14, 'Aplicaciones Ofimáticas', 'AO', '#DAF7A6', 3, 'ADMIN', '127.0.0.1'),
(15, 'Redes Locales', 'RL', '#581845', 3, 'ADMIN', '127.0.0.1'),
(16, 'Formación y Orientación Laboral', 'FOL-S', '#C70039', 3, 'ADMIN', '127.0.0.1'),

# 2 SMR (Curso ID 4)
(17, 'Sistemas Operativos en Red', 'SOR', '#900C3F', 4, 'ADMIN', '127.0.0.1'),
(18, 'Seguridad Informática', 'S-INF', '#2E86C1', 4, 'ADMIN', '127.0.0.1'),
(19, 'Servicios de Red', 'SER', '#138D75', 4, 'ADMIN', '127.0.0.1'),
(20, 'Aplicaciones Web', 'AW', '#D35400', 4, 'ADMIN', '127.0.0.1'),
(21, 'Empresa e Iniciativa Emprendedora', 'EIE-S', '#7D3C98', 4, 'ADMIN', '127.0.0.1');