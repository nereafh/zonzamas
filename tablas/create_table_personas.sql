
DROP TABLE IF EXISTS horarios;
DROP TABLE IF EXISTS modulos;
DROP TABLE IF EXISTS aulas;
DROP TABLE IF EXISTS cursos;
DROP TABLE IF EXISTS personas;

# 1. TABLA PERSONAS 
CREATE TABLE personas (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    nombre      VARCHAR(100) NOT NULL,
    apellidos   VARCHAR(100) NOT NULL,
    email       VARCHAR(150) UNIQUE,
    tipo        CHAR(01) NOT NULL,        # [P]rofesor, [A]lumno
    creado_en   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    # DATOS AUDITORÍA
    usuario_alta      VARCHAR(255),
    ip_alta           CHAR(15),
    fecha_sis_alta    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    usuario_modi      VARCHAR(255),
    ip_modi           CHAR(15),
    fecha_modi        TIMESTAMP
);

# #############################
# 2.3 PERSONAS (Profesores y algunos alumnos)
# #############################
INSERT INTO personas (id, nombre, apellidos, email, tipo, usuario_alta, ip_alta) VALUES
# PROFESORES (IDs 1-10)
(1, 'Alan', 'Turing', 'alan@instituto.com', 'P', 'ADMIN', '127.0.0.1'),      # Prog/Backend
(2, 'Ada', 'Lovelace', 'ada@instituto.com', 'P', 'ADMIN', '127.0.0.1'),      # BD/Sistemas
(3, 'Grace', 'Hopper', 'grace@instituto.com', 'P', 'ADMIN', '127.0.0.1'),    # Marcas/Frontend
(4, 'Linus', 'Torvalds', 'linus@instituto.com', 'P', 'ADMIN', '127.0.0.1'),  # Sistemas/Redes (SMR)
(5, 'Tim', 'Berners-Lee', 'tim@instituto.com', 'P', 'ADMIN', '127.0.0.1'),  # Servicios Red/Web
(6, 'Steve', 'Wozniak', 'steve@instituto.com', 'P', 'ADMIN', '127.0.0.1'),   # Hardware (SMR)
(7, 'Margaret', 'Hamilton', 'margaret@instituto.com', 'P', 'ADMIN', '127.0.0.1'), # FOL/EIE

# ALUMNOS (IDs 11+)
(11, 'Juan', 'Pérez', 'juan.p@alumno.com', 'A', 'ADMIN', '127.0.0.1'),
(12, 'Maria', 'García', 'maria.g@alumno.com', 'A', 'ADMIN', '127.0.0.1');
