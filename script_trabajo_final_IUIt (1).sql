CREATE DATABASE IF NOT EXISTS db_iuit;
USE db_iuit;

-- 1. Crear Tablas y relaciones

-- Tabla Pais
CREATE TABLE IF NOT EXISTS pais (
    st_Code VARCHAR(3) PRIMARY KEY,
    st_Name VARCHAR(45)
);
-- Tabla Departamento
CREATE TABLE IF NOT EXISTS Departamento (
    st_codigo VARCHAR(45) NOT NULL,
    st_departamentoid INT NOT NULL PRIMARY KEY,
    st_name VARCHAR(100) NULL,
    st_pais VARCHAR(3) NOT NULL,
    FOREIGN KEY (st_pais) REFERENCES pais (st_Code) ON DELETE NO ACTION ON UPDATE NO ACTION
);
-- Tabla Ciudad
CREATE TABLE IF NOT EXISTS Ciudad (
    st_idciudad INT NOT NULL PRIMARY KEY,
    st_name VARCHAR(100) NOT NULL,
    st_codigo INT NOT NULL,
    st_departamentoid INT NOT NULL,
    st_pais VARCHAR(3) NOT NULL,
    FOREIGN KEY (st_pais) REFERENCES pais (st_Code) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (st_departamentoid) REFERENCES Departamento (st_departamentoid) ON DELETE NO ACTION ON UPDATE NO ACTION
);
-- Tabla Tipo_Documental
CREATE TABLE IF NOT EXISTS Tipo_Documental (
   st_codigo INT NOT NULL PRIMARY KEY,
   st_descripcion VARCHAR(250) NULL,
   st_nombre VARCHAR(45) NULL
);

-- Tabla Serie
CREATE TABLE IF NOT EXISTS Serie (
  st_codigo INT NOT NULL PRIMARY KEY,
  st_dependencia INT NULL,
  st_descripcion VARCHAR(250) NULL,
  st_idorfeo INT NULL
);

-- Tabla Subserie
CREATE TABLE IF NOT EXISTS Subserie (
   st_codigo INT NOT NULL PRIMARY KEY,
   st_dependencia INT NULL,
   st_descripcion VARCHAR(250) NULL,
   st_idorfeo INT NULL,
   st_nombre VARCHAR(45) NULL,
   st_procedimiento VARCHAR(45) NULL,
   st_serie INT NULL,
   FOREIGN KEY (st_serie) REFERENCES Serie(st_codigo)
);

-- Agregar clave foránea para 'Tipo_Documental'
ALTER TABLE Serie
ADD CONSTRAINT fk_tipo_documental
FOREIGN KEY (st_codigo)
REFERENCES Tipo_Documental(st_codigo);

-- Tabla Usuarios
CREATE TABLE IF NOT EXISTS Usuarios (
    Cedula INT NOT NULL PRIMARY KEY,
    Nombres VARCHAR(250) NULL,
    Correo VARCHAR(250) NULL,
    Dependencia VARCHAR(250) NULL
);
-- Tabla Equipo
CREATE TABLE IF NOT EXISTS Equipo (
    equipoid INT NOT NULL PRIMARY KEY,
    administratorid INT NOT NULL,
    businessunitid INT NOT NULL,
    description VARCHAR(250) NULL,
    name VARCHAR(45) NULL,
    teamtype VARCHAR(45) NULL,
    usuario_cedula INT NULL,
    FOREIGN KEY (usuario_cedula) REFERENCES Usuarios (Cedula) ON DELETE NO ACTION ON UPDATE NO ACTION
);
-- Tabla Actividades
CREATE TABLE IF NOT EXISTS Actividades (
    actualdurationminutes TIME NOT NULL,
    description VARCHAR(250) NULL,
    prioritycode INT NOT NULL PRIMARY KEY,
    regardingobjectid INT NULL,
    scheduledend DATETIME NULL,
    subject VARCHAR(45) NULL,
    equipoid INT NOT NULL,
    FOREIGN KEY (equipoid) REFERENCES Equipo (equipoid) ON DELETE NO ACTION ON UPDATE NO ACTION
);


-- Tabla Contacto
CREATE TABLE IF NOT EXISTS Contacto (
   st_categoria VARCHAR(45) NOT NULL PRIMARY KEY,
   st_ciudad INT NULL,
   st_ciudadano VARCHAR(45) NULL,
   st_departamentoid INT NULL,
   st_numerodeidentificacion2 INT NULL,
   st_pais VARCHAR(45) NULL,
   st_segundoapellido VARCHAR(45) NULL,
   st_tipodeidentificacion VARCHAR(45) NULL,
   st_tipodesolicitante VARCHAR(45) NULL,
   FOREIGN KEY (st_ciudad) REFERENCES Ciudad (st_idciudad) ON DELETE NO ACTION ON UPDATE NO ACTION,
   FOREIGN KEY (st_departamentoid) REFERENCES Departamento (st_departamentoid) ON DELETE NO ACTION ON UPDATE NO ACTION,
   FOREIGN KEY (st_pais) REFERENCES pais (st_Code) ON DELETE NO ACTION ON UPDATE NO ACTION
);
-- Tabla Infractor
CREATE TABLE IF NOT EXISTS Infractor (
  st_categoria VARCHAR(45) NOT NULL PRIMARY KEY,
  st_ciudad INT NULL,
  st_departamentoid INT NULL,
  st_digitodeverificacion INT NULL,
  st_direccion VARCHAR(70) NULL,
  st_fechadeexpedicionlicenciaconduccion DATETIME NULL,
  st_fechadevencimientolicenciaconduccion DATETIME NULL,
  st_cedula INT NULL,
  st_numerodelicenciadeconduccion INT NULL,
  st_primerapellido VARCHAR(45) NULL,
  st_primernombre VARCHAR(45) NULL,
  st_segundoapellido VARCHAR(45) NULL,
  st_segundonombre VARCHAR(45) NULL,
  st_telefonomovil INT NULL,
  st_tipodeidentificacion VARCHAR(45) NULL,
  FOREIGN KEY (st_ciudad) REFERENCES Ciudad (st_idciudad) ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY (st_departamentoid) REFERENCES Departamento (st_departamentoid) ON DELETE NO ACTION ON UPDATE NO ACTION
);
-- Tabla Organismos de transito
CREATE TABLE IF NOT EXISTS Organismos_de_Transito (
  st_codigo INT NOT NULL PRIMARY KEY,
  st_correoelectronico VARCHAR(100) NULL,
  st_nombre VARCHAR(45) NULL,
  st_telefono INT NULL
);
-- Tabla Vigilados
CREATE TABLE IF NOT EXISTS Vigilados (
  st_nitdelaempresa INT NOT NULL PRIMARY KEY,
  name VARCHAR(45) NULL
);
-- Table Seccional
CREATE TABLE IF NOT EXISTS Seccional (
  st_nombre VARCHAR(45) NOT NULL,
  st_seccionalid INT NOT NULL PRIMARY KEY
 );
-- Tabla Caso
CREATE TABLE IF NOT EXISTS Caso (
  st_agentedetransito INT NOT NULL,
  st_autoridadqueinvestiga VARCHAR(45) NULL,
  st_clasedeservicio VARCHAR(45) NULL,
  st_clasedevehiculo VARCHAR(45) NULL,
  customerid VARCHAR(45) NULL,
  st_comentarios VARCHAR(250) NULL,
  st_cualclasedeservicio VARCHAR(45) NULL,
  st_cualclasedevehiculo VARCHAR(45) NULL,
  st_cuallugardeinmovilizacion VARCHAR(45) NULL,
  description VARCHAR(250) NULL,
  st_estadoiuit VARCHAR(45) NULL,
  st_fallo VARCHAR(45) NULL,
  st_fechadeinfraccion DATETIME NULL,
  st_fechalevantamientoiuit DATETIME NULL,
  st_generarradicadoentrada TINYINT NULL,
  st_idsesion INT NULL,
  st_literale TINYINT NULL,
  st_lugardeinmovilizacion VARCHAR(45) NULL,
  st_modalidad VARCHAR(45) NULL,
  st_motor VARCHAR(45) NULL,
  st_nitvigilado INT NULL,
  st_nombrecompletodelagentedetransito VARCHAR(45) NULL,
  st_codigodeinfraccion INT NULL,
  st_numerodelicenciadetransito INT NULL,
  st_numerodemanifiestodecarga INT NULL,
  st_numerodeplacaagente INT NULL,
  st_numeroiuit INT NOT NULL PRIMARY KEY,
  st_numeroonombreviaprincipal VARCHAR(45) NULL,
  st_numeroonombreviasecundaria VARCHAR(45) NULL,
  st_numeroplaca VARCHAR(45) NULL,
  st_tarjetadeoperacion INT NULL,
  st_numerotiquetedebascula INT NULL,
  st_observacionesdelarevision VARCHAR(250) NULL,
  st_organismodetransito INT NULL,
  st_radicado INT NULL,
  st_radicadoorfeo INT NULL,
  st_razonsocial2 VARCHAR(45) NULL,
  st_seccional INT NULL,
  st_seccionalagente INT NULL,
  st_semaforo VARCHAR(45) NULL,
  st_tema VARCHAR(45) NULL,
  st_diassingestion TIME NULL,
  st_tipodenovedad VARCHAR(45) NULL,
  st_tipoviaprincipal VARCHAR(45) NULL,
  st_tipoviasecundaria VARCHAR(45) NULL,
  st_vincula VARCHAR(45) NULL
);

-- Agregar clave foránea para 'Seccional'
ALTER TABLE Caso
ADD CONSTRAINT fk_seccional
FOREIGN KEY (st_seccional)
REFERENCES Seccional(st_seccionalid);

-- Agregar clave foránea para 'Vigilados'
ALTER TABLE Caso
ADD CONSTRAINT fk_vigilados
FOREIGN KEY (st_nitvigilado)
REFERENCES Vigilados(st_nitdelaempresa);

-- Agregar clave foránea para 'Organismos_de_Transito'
ALTER TABLE Caso
ADD CONSTRAINT fk_organismos_transito
FOREIGN KEY (st_organismodetransito)
REFERENCES Organismos_de_Transito(st_codigo);

-- Agregar clave foránea para 'Contacto'
ALTER TABLE Caso
ADD CONSTRAINT fk_contacto
FOREIGN KEY (customerid)
REFERENCES Contacto(st_categoria);

-- Agregar clave foránea para 'Equipo'
ALTER TABLE Caso
ADD FOREIGN KEY (st_agentedetransito) REFERENCES Equipo(equipoid);

-- Agregar clave foránea para 'Tipo_Documental'
ALTER TABLE Caso
ADD FOREIGN KEY (st_codigodeinfraccion) REFERENCES Tipo_Documental(st_codigo);





-- --------------------------------- Insertar datos ---------------------------------------------------------------
-- Insertar 10 registros en la tabla 'pais'
INSERT INTO pais (st_Code, st_Name)
VALUES
    ('COL', 'Colombia'),
    ('VEN', 'Venezuela'),
    ('ECU', 'Ecuador'),
    ('PER', 'Peru'),
    ('ARG', 'Argentina'),
    ('PAN', 'Panama'),
    ('BOL', 'Bolivia'),
    ('MEX', 'Mexico'),
    ('URU', 'Uruguay'),
    ('PAR', 'Paraguay')
;
-- Insertar 10 registros en la tabla 'Departamento'
INSERT INTO Departamento (st_codigo, st_departamentoid, st_name, st_pais)
VALUES
    ('TOL', 1, 'Tolima', 'COL'),
    ('NAR', 2, 'Nariño', 'COL'),
    ('NAR', 3, 'Arauca', 'COL'),
    ('NAR', 4, 'Atlantico', 'COL'),
    ('NAR', 5, 'Bolivar', 'COL'),
    ('NAR', 6, 'Huila', 'COL'),
    ('NAR', 7, 'Choco', 'COL'),
    ('NAR', 8, 'Magdalena', 'COL'),
    ('NAR', 9, 'Meta', 'COL'),
    ('NAR', 10, 'Quindio', 'COL')
;
-- Insertar 10 registros en la tabla 'Ciudad'
INSERT INTO Ciudad (st_idciudad, st_name, st_codigo, st_departamentoid, st_pais)
VALUES
    (1, 'Ibagué', 00001, 1, 'COL'),
    (2, 'Pasto', 00002, 2, 'COL'),
    (3, 'Arauca', 00003, 3, 'COL'),
    (4, 'Barranquilla', 00004, 4, 'COL'),
    (5, 'Cartagena', 00005, 5, 'COL'),
    (6, 'Neiva', 00006, 6, 'COL'),
    (7, 'Qubdó', 00007, 7, 'COL'),
    (8, 'Santa Marta', 00008, 8, 'COL'),
    (9, 'Villavicencio', 00009, 9, 'COL'),
    (10, 'Armenia', 00010, 10, 'COL')
    ;
-- Insertar 10 registros en la tabla 'Tipo_Documental'
INSERT INTO Tipo_Documental (st_codigo, st_descripcion, st_nombre)
VALUES
    (1, 'Descripción 1', 'TipoDocumento1'),
    (2, 'Descripción 2', 'TipoDocumento2'),
    (3, 'Descripción 3', 'TipoDocumento3'),
    (4, 'Descripción 4', 'TipoDocumento4'),
    (5, 'Descripción 5', 'TipoDocumento5'),
    (6, 'Descripción 6', 'TipoDocumento6'),
    (7, 'Descripción 7', 'TipoDocumento7'),
    (8, 'Descripción 8', 'TipoDocumento8'),
    (9, 'Descripción 9', 'TipoDocumento9'),
    (10, 'Descripción 10', 'TipoDocumento10');
-- Insertar 10 registros en la tabla 'Serie'
INSERT INTO Serie (st_codigo, st_dependencia, st_descripcion, st_idorfeo)
VALUES
    (1, 100, 'Descripción Serie 1', 101),
    (2, 200, 'Descripción Serie 2', 201),
    (3, 300, 'Descripción Serie 3', 301),
    (4, 400, 'Descripción Serie 4', 401),
    (5, 500, 'Descripción Serie 5', 501),
    (6, 600, 'Descripción Serie 6', 601),
    (7, 700, 'Descripción Serie 7', 701),
    (8, 800, 'Descripción Serie 8', 801),
    (9, 900, 'Descripción Serie 9', 901),
    (10, 1000, 'Descripción Serie 10', 1001);
-- Insertar 10 registros en la tabla 'Subserie'
INSERT INTO Subserie (st_codigo, st_dependencia, st_descripcion, st_idorfeo, st_nombre, st_procedimiento, st_serie)
VALUES
    (1, 10, 'Descripción Subserie 1', 11, 'Nombre Subserie 1', 'Procedimiento 1', 1),
    (2, 20, 'Descripción Subserie 2', 21, 'Nombre Subserie 2', 'Procedimiento 2', 2),
    (3, 30, 'Descripción Subserie 3', 31, 'Nombre Subserie 3', 'Procedimiento 3', 3),
    (4, 40, 'Descripción Subserie 4', 41, 'Nombre Subserie 4', 'Procedimiento 4', 4),
    (5, 50, 'Descripción Subserie 5', 51, 'Nombre Subserie 5', 'Procedimiento 5', 5),
    (6, 60, 'Descripción Subserie 6', 61, 'Nombre Subserie 6', 'Procedimiento 6', 6),
    (7, 70, 'Descripción Subserie 7', 71, 'Nombre Subserie 7', 'Procedimiento 7', 7),
    (8, 80, 'Descripción Subserie 8', 81, 'Nombre Subserie 8', 'Procedimiento 8', 8),
    (9, 90, 'Descripción Subserie 9', 91, 'Nombre Subserie 9', 'Procedimiento 9', 9),
    (10, 100, 'Descripción Subserie 10', 101, 'Nombre Subserie 10', 'Procedimiento 10', 10);
-- Insertar 10 registros en la tabla 'Usuarios'
INSERT INTO Usuarios (Cedula, Nombres, Correo, Dependencia)
VALUES
    (123456, 'Juan Pérez', 'juan@example.com', 'Departamento A'),
    (234567, 'María López', 'maria@example.com', 'Departamento B'),
    (345678, 'Carlos Rodríguez', 'carlos@example.com', 'Departamento C'),
    (456789, 'Ana Martínez', 'ana@example.com', 'Departamento D'),
    (567890, 'Pedro Sánchez', 'pedro@example.com', 'Departamento E'),
    (678901, 'Laura Gómez', 'laura@example.com', 'Departamento F'),
    (789012, 'Diego Torres', 'diego@example.com', 'Departamento G'),
    (890123, 'Sofía Ramírez', 'sofia@example.com', 'Departamento H'),
    (901234, 'Andrés Castro', 'andres@example.com', 'Departamento I'),
    (1023456, 'Valentina Ruiz', 'valentina@example.com', 'Departamento J');
    
-- Insertar 10 registros en la tabla 'Equipo'
INSERT INTO Equipo (equipoid, administratorid, businessunitid, description, name, teamtype, usuario_cedula)
VALUES
    (1, 1001, 2001, 'Equipo de Desarrollo', 'Equipo1', 'Desarrollo', 123456),
    (2, 1002, 2002, 'Equipo de Marketing', 'Equipo2', 'Marketing', 234567),
    (3, 1003, 2003, 'Equipo de Ventas', 'Equipo3', 'Ventas', 345678),
    (4, 1004, 2004, 'Equipo de Soporte', 'Equipo4', 'Soporte', 456789),
    (5, 1005, 2005, 'Equipo de Diseño', 'Equipo5', 'Diseño', 567890),
    (6, 1006, 2006, 'Equipo de Finanzas', 'Equipo6', 'Finanzas', 678901),
    (7, 1007, 2007, 'Equipo de Recursos Humanos', 'Equipo7', 'RRHH', 789012),
    (8, 1008, 2008, 'Equipo de Logística', 'Equipo8', 'Logística', 890123),
    (9, 1009, 2009, 'Equipo de Calidad', 'Equipo9', 'Calidad', 901234),
    (10, 1010, 2010, 'Equipo de Producción', 'Equipo10', 'Producción', 1023456);
-- Insertar 10 registros en la tabla 'Actividades'
INSERT INTO Actividades (actualdurationminutes, description, prioritycode, regardingobjectid, scheduledend, subject, equipoid)
VALUES
    ('01:30:00', 'Dar respuesta a IUIT', 1, NULL, '2024-06-10 15:00:00', 'Infracción XXXX', 1),
    ('02:00:00', 'Tanslado de IUIT', 2, NULL, '2024-06-12 10:30:00', 'Infracción XXXX', 2),
    ('01:15:00', 'Archivo de IUIT', 3, NULL, '2024-06-14 14:45:00', 'Infracción XXXX', 3),
    ('00:45:00', 'Archivo de IUIT', 4, NULL, '2024-06-16 11:15:00', 'Infracción XXXX', 4),
    ('01:00:00', 'Tanslado de IUIT', 5, NULL, '2024-06-18 09:00:00', 'Infracción XXXX', 5),
    ('01:30:00', 'Firma de Jefe', 6, NULL, '2024-06-20 16:30:00', 'Infracción XXXX', 6),
    ('01:15:00', 'Firma de Jefe', 7, NULL, '2024-06-22 13:45:00', 'Infracción XXXX', 7),
    ('02:30:00', 'Firma de Jefe', 8, NULL, '2024-06-24 14:00:00', 'Infracción XXXX', 8),
    ('01:00:00', 'Tanslado de IUIT', 9, NULL, '2024-06-26 10:00:00', 'Infracción XXXX', 9),
    ('01:45:00', 'Tanslado de IUIT', 10, NULL, '2024-06-28 12:30:00', 'Infracción XXXX', 10);
    
    
-- Insertar 10 registros en la tabla 'Contacto'
INSERT INTO Contacto (st_categoria, st_ciudad, st_ciudadano, st_departamentoid, st_numerodeidentificacion2, st_pais, st_segundoapellido, st_tipodeidentificacion, st_tipodesolicitante)
VALUES
    ('Categoria1', 1, 'Ciudadano1', 10, 123456789, 'COL', 'SegundoApellido1', 'Tipo1', 'Solicitante1'),
    ('Categoria2', 2, 'Ciudadano2', 3, 987654321, 'COL', 'SegundoApellido2', 'Tipo2', 'Solicitante2'),
    ('Categoria3', 2, 'Ciudadano2', 4, 987654321, 'COL', 'SegundoApellido2', 'Tipo2', 'Solicitante2'),
    ('Categoria4', 2, 'Ciudadano2', 3, 987654321, 'COL', 'SegundoApellido2', 'Tipo2', 'Solicitante2'),
    ('Categoria5', 2, 'Ciudadano2', 4, 987654321, 'COL', 'SegundoApellido2', 'Tipo2', 'Solicitante2'),
    ('Categoria6', 2, 'Ciudadano2', 3, 987654321, 'COL', 'SegundoApellido2', 'Tipo2', 'Solicitante2'),
    ('Categoria7', 2, 'Ciudadano2', 4, 987654321, 'COL', 'SegundoApellido2', 'Tipo2', 'Solicitante2'),
    ('Categoria8', 2, 'Ciudadano2', 3, 987654321, 'COL', 'SegundoApellido2', 'Tipo2', 'Solicitante2'),
    ('Categoria9', 2, 'Ciudadano2', 5, 987654321, 'COL', 'SegundoApellido2', 'Tipo2', 'Solicitante2'),
    ('Categoria10', 10, 'Ciudadano10', 4, 555555555, 'COL', 'SegundoApellido10', 'Tipo10', 'Solicitante10');
    
-- Insertar registros en la tabla 'Infractor'
INSERT INTO Infractor (st_categoria, st_ciudad, st_departamentoid, st_digitodeverificacion, st_direccion,
                      st_fechadeexpedicionlicenciaconduccion, st_fechadevencimientolicenciaconduccion,
                      st_cedula, st_numerodelicenciadeconduccion, st_primerapellido, st_primernombre,
                      st_segundoapellido, st_segundonombre, st_telefonomovil, st_tipodeidentificacion)
VALUES
    ('Categoria1', 1, 10, 123, 'Calle 123', '2022-01-01', '2023-01-01', 123456, 7890, 'Apellido1', 'Nombre1',
     'Apellido2', 'Nombre2', 1234567890, 'Tipo1'),
    ('Categoria2', 2, 4, 123, 'Calle 123', '2022-10-10', '2023-10-10', 123456, 7890, 'Apellido19', 'Nombre19',
     'Apellido20', 'Nombre20', 1234567890, 'Tipo10'),
    ('Categoria3', 10, 5, 123, 'Calle 123', '2022-12-31', '2023-12-31', 123456, 7890, 'Apellido28', 'Nombre28',
     'Apellido29', 'Nombre29', 1234567890, 'Tipo20');

-- Insertar 10 registros en la tabla 'Organismos_de_Transito'
INSERT INTO Organismos_de_Transito (st_codigo, st_correoelectronico, st_nombre, st_telefono)
VALUES
    (1, 'correo1@example.com', 'Organismo1', 1435435),
    (2, 'correo2@example.com', 'Organismo2', 9876543),
    (3, 'correo3@example.com', 'Organismo3', 9876543),
    (4, 'correo4@example.com', 'Organismo4', 9876543),
    (5, 'correo5@example.com', 'Organismo5', 9876543),
    (6, 'correo6@example.com', 'Organismo6', 9876543),
    (7, 'correo7@example.com', 'Organismo7', 9876543),
    (8, 'correo8@example.com', 'Organismo8', 9876543),
    (9, 'correo9@example.com', 'Organismo9', 9876543),
    (10, 'correo10@example.com', 'Organismo10', 5555555);


-- Insertar 10 registros en la tabla 'Vigilados'
INSERT INTO Vigilados (st_nitdelaempresa, name)
VALUES
    (1001, 'Empresa1'),
    (1002, 'Empresa2'),
    (1003, 'Empresa3'),
    (1004, 'Empresa4'),
    (1005, 'Empresa5'),
    (1006, 'Empresa6'),
    (1007, 'Empresa7'),
    (1008, 'Empresa8'),
    (1009, 'Empresa9'),
    (1010, 'Empresa10');

-- Insertar 10 registros en la tabla 'Seccional'
INSERT INTO Seccional (st_nombre, st_seccionalid)
VALUES
    ('Seccional1', 1),
    ('Seccional2', 2),
    ('Seccional3', 3),
    ('Seccional4', 4),
    ('Seccional5', 5),
    ('Seccional6', 6),
    ('Seccional7', 7),
    ('Seccional8', 8),
    ('Seccional9', 9),
    ('Seccional10', 10);
-- Insertar 10 registros de ejemplo en la tabla "Caso"
INSERT INTO Caso (st_agentedetransito, st_numeroiuit, st_autoridadqueinvestiga, st_clasedeservicio, st_clasedevehiculo,  st_estadoiuit, st_numeroplaca, st_radicado)
VALUES
  (1,01, 'Investigador 1', 'Especial', 'taxi', 'Archivado', 'EJ81C', 2024765634),
  (1,02, 'Investigador 1', 'Especial', 'Autobús', 'Apertura', 'WJJ81C', 202476244),
  (1,03, 'Investigador 1', 'Especial', 'Camión', 'Archivado', 'EJJ81C', 202472634),
  (2,04, 'Investigador 2', 'Intermunicipal', 'Camión', 'Apertura', 'TJJ82C', 202473544),
  (1,05, 'Investigador 1', 'Especial', 'taxi', 'Archivado', 'UJJ84C', 202453987),
  (1,06, 'Investigador 1', 'Intermunicipal', 'Autobús', 'Apertura', 'OJJ86C', 202478978),
  (2,07, 'Investigador 2', 'Especial', 'taxi', 'Archivado', 'PJJ87C', 202408686),
  (1,08, 'Investigador 1', 'Intermunicipal', 'Autobús', 'Apertura', 'SJJ88C', 202458564),
  (1,09, 'Investigador 2', 'Especial', 'Camión', 'Archivado', 'TJJ89C', 202425456),
  (1,10, 'Investigador 1', 'Intermunicipal', 'Autobús', 'Apertura', 'GJJ80C', 202468967)
;











-- crear tabla log_casos_eliminados ------------------------------------------------

CREATE TABLE log_casos_eliminados (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  st_agentedetransito INT NOT NULL,
  st_autoridadqueinvestiga VARCHAR(45) NULL,
  st_clasedeservicio VARCHAR(45) NULL,
  st_clasedevehiculo VARCHAR(45) NULL,
  customerid VARCHAR(45) NULL,
  st_comentarios VARCHAR(250) NULL,
  st_cualclasedeservicio VARCHAR(45) NULL,
  st_cualclasedevehiculo VARCHAR(45) NULL,
  st_cuallugardeinmovilizacion VARCHAR(45) NULL,
  description VARCHAR(250) NULL,
  st_estadoiuit VARCHAR(45) NULL,
  st_fallo VARCHAR(45) NULL,
  st_fechadeinfraccion DATETIME NULL,
  st_fechalevantamientoiuit DATETIME NULL,
  st_generarradicadoentrada TINYINT NULL,
  st_idsesion INT NULL,
  st_literale TINYINT NULL,
  st_lugardeinmovilizacion VARCHAR(45) NULL,
  st_modalidad VARCHAR(45) NULL,
  st_motor VARCHAR(45) NULL,
  st_nitvigilado INT NULL,
  st_nombrecompletodelagentedetransito VARCHAR(45) NULL,
  st_codigodeinfraccion INT NULL,
  st_numerodelicenciadetransito INT NULL,
  st_numerodemanifiestodecarga INT NULL,
  st_numerodeplacaagente INT NULL,
  st_numeroiuit INT NOT NULL,
  st_numeroonombreviaprincipal VARCHAR(45) NULL,
  st_numeroonombreviasecundaria VARCHAR(45) NULL,
  st_numeroplaca VARCHAR(45) NULL,
  st_tarjetadeoperacion INT NULL,
  st_numerotiquetedebascula INT NULL,
  st_observacionesdelarevision VARCHAR(250) NULL,
  st_organismodetransito INT NULL,
  st_radicado INT NULL,
  st_radicadoorfeo INT NULL,
  st_razonsocial2 VARCHAR(45) NULL,
  st_seccional INT NULL,
  st_seccionalagente INT NULL,
  st_semaforo VARCHAR(45) NULL,
  st_tema VARCHAR(45) NULL,
  st_diassingestion TIME NULL,
  st_tipodenovedad VARCHAR(45) NULL,
  st_tipoviaprincipal VARCHAR(45) NULL,
  st_tipoviasecundaria VARCHAR(45) NULL,
  st_vincula VARCHAR(45) NULL
);

-- Trigger guardar datos de los casos eliminados --------------------------------------------

-- Crear un disparador que se ejecuta antes de la operación DELETE en la tabla "Caso"
DELIMITER //
CREATE TRIGGER trg_log_deleted_casos
BEFORE DELETE ON Caso
FOR EACH ROW
BEGIN
    INSERT INTO log_casos_eliminados (
        st_agentedetransito, st_autoridadqueinvestiga, st_clasedeservicio, st_clasedevehiculo,
        customerid, st_comentarios, st_cualclasedeservicio, st_cualclasedevehiculo,
        st_cuallugardeinmovilizacion, description, st_estadoiuit, st_fallo, st_fechadeinfraccion,
        st_fechalevantamientoiuit, st_generarradicadoentrada, st_idsesion, st_literale,
        st_lugardeinmovilizacion, st_modalidad, st_motor, st_nitvigilado,
        st_nombrecompletodelagentedetransito, st_codigodeinfraccion,
        st_numerodelicenciadetransito, st_numerodemanifiestodecarga, st_numerodeplacaagente,
        st_numeroiuit, st_numeroonombreviaprincipal, st_numeroonombreviasecundaria,
        st_numeroplaca, st_tarjetadeoperacion, st_numerotiquetedebascula,
        st_observacionesdelarevision, st_organismodetransito, st_radicado, st_radicadoorfeo,
        st_razonsocial2, st_seccional, st_seccionalagente, st_semaforo, st_tema,
        st_diassingestion, st_tipodenovedad, st_tipoviaprincipal, st_tipoviasecundaria, st_vincula
    )
    VALUES (
        OLD.st_agentedetransito, OLD.st_autoridadqueinvestiga, OLD.st_clasedeservicio, OLD.st_clasedevehiculo,
        OLD.customerid, OLD.st_comentarios, OLD.st_cualclasedeservicio, OLD.st_cualclasedevehiculo,
        OLD.st_cuallugardeinmovilizacion, OLD.description, OLD.st_estadoiuit, OLD.st_fallo, OLD.st_fechadeinfraccion,
        OLD.st_fechalevantamientoiuit, OLD.st_generarradicadoentrada, OLD.st_idsesion, OLD.st_literale,
        OLD.st_lugardeinmovilizacion, OLD.st_modalidad, OLD.st_motor, OLD.st_nitvigilado,
        OLD.st_nombrecompletodelagentedetransito, OLD.st_codigodeinfraccion,
        OLD.st_numerodelicenciadetransito, OLD.st_numerodemanifiestodecarga, OLD.st_numerodeplacaagente,
        OLD.st_numeroiuit, OLD.st_numeroonombreviaprincipal, OLD.st_numeroonombreviasecundaria,
        OLD.st_numeroplaca, OLD.st_tarjetadeoperacion, OLD.st_numerotiquetedebascula,
        OLD.st_observacionesdelarevision, OLD.st_organismodetransito, OLD.st_radicado, OLD.st_radicadoorfeo,
        OLD.st_razonsocial2, OLD.st_seccional, OLD.st_seccionalagente, OLD.st_semaforo, OLD.st_tema,
        OLD.st_diassingestion, OLD.st_tipodenovedad, OLD.st_tipoviaprincipal, OLD.st_tipoviasecundaria, OLD.st_vincula
    );
END;
//
DELIMITER ;


-- Prueba Trigger -------------
-- SELECT * FROM Caso;
-- DELETE FROM Caso WHERE st_numeroiuit = 2;
-- SELECT * FROM log_casos_eliminados;





-- -------------------------  roles sobre la base de datos ------------------------------------

-- Crear roles
CREATE ROLE 'dev_all', 'dev_read', 'dev_write';

-- Otorgar todos los privilegios al rol dev_all sobre la base de datos 'uanlab'
GRANT ALL PRIVILEGES ON db_iuit.* TO 'dev_all';

-- Otorgar el privilegio SELECT al rol dev_read sobre la base de datos 'uanlab'
GRANT SELECT ON db_iuit.* TO 'dev_read';

-- Otorgar los privilegios INSERT, UPDATE y DELETE al rol dev_write sobre la base de datos 'uanlab'
GRANT INSERT, UPDATE, DELETE ON db_iuit.* TO 'dev_write';

flush privileges;

-- Crear usuarios
CREATE USER 'luis'@'localhost' IDENTIFIED BY '12345';
CREATE USER 'samanta'@'localhost' IDENTIFIED BY '12345';
CREATE USER 'cristian'@'localhost' IDENTIFIED BY '12345';



-- Asignar el rol dev_all al usuario corey
GRANT 'dev_all' TO 'luis'@'localhost';
flush privileges;

-- Asignar el rol dev_read al usuario will
GRANT 'dev_read' TO 'samanta'@'localhost';
flush privileges;

-- Asignar los roles dev_write y dev_read al usuario aaron
GRANT 'dev_write', 'dev_read' TO 'cristian'@'localhost';
flush privileges;

set default role all to 'luis'@'localhost';
set default role all to 'samanta'@'localhost';
set default role all to 'cristian'@'localhost';









