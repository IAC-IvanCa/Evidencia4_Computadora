-- Tabla principal: Computadoras
CREATE TABLE computadoras (
    id_computadora INT PRIMARY KEY AUTO_INCREMENT,
    procesador VARCHAR(50) NOT NULL,
    ram INT NOT NULL, -- en GB
    almacenamiento INT NOT NULL, -- en GB
    sistema_operativo VARCHAR(50) NOT NULL,
    estado BOOLEAN DEFAULT FALSE -- 0 = Apagada, 1 = Encendida
);

-- Tabla: Programas Instalados
CREATE TABLE programas_instalados (
    id_programa INT PRIMARY KEY AUTO_INCREMENT,
    nombre_programa VARCHAR(100) NOT NULL,
    tamaño_programa INT NOT NULL, -- en GB
    id_computadora INT,
    FOREIGN KEY (id_computadora) REFERENCES computadoras(id_computadora)
);

-- Tabla: Actualizaciones de Sistema Operativo
CREATE TABLE actualizaciones_sistema (
    id_actualizacion INT PRIMARY KEY AUTO_INCREMENT,
    version_anterior VARCHAR(50),
    version_nueva VARCHAR(50) NOT NULL,
    fecha_actualizacion DATE NOT NULL,
    id_computadora INT,
    FOREIGN KEY (id_computadora) REFERENCES computadoras(id_computadora)
);

-- Inserción de computadoras
INSERT INTO computadoras (procesador, ram, almacenamiento, sistema_operativo, estado) 
VALUES ('Intel Core i7', 16, 512, 'Windows 10', 1);

INSERT INTO computadoras (procesador, ram, almacenamiento, sistema_operativo, estado) 
VALUES ('AMD Ryzen 7', 32, 1024, 'Linux Ubuntu 20.04', 0);

INSERT INTO computadoras (procesador, ram, almacenamiento, sistema_operativo, estado) 
VALUES ('Intel Core i5', 8, 256, 'Windows 10', 1);

INSERT INTO computadoras (procesador, ram, almacenamiento, sistema_operativo, estado) 
VALUES ('Apple M1', 16, 512, 'macOS Monterey', 1);

INSERT INTO computadoras (procesador, ram, almacenamiento, sistema_operativo, estado) 
VALUES ('AMD Ryzen 5', 16, 512, 'Windows 11', 0);

-- Inserción de programas instalados
INSERT INTO programas_instalados (nombre_programa, tamaño_programa, id_computadora) 
VALUES ('Photoshop', 5, 1);

INSERT INTO programas_instalados (nombre_programa, tamaño_programa, id_computadora) 
VALUES ('Visual Studio Code', 1, 2);

INSERT INTO programas_instalados (nombre_programa, tamaño_programa, id_computadora) 
VALUES ('Chrome', 1, 3);

INSERT INTO programas_instalados (nombre_programa, tamaño_programa, id_computadora) 
VALUES ('Final Cut Pro', 3, 4);

INSERT INTO programas_instalados (nombre_programa, tamaño_programa, id_computadora) 
VALUES ('Office 365', 2, 5);

-- Inserción de actualizaciones de sistema operativo
INSERT INTO actualizaciones_sistema (version_anterior, version_nueva, fecha_actualizacion, id_computadora) 
VALUES ('Windows 10', 'Windows 11', '2023-06-15', 1);

INSERT INTO actualizaciones_sistema (version_anterior, version_nueva, fecha_actualizacion, id_computadora) 
VALUES ('Linux Ubuntu 20.04', 'Linux Ubuntu 22.04', '2023-07-20', 2);

INSERT INTO actualizaciones_sistema (version_anterior, version_nueva, fecha_actualizacion, id_computadora) 
VALUES ('macOS Monterey', 'macOS Ventura', '2023-09-10', 4);

INSERT INTO actualizaciones_sistema (version_anterior, version_nueva, fecha_actualizacion, id_computadora) 
VALUES ('Windows 10', 'Windows 11', '2023-05-30', 3);

INSERT INTO actualizaciones_sistema (version_anterior, version_nueva, fecha_actualizacion, id_computadora) 
VALUES ('Windows 11', 'Windows 11 22H2', '2023-08-01', 5);


-- Consulta todas las computadoras encendidas:

SELECT * FROM computadoras WHERE estado = 1;

-- Consulta las especificaciones de una computadora específica:

SELECT procesador, ram, almacenamiento, sistema_operativo 
FROM computadoras 
WHERE id_computadora = 3;

-- Consulta los programas instalados en una computadora específica:

SELECT nombre_programa, tamaño_programa 
FROM programas_instalados 
WHERE id_computadora = 1;

-- Consulta el historial de actualizaciones de una computadora:

SELECT version_anterior, version_nueva, fecha_actualizacion 
FROM actualizaciones_sistema 
WHERE id_computadora = 2;

-- Consulta las computadoras que tienen más de 512 GB de almacenamiento:

SELECT * 
FROM computadoras 
WHERE almacenamiento > 512;
