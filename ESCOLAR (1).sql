CREATE TABLE DOCENTES_MATERIAS(
ID_DOCENTE NUMBER(10) CONSTRAINT DM_IDD_NN NOT NULL,
ID_MATERIA NUMBER(10) CONSTRAINT DM_IDM_NN NOT NULL,

CONSTRAINT DOCENTES_MATERIAS_PK PRIMARY KEY(ID_DOCENTE,ID_MATERIA),
CONSTRAINT DOCENTES_DOCENTES_MATERIAS_FK FOREIGN KEY (ID_DOCENTE) REFERENCES DOCENTES(ID_DOCENTE),
CONSTRAINT MATERIAS_DOCENTES_MATERIAS_FK FOREIGN KEY (ID_MATERIA) REFERENCES MATERIAS(ID_MATERIA)
);

CREATE TABLE CURSAN(
MATRICULA NUMBER(10) CONSTRAINT C_M_NN NOT NULL,

ID_DOCENTE NUMBER(10) CONSTRAINT C_IDD_NN NOT NULL,
ID_MATERIA NUMBER(10) CONSTRAINT C_IDM_NN NOT NULL,

COMPROBANTE VARCHAR(10) CONSTRAINT CURSAN_PK PRIMARY KEY,

CONSTRAINT DOCENTES_CURSAN_FK FOREIGN KEY (ID_DOCENTE) REFERENCES DOCENTES(ID_DOCENTE),
CONSTRAINT MATERIAS_CURSAN_FK FOREIGN KEY (ID_MATERIA) REFERENCES MATERIAS(ID_MATERIA),
CONSTRAINT DOCENTES_MATERIAS_CURSAN_FK FOREIGN KEY (ID_DOCENTE,ID_MATERIA) REFERENCES DOCENTES_MATERIAS(ID_DOCENTE,ID_MATERIA)
);

CREATE TABLE INSCRIPCION(
ID_CURSO NUMBER(10) CONSTRAINT I_IDA_NN NOT NULL,
NOMBRE VARCHAR(30) CONSTRAINT I_NOM_NN NOT NULL,
TIPO VARCHAR(20) CONSTRAINT I_TI_NN NOT NULL,

COMPROBANTE VARCHAR(10) CONSTRAINT I_CO_NN NOT NULL,

LUGAR VARCHAR(20) CONSTRAINT I_LU_NN NOT NULL,
FECHA DATE CONSTRAINT I_F_NN NOT NULL,
DESCRIPCION VARCHAR(20) CONSTRAINT I_DES_NN NOT NULL,

CONSTRAINT INS_PK PRIMARY KEY (ID_CURSO,COMPROBANTE,FECHA),
CONSTRAINT CURSO_INSCRIPCION_FK FOREIGN KEY (ID_CURSO) REFERENCES CURSO(ID_CURSO),
CONSTRAINT CURSAN_INSCRIPCION_FK FOREIGN KEY (COMPROBANTE) REFERENCES CURSAN(COMPROBANTE)
);

CREATE TABLE PERTENECE(
ID_CARRERA NUMBER(10) CONSTRAINT P_ICA_NN NOT NULL,
NOMBRE VARCHAR(30) CONSTRAINT I_NM_NN NOT NULL,
TIPO VARCHAR(20) CONSTRAINT I_T_NN NOT NULL,

INS 
);
