-- Generado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   en:        2024-06-26 19:35:16 COT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE cantones (
    "codigo_canton "             INTEGER NOT NULL,
    "nombre_canton "             VARCHAR(50) NOT NULL,
    proviencias_codigo_provincia INTEGER NOT NULL
);

ALTER TABLE cantones ADD CONSTRAINT cantones_pk PRIMARY KEY ( "codigo_canton " );

CREATE TABLE circuitos (
    "codigo_circuito "           VARCHAR(20) NOT NULL,
    "nombre_circuito "           VARCHAR(50),
    "Distritos_codigo_distrito " VARCHAR(10) NOT NULL
);

ALTER TABLE circuitos ADD CONSTRAINT circuitos_pk PRIMARY KEY ( "codigo_circuito " );

CREATE TABLE detenciones (
    id_detencion                  INTEGER NOT NULL,
    fecha_detencion_aprehension   DATE NOT NULL,
    presunta_subinfraccion        VARCHAR(500) NOT NULL,
    "presunta_flagrancia  "       CHAR(2) NOT NULL,
    "hora_detencion_aprehension " DATE,
    "presunta_modalidad "         VARCHAR(500),
    "presunta_infraccion "        VARCHAR(300),
    "lugar "                      VARCHAR(50),
    "tipo_lugar "                 VARCHAR(100),
    "movilizacion "               VARCHAR(50),
    "tipo_arma "                  VARCHAR(50),
    arma                          VARCHAR(30),
    personas_id_personas          INTEGER NOT NULL,
    "Cantones_codigo_canton "     INTEGER NOT NULL,
    zonas_codigozonal             VARCHAR(20) NOT NULL
);

ALTER TABLE detenciones ADD CONSTRAINT detenciones_pk PRIMARY KEY ( id_detencion );

CREATE TABLE distritos (
    "codigo_distrito "             VARCHAR(10) NOT NULL,
    "nombre_distrito "             VARCHAR(50),
    "Parroquias_codigo_parroquia " INTEGER NOT NULL
);

ALTER TABLE distritos ADD CONSTRAINT distritos_pk PRIMARY KEY ( "codigo_distrito " );

CREATE TABLE parroquias (
    "codigo_parroquia "       INTEGER NOT NULL,
    "nombre_parroquia "       VARCHAR(50),
    "Cantones_codigo_canton " INTEGER NOT NULL
);

ALTER TABLE parroquias ADD CONSTRAINT parroquias_pk PRIMARY KEY ( "codigo_parroquia " );

CREATE TABLE personas (
    id_personas               INTEGER NOT NULL,
    tipo                      VARCHAR(20),
    edad                      INTEGER NOT NULL,
    sexo                      CHAR(1) NOT NULL,
    nacionalidad              VARCHAR(50) NOT NULL,
    autoidentificacion_etnica VARCHAR(100),
    numero_detenciones        INTEGER,
    estado_civil              VARCHAR(50),
    estatus_migratorio        unknown 
--  ERROR: Datatype UNKNOWN is not allowed 
    ,
    nivel_de_instruccion      VARCHAR(100),
    condicion                 VARCHAR(300)
);

ALTER TABLE personas ADD CONSTRAINT personas_pk PRIMARY KEY ( id_personas );

CREATE TABLE proviencias (
    codigo_provincia  INTEGER NOT NULL,
    nombre_proviencia VARCHAR(50)
);

ALTER TABLE proviencias ADD CONSTRAINT proviencias_pk PRIMARY KEY ( codigo_provincia );

CREATE TABLE subcircuitos (
    "codigo_subcircuito "        VARCHAR(15) NOT NULL,
    "nombre_subcircuito "        VARCHAR(50),
    "Circuitos_codigo_circuito " VARCHAR(20) NOT NULL,
    tipo                         CHAR(1) NOT NULL,
    infraestructura              VARCHAR(10) NOT NULL,
    clase                        VARCHAR(10) NOT NULL,
    intervencion                 CHAR(3) NOT NULL
);

ALTER TABLE subcircuitos ADD CONSTRAINT subcircuitos_pk PRIMARY KEY ( "codigo_subcircuito " );

CREATE TABLE zonas (
    codigozonal       VARCHAR(20) NOT NULL,
    "nombre_zona "    VARCHAR(20) NOT NULL,
    "nombre_subzona " VARCHAR(50) NOT NULL
);

ALTER TABLE zonas ADD CONSTRAINT zonas_pk PRIMARY KEY ( codigozonal );

ALTER TABLE cantones
    ADD CONSTRAINT cantones_proviencias_fk FOREIGN KEY ( proviencias_codigo_provincia )
        REFERENCES proviencias ( codigo_provincia );

ALTER TABLE circuitos
    ADD CONSTRAINT circuitos_distritos_fk FOREIGN KEY ( "Distritos_codigo_distrito " )
        REFERENCES distritos ( "codigo_distrito " );

ALTER TABLE detenciones
    ADD CONSTRAINT detenciones_cantones_fk FOREIGN KEY ( "Cantones_codigo_canton " )
        REFERENCES cantones ( "codigo_canton " );

ALTER TABLE detenciones
    ADD CONSTRAINT detenciones_personas_fk FOREIGN KEY ( personas_id_personas )
        REFERENCES personas ( id_personas );

ALTER TABLE detenciones
    ADD CONSTRAINT detenciones_zonas_fk FOREIGN KEY ( zonas_codigozonal )
        REFERENCES zonas ( codigozonal );

ALTER TABLE distritos
    ADD CONSTRAINT distritos_parroquias_fk FOREIGN KEY ( "Parroquias_codigo_parroquia " )
        REFERENCES parroquias ( "codigo_parroquia " );

ALTER TABLE parroquias
    ADD CONSTRAINT parroquias_cantones_fk FOREIGN KEY ( "Cantones_codigo_canton " )
        REFERENCES cantones ( "codigo_canton " );

ALTER TABLE subcircuitos
    ADD CONSTRAINT subcircuitos_circuitos_fk FOREIGN KEY ( "Circuitos_codigo_circuito " )
        REFERENCES circuitos ( "codigo_circuito " );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             9
-- CREATE INDEX                             0
-- ALTER TABLE                             17
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   1
-- WARNINGS                                 0
