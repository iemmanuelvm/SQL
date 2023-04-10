CREATE TABLE ALUMNOS( 
MATRICULAS CHAR(5) NOT NULL, 
DOCUMENTO CHAR(8) NOT NULL, 
NOMBRE VARCHAR2(30),
CURSO CHAR(1) NOT NULL, 
MATERIA VARCHAR2(20) NOT NULL, 
NOTAFINAL NUMBER(4,2)); 

CREATE INDEX NOMBRE_AL_IND
  ON ALUMNOS(NOMBRE);

ALTER TABLE ALUMNOS MODIFY MATRICULAS CHAR (5) CONSTRAINT MAT_PK PRIMARY KEY;

DROP INDEX MAT_PK;

CREATE UNIQUE INDEX DOCUMENTO_AL_IND
ON ALUMNOS (DOCUMENTO);

ALTER TABLE ALUMNOS MODIFY DOCUMENTO CONSTRAINT  DOCUMENT_UN UNIQUE;

DROP INDEX DOCUMENTO_AL_IND;

ALTER TABLE ALUMNOS DROP CONSTRAINT DOCUMENT_UN;