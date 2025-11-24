DROP TABLE IF EXISTS libros;

CREATE TABLE libros(
     id            INT NOT NULL AUTO_INCREMENT PRIMARY KEY
    ,titulo        VARCHAR(255) NOT NULL
    ,autor         VARCHAR(255)
    ,genero        VARCHAR(100)
    ,isbn          VARCHAR(20)
    ,fecha_publicacion DATE
    ,fecha_alta    DATE DEFAULT (CURRENT_DATE)
    ,fecha_baja    DATE DEFAULT ("99991231")

    #DATOS AUDITORÍA
    ,usuario_alta      VARCHAR(255)
    ,ip_alta           CHAR(15)
    ,fecha_sis_alta    TIMESTAMP

    ,usuario_modi  VARCHAR(255)
    ,ip_modi       CHAR(15)
    ,fecha_modi    TIMESTAMP

    ,KEY (isbn)
);

INSERT INTO libros (titulo, autor, genero, isbn, fecha_publicacion) VALUES
('Cien años de soledad','Gabriel García Márquez','Novela','978-8497592208','1967-05-30'),
('Don Quijote de la Mancha','Miguel de Cervantes','Novela','978-8491050252','1605-01-16'),
('El Principito','Antoine de Saint-Exupéry','Fábula','978-0156012195','1943-04-06'),
('1984','George Orwell','Distopía','978-0451524935','1949-06-08'),
('Crónica de una muerte anunciada','Gabriel García Márquez','Novela','978-0307389732','1981-10-15'),
('La sombra del viento','Carlos Ruiz Zafón','Misterio','978-8408172179','2001-04-01'),
('El nombre del viento','Patrick Rothfuss','Fantasía','978-8466646117','2007-03-27'),
('Harry Potter y la piedra filosofal','J.K. Rowling','Fantasía','978-0747532699','1997-06-26'),
('El alquimista','Paulo Coelho','Ficción','978-0061122415','1988-05-01'),
('Matar a un ruiseñor','Harper Lee','Novela','978-0060935467','1960-07-11');
