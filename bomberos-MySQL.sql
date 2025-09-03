DROP DATABASE IF EXISTS bomberos;
CREATE DATABASE bomberos CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE bomberos;

-- Tabla estacion
CREATE TABLE estacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(3),
    estado TINYINT(1)
) ENGINE=InnoDB;

-- Tabla fuente
CREATE TABLE fuente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(30),
    estado TINYINT(1)
) ENGINE=InnoDB;

-- Tabla incidente
CREATE TABLE incidente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(50),
    estado TINYINT(1)
) ENGINE=InnoDB;

-- Tabla maquina
CREATE TABLE maquina (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(10),
    estado TINYINT(1)
) ENGINE=InnoDB;

-- Tabla rango
CREATE TABLE rango (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(20),
    estado TINYINT(1)
) ENGINE=InnoDB;

-- Tabla tipo_Documento
CREATE TABLE tipo_Documento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(5),
    estado TINYINT(1)
) ENGINE=InnoDB;

-- Tabla personal
CREATE TABLE personal (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_Rango INT,
    Nombre VARCHAR(30),
    Apellido1 VARCHAR(30),
    Apellido2 VARCHAR(30),
    id_Tipo_Documento INT,
    numero_Documento INT,
    direccion VARCHAR(60),
    correo VARCHAR(50),
    telefono VARCHAR(15),
    fecha_Nacimiento DATE,
    fecha_Ingreso DATE,
    CONSTRAINT FK_personal_rango FOREIGN KEY (id_Rango) REFERENCES rango(id),
    CONSTRAINT FK_personal_tipo_Documento FOREIGN KEY (id_Tipo_Documento) REFERENCES tipo_Documento(id)
) ENGINE=InnoDB;

-- Tabla personal_Atendio
CREATE TABLE personal_Atendio (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_Estacion INT,
    id_Estacion_Apoyo INT,
    id_Maquina INT,
    id_Maquina_Apoyo INT,
    total_Unidades INT,
    id_Maquinista INT,
    id_CI INT,
    id_Tripulante1 INT,
    id_Tripulante2 INT,
    id_Tripulante3 INT,
    id_Teleoperador INT,
    CONSTRAINT FK_personal_Atendio_estacion FOREIGN KEY (id_Estacion) REFERENCES estacion(id),
    CONSTRAINT FK_personal_Atendio_estacionApoyo FOREIGN KEY (id_Estacion_Apoyo) REFERENCES estacion(id),
    CONSTRAINT FK_personal_Atendio_maquina FOREIGN KEY (id_Maquina) REFERENCES maquina(id),
    CONSTRAINT FK_personal_Atendio_maquinaApoyo FOREIGN KEY (id_Maquina_Apoyo) REFERENCES maquina(id),
    CONSTRAINT FK_personal_Atendio_Maquinista FOREIGN KEY (id_Maquinista) REFERENCES personal(id),
    CONSTRAINT FK_personal_Atendio_personal FOREIGN KEY (id_CI) REFERENCES personal(id),
    CONSTRAINT FK_personal_Atendio_T1 FOREIGN KEY (id_Tripulante1) REFERENCES personal(id),
    CONSTRAINT FK_personal_Atendio_T2 FOREIGN KEY (id_Tripulante2) REFERENCES personal(id),
    CONSTRAINT FK_personal_Atendio_T3 FOREIGN KEY (id_Tripulante3) REFERENCES personal(id),
    CONSTRAINT FK_personal_Atendio_Teleoperador FOREIGN KEY (id_Teleoperador) REFERENCES personal(id)
) ENGINE=InnoDB;

-- Tabla reportante
CREATE TABLE reportante (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_Fuente INT,
    telefono_Reporta INT,
    CONSTRAINT FK_reportante_fuente FOREIGN KEY (id_Fuente) REFERENCES fuente(id)
) ENGINE=InnoDB;

-- Tabla tipologia
CREATE TABLE tipologia (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(20),
    estado TINYINT(1)
) ENGINE=InnoDB;

-- Tabla Emergencia
CREATE TABLE Emergencia (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE,
    hora_Llamada TIME,
    hora_Salida TIME,
    hora_Sitio TIME,
    hora_Retorno TIME,
    id_Tipologia INT,
    id_Incidente INT,
    barrio VARCHAR(30),
    direccion VARCHAR(50),
    pos_Causa VARCHAR(30),
    num_Victimas INT,
    afectaciones_Materiales VARCHAR(100),
    descripcion_Emergencia VARCHAR(250),
    afectaciones_m2 INT,
    id_Personal_Atendio INT,
    id_Reportante INT,
    CONSTRAINT FK_Emergencia_incidente FOREIGN KEY (id_Incidente) REFERENCES incidente(id),
    CONSTRAINT FK_Emergencia_tipologia FOREIGN KEY (id_Tipologia) REFERENCES tipologia(id),
    CONSTRAINT FK_Emergencia_personal_Atendio FOREIGN KEY (id_Personal_Atendio) REFERENCES personal_Atendio(id),
    CONSTRAINT FK_Emergencia_reportante FOREIGN KEY (id_Reportante) REFERENCES reportante(id)
) ENGINE=InnoDB;

-- Inserts: estacion
INSERT INTO estacion (id, descripcion, estado) VALUES
(1, 'X-1', 1),
(2, 'X-2', 1),
(3, 'X-3', 1),
(4, 'X-4', 1),
(5, 'X-5', 1);

-- Inserts: fuente
INSERT INTO fuente (id, descripcion, estado) VALUES
(1, 'Policia', 1),
(2, 'Defensa Civil', 1),
(3, 'Ejercito', 1),
(4, 'Cruz Roja', 1),
(5, 'Bomberos', 1),
(6, 'Comunidad', 1),
(7, 'Otro', 1);

-- Inserts: incidente (ejemplo, parcial)
INSERT INTO incidente (id, descripcion, estado) VALUES
(1, 'INC. ELECTRICO', 1),
(2, 'INC. ESTRUCTURAL', 1),
(3, 'INC. COB. VEGETAL', 1),
(4, 'INC. VEHICULAR', 1),
(5, 'QUEMA DE RESIDUOS', 1),
(6, 'LIQ. INFLAMABLE/COMBUSTIBLE', 1),
(7, 'CORROSIVO', 1),
(8, 'EXPLOSIVO', 1),
(9, 'GAS (INFL, TOXICO Y NO TOXICO)', 1),
(10, 'MISCELANEO', 1),
(11, 'OXIDANTE/PEROXIDO', 1),
(12, 'RADIOACTIVO', 1),
(13, 'SOLIDO INFLAMABLE', 1),
(14, 'TOXICO/INFECCIOSO', 1),
(15, 'B. R. EN CAMPO ABIERTO', 1),
(16, 'B. Y RECUP. DE CADAVER', 1),
(17, 'RESC. ACUATICO', 1),
(18, 'RESC. ANIMAL', 1),
(19, 'RESC. EN ASCENSOR', 1),
(20, 'RESC. ESP. CONFINADOS', 1),
(21, 'RESC. ESTR. COLAPSADA', 1),
(22, 'RESC. EN ZANJA', 1),
(23, 'RESC. MINERO', 1),
(24, 'RESC. VEHICULAR/EXTRICACIÓN', 1),
(25, 'RESC. VERTICAL', 1),
(26, 'VOLCAMIENTO', 1),
(27, 'OTROS RESCATES', 1),
(28, 'FALSA ALARMA', 1),
(29, 'DESPLAZ. SIN INTERVENCION', 1),
(30, 'ABASTECIMIENTO AGUA', 1),
(31, 'ACCIDENTE TRANSITO', 1),
(32, 'APH BASE', 1),
(33, 'CAIDA/CORTE DE ARBOL', 1),
(34, 'COLAPSOS', 1),
(35, 'CONTROL ABEJAS', 1),
(36, 'DESLIZAMIENTOS', 1),
(37, 'EVENTOS', 1),
(38, 'INUNDACIONES', 1),
(39, 'LAVADOS', 1),
(40, 'SERVICIOS/APOYO ENTIDADES', 1),
(41, 'SISMO', 1),
(42, 'OTROS NO MISIONALES', 1),
(43, 'TRASLADO PACIENTES', 1);

-- Inserts: maquina
INSERT INTO maquina (id, descripcion, estado) VALUES
(1, 'M-1', 1),
(2, 'M-2', 1),
(3, 'M-3', 1),
(4, 'M-4', 1),
(5, 'M-5', 1),
(6, 'M-6', 1),
(7, 'M-7', 1),
(8, 'M-8', 1),
(9, 'M-9', 1),
(10, 'M-10', 1);

-- Inserts: rango
INSERT INTO rango (id, descripcion, estado) VALUES
(1, 'Aspirante', 1),
(2, 'Bombero', 1),
(3, 'Cabo', 1),
(4, 'Sargento', 1),
(5, 'Sub-teniente', 1),
(6, 'Teniente', 1),
(7, 'Capitán', 1);

-- Inserts: tipo_Documento
INSERT INTO tipo_Documento (id, descripcion, estado) VALUES
(6, 'CC', 1),
(7, 'CE', 1),
(8, 'TI', 1),
(9, 'PA', 1),
(10, 'RC', 1);

-- Inserts: tipologia
INSERT INTO tipologia (id, descripcion, estado) VALUES
(1, 'Incendios', 1),
(2, 'Rescates', 1),
(3, 'Mat-Pel', 1),
(4, 'Otros', 1),
(5, 'No misionales', 1);

-- Inserts: personal (ejemplo parcial)
INSERT INTO personal (id, id_Rango, Nombre, Apellido1, Apellido2, id_Tipo_Documento, numero_Documento, direccion, correo, telefono, fecha_Nacimiento, fecha_Ingreso) VALUES
(3, 1, 'Francisco', 'Ruiz', 'Miranda', 6, 43232365, 'Cra 54 # 23-16 Corazón de Jesus', 'f.ruiz@email.com', '3001124141', '1949-03-15', '1967-12-25'),
(4, 7, 'Charles', 'Benavides', 'Tonguino', 6, 65654233, 'Cra 76 # 23-22 Villa Nueva', 'c.benavides@email.com', '3001123434', '1969-03-19', '1989-02-17'),
(5, 6, 'Francisco', 'Ruiz', 'Benavides', 6, 54234111, 'Cll 6 # 23-2 Santamaria', 'f.r.benavides@email.com', '3004443231', '1979-05-09', '2000-02-07'),
(6, 6, 'Carlos', 'Vallejo', 'Ludemberg', 6, 93902421, 'Cra 6 # 33-22 Betania', 'c.vallejo@email.com', '3111123434', '1985-03-19', '2001-03-17'),
(7, 5, 'Camila', 'Zapata', 'Ruiz', 6, 98982322, 'Cra 98 # 3-2 Lorenzo', 'c.zapata@email.com', '3011123487', '1990-03-15', '2002-04-17'),
(8, 4, 'John', 'Ortega', 'Balvuena', 6, 341465399, 'Cra 45 # 23-22 Centro', 'j.ortega@email.com', '3021123474', '1993-03-19', '2003-04-17'),
(9, 3, 'Camilo', 'Varona', 'Zapata', 6, 540930002, 'Cll 76 # 9-22 Chapultepec', 'c.varona@email.com', '3101129834', '1994-03-19', '2005-02-17'),
(10, 2, 'Sara', 'Martinez', 'Vasquez', 6, 323060032, 'Cra 79 # 5-52 Calazans', 's.martinez@email.com', '3201124434', '1995-03-19', '2006-02-17'),
(11, 2, 'Diego', 'Vallejos', 'Stauffemberg', 6, 108534432, 'Cll 6 # 3-522 Cerrito', 'd.vallejos@email.com', '3011993434', '1996-03-19', '2007-02-17'),
(12, 2, 'Sergio', 'Cortezano', 'Torres', 6, 541211102, 'Cll 66 # 93-22 La Gloria', 's.cortezano@email.com', '3011553434', '1997-03-19', '2008-02-17'),
(13, 1, 'Esteban', 'Torres', 'Garcés', 7, 108523211, 'Cll 86 # 87-52 Centro', 'e.torres@email.com', '3001123999', '1999-03-19', '2024-12-17');
