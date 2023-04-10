CREATE TABLE PACIENTE(
  ID_PACIENTE NUMBER (10) CONSTRAINT PC_DO_PK PRIMARY KEY,
  APATERNO VARCHAR2 (25) CONSTRAINT PC_AP_NN NOT NULL,
  AMATERNO VARCHAR2 (25),
  NOMBRE VARCHAR2 (25) CONSTRAINT PC_NOM_NN NOT NULL,
  TELEFONO VARCHAR2 (10) CONSTRAINT PC_TEL_NN NOT NULL,
  DIRECCION VARCHAR2(100) CONSTRAINT PC_DIR_NN NOT NULL
);

INSERT INTO PACIENTE VALUES (1, 'VELASQUEZ', 'MARTINEZ', 'EMMANUEL', '4961263124', 'AV. ADOLFO LOPEZ #900 COLONIA CENTRO');
INSERT INTO PACIENTE VALUES (2, 'CASTA�EDA', 'CAMARILLO', 'ERIKA', '5614785134', 'AV. REVOLUCION #540 COLONIA CENTRO');
INSERT INTO PACIENTE VALUES (3, 'GONZALEZ', 'GASPAR', 'REIK', '4921567894', 'AV. HIDALGO #35 COLONIA CENTRO');
INSERT INTO PACIENTE VALUES (4, 'ROSALES', NULL, 'DANIELA', '4932185741', 'AV. HIDALGO #50 COLONIA CENTRO');
INSERT INTO PACIENTE VALUES (5, 'SOTO', NULL, 'ARMANDO', '9632147895', 'AV. HIDALGO #35 COLONIA CENTRO');
SELECT * FROM PACIENTE;

CREATE TABLE RECEPCIONISTA(
  ID_RECEPCIONISTA NUMBER (10) CONSTRAINT REC_DO_PK PRIMARY KEY,
  APATERNO VARCHAR2 (25) CONSTRAINT REC_AP_NN NOT NULL,
  AMATERNO VARCHAR2 (25),
  NOMBRE VARCHAR2 (25) CONSTRAINT REC_NOM_NN NOT NULL,
  TELEFONO VARCHAR2 (10) CONSTRAINT REC_TEL_NN NOT NULL,
  SALARIO NUMBER (10) CONSTRAINT REC_DIR_NN NOT NULL
);

INSERT INTO RECEPCIONISTA VALUES (1, 'SILVESTE', 'FLORES', 'FRANCO', '4961263124', 5000);
INSERT INTO RECEPCIONISTA VALUES (2, 'REVELES', 'CAMARILLO', 'FLORINDA', '5614785134', 1500);
INSERT INTO RECEPCIONISTA VALUES (3, 'GONZALEZ', 'VELASQUEZ', 'RAMON', '4921567894', 2500);
INSERT INTO RECEPCIONISTA VALUES (4, 'LOREZO', NULL, 'DANIELA', '4932185741', 3000);
INSERT INTO RECEPCIONISTA VALUES (5, 'SOTO', NULL, 'FEDERICO', '9632147895', 3000);
SELECT * FROM RECEPCIONISTA;

CREATE TABLE PACIENTE_CITA(
  NUM_CITA NUMBER (10) CONSTRAINT PAC_NC_PK PRIMARY KEY,
  ID_RECEPCIONISTA NUMBER (10) CONSTRAINT PAC_IR_NN NOT NULL,
  ID_PACIENTE NUMBER (10) CONSTRAINT PAC_IP_NN NOT NULL,
  CONSULTORIO VARCHAR2 (20) CONSTRAINT PAC_CON_NN NOT NULL,
  FECHA DATE CONSTRAINT PAC_FE_NN NOT NULL,
  CONSTRAINT PC_IR_FK FOREIGN KEY (ID_RECEPCIONISTA) REFERENCES RECEPCIONISTA(ID_RECEPCIONISTA),
  CONSTRAINT PC_IP_FK FOREIGN KEY (ID_PACIENTE) REFERENCES PACIENTE(ID_PACIENTE)
);
INSERT INTO PACIENTE_CITA VALUES (1, 1, 1, 'CONSULTORIO 2', '25/01/2017');
INSERT INTO PACIENTE_CITA VALUES (2, 2, 1, 'CONSULTORIO 2', '25/01/2017');
INSERT INTO PACIENTE_CITA VALUES (3, 2, 1, 'CONSULTORIO 2', '25/01/2017');
INSERT INTO PACIENTE_CITA VALUES (4, 3, 1, 'CONSULTORIO 5', '25/01/2017');
INSERT INTO PACIENTE_CITA VALUES (5, 5, 1, 'CONSULTORIO 3', '25/01/2017');
INSERT INTO PACIENTE_CITA VALUES (6, 5, 2, 'CONSULTORIO 3', '25/01/2017');
SELECT * FROM PACIENTE_CITA;

CREATE TABLE MEDICO(
  ID_MEDICO NUMBER (10) CONSTRAINT ME_IM_PK PRIMARY KEY,
  APATERNO VARCHAR2 (25) CONSTRAINT ME_AP_NN NOT NULL,
  AMATERNO VARCHAR2 (25),
  NOMBRE VARCHAR2 (25) CONSTRAINT ME_NOM_NN NOT NULL,
  TELEFONO VARCHAR2 (10) CONSTRAINT ME_TEL_NN NOT NULL,
  ESPECIALIDAD VARCHAR2(100) CONSTRAINT ME_ESP_NN NOT NULL
);
INSERT INTO MEDICO VALUES (1, 'VAZQUEZ', 'LARA', 'ENRIQUE', '4929624578', 'NEFROLOGO');
INSERT INTO MEDICO VALUES (2, 'MARTINEZ', 'FLORES', 'ALEJANDRO', '4994578963', 'CARDIOLOGO');
INSERT INTO MEDICO VALUES (3, 'NAVARRO', 'LEOS', 'ANTONIO', '4924578741', 'HUESERO');
INSERT INTO MEDICO VALUES (4, 'VAZQUEZ', 'LARA', 'RICARDO', '4928711496', 'PEDIATRA');
INSERT INTO MEDICO VALUES (5, 'VIZANTINO', NULL, 'GUSTAVO', '4937843254', 'EMBRIOLOGIA');

SELECT * FROM MEDICO;


CREATE TABLE ENFERMERA(
  ID_ENFERMERA NUMBER (10) CONSTRAINT EN_IM_PK PRIMARY KEY,
  APATERNO VARCHAR2 (25) CONSTRAINT EN_AP_NN NOT NULL,
  AMATERNO VARCHAR2 (25),
  NOMBRE VARCHAR2 (25) CONSTRAINT EN_NOM_NN NOT NULL,
  TELEFONO VARCHAR2 (10) CONSTRAINT EN_TEL_NN NOT NULL,
  AREA VARCHAR2(100) CONSTRAINT EN_AR_NN NOT NULL
);
INSERT INTO ENFERMERA VALUES (1, 'VAZQUEZ', 'LARA', 'TANIA', '4929784578', 'NUTRICION');
INSERT INTO ENFERMERA VALUES (2, 'MARTINEZ', 'FLORES', 'ALEJANDRA', '4994128963', 'SALA');
INSERT INTO ENFERMERA VALUES (3, 'NAVARRO', 'LEOS', 'PAULINA', '4924543241', 'ENFERMOS');
INSERT INTO ENFERMERA VALUES (4, 'VAZQUEZ', 'LARA', 'CELINA', '492875676', 'PEDIATRIA');
INSERT INTO ENFERMERA VALUES (5, 'VIZANTINO', NULL, 'BLANCA', '4937847894', 'NUTRICION');

SELECT * FROM ENFERMERA;


CREATE TABLE CONSULTORIO(
  ID_CONSULTORIO NUMBER (10) CONSTRAINT CON_IC_PK PRIMARY KEY,
  LUGAR VARCHAR2 (25) CONSTRAINT CON_LU_NN NOT NULL
);
INSERT INTO CONSULTORIO VALUES (1, 'LOMAS VIZANTINO #910');
INSERT INTO CONSULTORIO VALUES (2, 'REVOLUCION #192');
INSERT INTO CONSULTORIO VALUES (3, 'AV. UNIVERSIDAD #192');
INSERT INTO CONSULTORIO VALUES (4, 'REVOLUCION #192');
INSERT INTO CONSULTORIO VALUES (5, 'REVOLUCION #192');

CREATE TABLE CONSULTA(
  NUM_CITA NUMBER (10) CONSTRAINT CONS_NC_PK PRIMARY KEY,
  ID_RECEPCIONISTA NUMBER (10) CONSTRAINT CONS_IR_NN NOT NULL,
  ID_PACIENTE NUMBER (10) CONSTRAINT CONS_IP_NN NOT NULL,
  ID_MEDICO NUMBER (10) CONSTRAINT CONS_IM_NN NOT NULL,
  ID_CONSULTORIO NUMBER (10) CONSTRAINT PAC_IC_NN NOT NULL,
  FECHA DATE CONSTRAINT CON_IE_NN_FVE_NN NOT NULL,
  CONSTRAINT CONS_IR_FK FOREIGN KEY (ID_RECEPCIONISTA) REFERENCES RECEPCIONISTA(ID_RECEPCIONISTA),
  CONSTRAINT CONS_IP_FK FOREIGN KEY (ID_PACIENTE) REFERENCES PACIENTE(ID_PACIENTE),
  CONSTRAINT CONS_IM_FK FOREIGN KEY (ID_MEDICO) REFERENCES MEDICO(ID_MEDICO),
  CONSTRAINT CONS_IC_FK FOREIGN KEY (ID_CONSULTORIO) REFERENCES CONSULTORIO(ID_CONSULTORIO)
);

INSERT INTO CONSULTA VALUES (1, 1, 3, 3, 4, '20/12/2016');
INSERT INTO CONSULTA VALUES (2, 2, 1, 1, 4, '23/12/2016');
INSERT INTO CONSULTA VALUES (3, 3, 4, 1, 4, '23/02/2017');
INSERT INTO CONSULTA VALUES (4, 1, 1, 2, 4, '23/07/2017');
INSERT INTO CONSULTA VALUES (5, 5, 5, 4, 4, '23/09/2017');
SELECT * FROM CONSULTA;

CREATE TABLE HOSPITAL(
  ID_HOSPITAL CHAR (16) CONSTRAINT HOSPITALIZACION_IH_PK PRIMARY KEY,
  TIPO_HOSPITALIZACION VARCHAR2 (25) CONSTRAINT HOSPITALIZACION_TH_NN NOT NULL,
  LUGAR VARCHAR2 (25) CONSTRAINT HOSPITALIZACION_LU_NN NOT NULL
);

INSERT INTO HOSPITAL VALUES ('HOSPITAL-2002', 'CODIGO ROJO', 'LORETO ZACATECAS #210');
INSERT INTO HOSPITAL VALUES ('HOSPITAL-2011', 'CODIGO AZUL', 'GUADALUPE ZACATECAS #874');
INSERT INTO HOSPITAL VALUES ('HOSPITAL-2012', 'CODIGO NEGRO', 'FRESNILLO ZACATECAS #741');
INSERT INTO HOSPITAL VALUES ('HOSPITAL-2010', 'CODIGO BLANCO', 'LORETO ZACATECAS #210');
SELECT * FROM HOSPITAL;

CREATE TABLE HOSPITALIZACION_PACIENTE(
  ID_FOL CHAR(10) CONSTRAINT HOSPAC_IDFO_PK PRIMARY KEY,
  ID_RECEPCIONISTA NUMBER (10) CONSTRAINT HOSPAC_IR_NN NOT NULL,
  ID_PACIENTE NUMBER (10) CONSTRAINT HOSPAC_IP_NN NOT NULL,
  ID_MEDICO NUMBER (10) CONSTRAINT HOSPAC_IM_NN NOT NULL,
  ID_CONSULTORIO NUMBER (10) CONSTRAINT HOSPAC_IC_NN NOT NULL,
  ID_ENFERMERA NUMBER (10) CONSTRAINT HOSPAC_IE_NN NOT NULL,
  FECHA DATE CONSTRAINT HOSPAC_IE_NN_FVE_NN NOT NULL,
  CONSTRAINT HOSPAC_IR_FK FOREIGN KEY (ID_RECEPCIONISTA) REFERENCES RECEPCIONISTA(ID_RECEPCIONISTA),
  CONSTRAINT HOSPAC_IP_FK FOREIGN KEY (ID_PACIENTE) REFERENCES PACIENTE(ID_PACIENTE),
  CONSTRAINT HOSPAC_IM_FK FOREIGN KEY (ID_MEDICO) REFERENCES MEDICO(ID_MEDICO),
  CONSTRAINT HOSPAC_IE_FK FOREIGN KEY (ID_ENFERMERA) REFERENCES ENFERMERA(ID_ENFERMERA),
  CONSTRAINT HOSPAC_IC_FK FOREIGN KEY (ID_CONSULTORIO) REFERENCES CONSULTORIO(ID_CONSULTORIO)
);


INSERT INTO HOSPITALIZACION_PACIENTE VALUES ('HOS-12-01', 4, 3, 2, 1, 1, '12/09/2017');
INSERT INTO HOSPITALIZACION_PACIENTE VALUES ('HOS-12-02', 3, 3, 2, 4, 1, '14/12/2017');
INSERT INTO HOSPITALIZACION_PACIENTE VALUES ('HOS-12-03', 4, 2, 1, 4, 1, '16/10/2017');
INSERT INTO HOSPITALIZACION_PACIENTE VALUES ('HOS-12-04', 2, 2, 1, 5, 2, '18/01/2017');
INSERT INTO HOSPITALIZACION_PACIENTE VALUES ('HOS-12-05', 1, 1, 1, 5, 3, '21/04/2017');
SELECT * FROM HOSPITALIZACION_PACIENTE;

CREATE TABLE MEDICAMENTO(
  ID_MEDICAMENTO NUMBER (10) CONSTRAINT MEDICAMENTO_IM_PK PRIMARY KEY,
  TIPO_MEDICAMENTO VARCHAR2 (25) CONSTRAINT MEDICAMENTO_TM_NN NOT NULL,
  NOMBRE_MEDICAMENTO VARCHAR2 (25) CONSTRAINT MEDICAMENTO_NM_NN NOT NULL
);
INSERT INTO MEDICAMENTO VALUES (1, 'PARECETAMOL', 'DOLORES');
INSERT INTO MEDICAMENTO VALUES (2, 'AGRIFEN', 'GRIPE');
INSERT INTO MEDICAMENTO VALUES (3, 'ACTRON', 'GARGANTE');
INSERT INTO MEDICAMENTO VALUES (4, 'XL-3', 'GRIPE');
INSERT INTO MEDICAMENTO VALUES (5, 'ASPIRINA', 'DOLOR DE CABEZA');
INSERT INTO MEDICAMENTO VALUES (6, 'BUSCAPINA', 'COLICO');
SELECT * FROM MEDICAMENTO;

CREATE TABLE TIPO_ANALISIS(
  ID_ANALISIS CHAR (10) CONSTRAINT TPA_IA_PK PRIMARY KEY,
  LUGAR VARCHAR2 (25) CONSTRAINT TPA_LU_NN NOT NULL,
  TIPO_DE_ANALISIS VARCHAR2 (25) CONSTRAINT TPA_TDA_NN NOT NULL
);

INSERT INTO TIPO_ANALISIS VALUES ('RADIOLOGIA', 'LAB 2', 'HUESOS');
INSERT INTO TIPO_ANALISIS VALUES ('SANGRE', 'LAB 3', 'SANGRE');
INSERT INTO TIPO_ANALISIS VALUES ('UROLOGIA', 'LAB 2', 'ORINA');

SELECT * FROM TIPO_ANALISIS;

CREATE TABLE LABORATORIO(
  ID_LABORATORIO CHAR (10) CONSTRAINT LAB_IL_PK PRIMARY KEY,
  LUGAR VARCHAR2 (25) CONSTRAINT LAB_LU_NN NOT NULL
);

INSERT INTO LABORATORIO VALUES ('LAB-04-HU', 'AV. HIDALGO #35');
INSERT INTO LABORATORIO VALUES ('LAB-03-HU', 'AV. HIDALGO #34');
INSERT INTO LABORATORIO VALUES ('LAB-02-HU', 'AV. REAL #32');
INSERT INTO LABORATORIO VALUES ('LAB-01-HU', 'AV. BARCA #31');
INSERT INTO LABORATORIO VALUES ('LAB-00-HU', 'AV. LORETO #901');

SELECT * FROM LABORATORIO;

CREATE TABLE ANALISIS_CLINICO(
  ID_RECEPCIONISTA NUMBER (10) CONSTRAINT ACLI_IR_NN NOT NULL,
  ID_PACIENTE NUMBER (10) CONSTRAINT ACLI_IP_NN NOT NULL,
  ID_MEDICO NUMBER (10) CONSTRAINT ACLI_IM_NN NOT NULL,
  ID_CONSULTORIO NUMBER (10) CONSTRAINT ACLI_IC_NN NOT NULL,
  ID_LABORATORIO CHAR (10) CONSTRAINT ACLI_IL_NN NOT NULL,
  ID_ANALISIS CHAR (10) CONSTRAINT ACLI_IA_NN NOT NULL,
  CONSTRAINT ACLI_IR_FK FOREIGN KEY (ID_RECEPCIONISTA) REFERENCES RECEPCIONISTA(ID_RECEPCIONISTA),
  CONSTRAINT ACLI_IP_FK FOREIGN KEY (ID_PACIENTE) REFERENCES PACIENTE(ID_PACIENTE),
  CONSTRAINT ACLI_IM_FK FOREIGN KEY (ID_MEDICO) REFERENCES MEDICO(ID_MEDICO),
  CONSTRAINT ACLI_ILAB_FK FOREIGN KEY (ID_LABORATORIO) REFERENCES LABORATORIO(ID_LABORATORIO),
  CONSTRAINT ACLI_IDANA_FK FOREIGN KEY (ID_ANALISIS) REFERENCES TIPO_ANALISIS(ID_ANALISIS),
  CONSTRAINT ACLI_IC_FK FOREIGN KEY (ID_CONSULTORIO) REFERENCES CONSULTORIO(ID_CONSULTORIO)
);

INSERT INTO ANALISIS_CLINICO VALUES (1,2,3,4,'LAB-00-HU','RADIOLOGIA');
INSERT INTO ANALISIS_CLINICO VALUES (3,2,2,4,'LAB-02-HU','SANGRE');
INSERT INTO ANALISIS_CLINICO VALUES (1,2,1,4,'LAB-03-HU','UROLOGIA');
INSERT INTO ANALISIS_CLINICO VALUES (2,3,1,4,'LAB-01-HU','UROLOGIA');
INSERT INTO ANALISIS_CLINICO VALUES (5,3,2,4,'LAB-02-HU','SANGRE');

SELECT * FROM ANALISIS_CLINICO;

CREATE TABLE EXPEDIENTE(
  FOLIO CHAR (10) CONSTRAINT EXP_EXP_PK PRIMARY KEY,  
  ID_RECEPCIONISTA NUMBER (10) CONSTRAINT EXP_IR_NN NOT NULL,
  ID_PACIENTE NUMBER (10) CONSTRAINT EXP_IP_NN NOT NULL,
  ID_MEDICO NUMBER (10) CONSTRAINT EXP_IM_NN NOT NULL,
  ID_CONSULTORIO NUMBER (10) CONSTRAINT EXP_IC_NN NOT NULL,
  CONSTRAINT  EXP_IR_FK FOREIGN KEY (ID_RECEPCIONISTA) REFERENCES RECEPCIONISTA(ID_RECEPCIONISTA),
  CONSTRAINT  EXP_IP_FK FOREIGN KEY (ID_PACIENTE) REFERENCES PACIENTE(ID_PACIENTE),
  CONSTRAINT  EXP_IM_FK FOREIGN KEY (ID_MEDICO) REFERENCES MEDICO(ID_MEDICO),
  CONSTRAINT  EXP_IC_FK FOREIGN KEY (ID_CONSULTORIO) REFERENCES CONSULTORIO(ID_CONSULTORIO)
);

INSERT INTO EXPEDIENTE VALUES ('PAC2017-20',2,2,4,3);
INSERT INTO EXPEDIENTE VALUES ('PAC2017-21',1,3,1,1);
INSERT INTO EXPEDIENTE VALUES ('PAC2017-23',3,4,2,2);
INSERT INTO EXPEDIENTE VALUES ('PAC2017-24',4,5,3,4);
INSERT INTO EXPEDIENTE VALUES ('PAC2017-25',5,1,4,5);
SELECT * FROM EXPEDIENTE;

CREATE TABLE RECETA(
  ID_MEDICAMENTO NUMBER (10) CONSTRAINT REC_IME_NN NOT NULL,
  ID_RECEPCIONISTA NUMBER (10) CONSTRAINT REC_IR_NN NOT NULL,
  ID_PACIENTE NUMBER (10) CONSTRAINT REC_IP_NN NOT NULL,
  ID_MEDICO NUMBER (10) CONSTRAINT REC_IM_NN NOT NULL,
  ID_CONSULTORIO NUMBER (10) CONSTRAINT REC_IC_NN NOT NULL,
  SURTIR VARCHAR2(50) CONSTRAINT REC_SUR_NN NOT NULL,
  CONSTRAINT REC_IMED_FK FOREIGN KEY (ID_MEDICAMENTO) REFERENCES MEDICAMENTO(ID_MEDICAMENTO),
  CONSTRAINT REC_IR_FK FOREIGN KEY (ID_RECEPCIONISTA) REFERENCES RECEPCIONISTA(ID_RECEPCIONISTA),
  CONSTRAINT REC_IP_FK FOREIGN KEY (ID_PACIENTE) REFERENCES PACIENTE(ID_PACIENTE),
  CONSTRAINT REC_IM_FK FOREIGN KEY (ID_MEDICO) REFERENCES MEDICO(ID_MEDICO),
  CONSTRAINT REC_IC_FK FOREIGN KEY (ID_CONSULTORIO) REFERENCES CONSULTORIO(ID_CONSULTORIO)
);

INSERT INTO RECETA VALUES (1, 1, 1, 1, 1, 'FARCIAS DEL AHORRO');
INSERT INTO RECETA VALUES (5, 4, 3, 1, 1, 'FARCIAS GUADALAJARA');
INSERT INTO RECETA VALUES (4, 2, 3, 1, 1, 'FARCIAS SANCHEZ');
INSERT INTO RECETA VALUES (3, 4, 3, 1, 1, 'FARCIAS SANTA CLARA');
INSERT INTO RECETA VALUES (2, 3, 3, 1, 1, 'FARCIAS SIMILARES');
SELECT * FROM RECETA;
----ACTIVIDADES A REALIZAR:
--Elabore las siguientes consultas para la base de datos de la Cl�nica de Especialidades:

--1. Consultar el nombre de completo de las m�dicos que han realizado al menos una consulta.
SELECT * FROM MEDICO;
SELECT * FROM CONSULTA;
SELECT APATERNO, AMATERNO, NOMBRE FROM MEDICO ME JOIN CONSULTA CON ON ME.ID_MEDICO = CON.ID_MEDICO
GROUP BY APATERNO, AMATERNO, NOMBRE HAVING COUNT (*)>=1;

--2. Consultar el nombre completo de los pacientes que han sido consultados.
SELECT * FROM CONSULTA;
SELECT * FROM PACIENTE;
SELECT APATERNO, AMATERNO, NOMBRE AS PACIENTES_CONSULTADOS FROM PACIENTE WHERE ID_PACIENTE IN (SELECT ID_PACIENTE FROM CONSULTA);

--3. Consultar el nombre completo de los pacientes que han sido consultados e incluir el nombre completo del m�dico.
SELECT * FROM CONSULTA;
SELECT * FROM PACIENTE;
SELECT * FROM MEDICO;
SELECT PA.APATERNO, PA.AMATERNO, PA.NOMBRE, ME.APATERNO, ME.AMATERNO, ME.NOMBRE
                FROM PACIENTE PA JOIN CONSULTA CON ON PA.ID_PACIENTE=CON.ID_PACIENTE
                JOIN MEDICO ME ON ME.ID_MEDICO = CON.ID_MEDICO;

--4. Consultar nombre completo de los pacientes y el tipo de an�lisis que se le han realizado.
SELECT * FROM ANALISIS_CLINICO;
SELECT * FROM PACIENTE;
SELECT * FROM TIPO_ANALISIS;
SELECT PA.APATERNO, PA.AMATERNO, PA.NOMBRE, TA.TIPO_DE_ANALISIS
                FROM PACIENTE PA JOIN ANALISIS_CLINICO AC ON PA.ID_PACIENTE = AC.ID_PACIENTE
                JOIN TIPO_ANALISIS TA ON TA.ID_ANALISIS = AC.ID_ANALISIS;
                             
--5. Consultar el nombre completo de los pacientes que han sido hospitalizados.
SELECT * FROM HOSPITALIZACION_PACIENTE;
SELECT * FROM PACIENTE;
SELECT PA.APATERNO, PA.AMATERNO, PA.NOMBRE
                FROM PACIENTE PA JOIN HOSPITALIZACION_PACIENTE HP ON PA.ID_PACIENTE = HP.ID_PACIENTE;
                
--6. Consultar el nombre completo de los pacientes y el nombre de los medicamentos que le han sido recetados.
SELECT * FROM MEDICAMENTO;
SELECT * FROM PACIENTE;
SELECT * FROM RECETA;
SELECT PA.APATERNO, PA.AMATERNO, PA.NOMBRE,ME.TIPO_MEDICAMENTO
                FROM PACIENTE PA JOIN RECETA RE ON PA.ID_PACIENTE = RE.ID_PACIENTE
                JOIN MEDICAMENTO ME ON ME.ID_MEDICAMENTO = RE.ID_MEDICAMENTO;
                
--7. Consultar el nombre completo de los m�dicos y el total de consultas que han realizado.
SELECT * FROM MEDICOS;
SELECT * FROM CONSULTA;
SELECT ME.APATERNO, ME.AMATERNO, ME.NOMBRE, COUNT (*) AS TOTAL_CONSULTAS
FROM MEDICO ME JOIN CONSULTA CON ON ME.ID_MEDICO = CON.ID_MEDICO
GROUP BY ME.APATERNO, ME.AMATERNO, ME.NOMBRE;

--8. Consultar el nombre de los m�dicos que no han realizado consultas.
SELECT * FROM MEDICO;
SELECT * FROM CONSULTA;
SELECT APATERNO, AMATERNO, NOMBRE AS CONSULTA FROM MEDICO WHERE ID_MEDICO NOT IN (SELECT ID_MEDICO FROM CONSULTA);

--9. Consultar el nombre completo de los pacientes y el total de consultas que ha tenido cada uno.
SELECT * FROM PACIENTE;
SELECT * FROM CONSULTA;
SELECT PA.APATERNO, PA.AMATERNO, PA.NOMBRE, COUNT (*) AS TOTAL_CONSULTAS
FROM PACIENTE PA JOIN CONSULTA CON ON PA.ID_PACIENTE = CON.ID_PACIENTE
GROUP BY PA.APATERNO, PA.AMATERNO, PA.NOMBRE;

--10. Consultar el nombre de los medicamentos que no se han recetado.
SELECT * FROM MEDICAMENTO;
SELECT * FROM RECETA;
SELECT TIPO_MEDICAMENTO AS MEDICAMENTO_NO_RECETADO FROM MEDICAMENTO WHERE ID_MEDICAMENTO NOT IN (SELECT ID_MEDICAMENTO FROM RECETA);

--11. Consultar el nombre completo de los pacientes que m�s consultas han tenido.
SELECT *FROM CONSULTA;
SELECT *FROM PACIENTE;
SELECT APATERNO, AMATERNO, NOMBRE
FROM PACIENTE PA JOIN CONSULTA CON ON PA.ID_PACIENTE = CON.ID_PACIENTE
GROUP BY  APATERNO, AMATERNO, NOMBRE
HAVING COUNT (*) =
(
SELECT MAX (COUNT(*))
FROM PACIENTE PA JOIN CONSULTA CON ON PA.ID_PACIENTE = CON.ID_PACIENTE
GROUP BY  APATERNO, AMATERNO, NOMBRE
);

--12. Consultar el nombre completo de los m�dicos que m�s consultas han tenido.
SELECT *FROM CONSULTA;
SELECT *FROM MEDICO;
SELECT APATERNO, AMATERNO, NOMBRE
FROM MEDICO ME JOIN CONSULTA CON ON ME.ID_MEDICO = CON.ID_MEDICO
GROUP BY  APATERNO, AMATERNO, NOMBRE
HAVING COUNT (*) =
(
SELECT MAX (COUNT(*))
FROM MEDICO ME JOIN CONSULTA CON ON ME.ID_MEDICO = CON.ID_MEDICO
GROUP BY  APATERNO, AMATERNO, NOMBRE
);

--13. Consultar el nombre completo de los pacientes que m�s han sido hospitalizados.
SELECT *FROM HOSPITALIZACION_PACIENTE;
SELECT *FROM PACIENTE;
SELECT APATERNO, AMATERNO, NOMBRE
FROM PACIENTE PA JOIN HOSPITALIZACION_PACIENTE HP ON PA.ID_PACIENTE = HP.ID_PACIENTE
GROUP BY  APATERNO, AMATERNO, NOMBRE
HAVING COUNT (*) =
(
SELECT MAX (COUNT(*))
FROM PACIENTE PA JOIN HOSPITALIZACION_PACIENTE HP ON PA.ID_PACIENTE = HP.ID_PACIENTE
GROUP BY  APATERNO, AMATERNO, NOMBRE
);

--14. Consultar el nombre completo de las enfermeras que m�s pacientes han atendido.
SELECT *FROM HOSPITALIZACION_PACIENTE;
SELECT *FROM ENFERMERA;
SELECT APATERNO, AMATERNO, NOMBRE
FROM ENFERMERA EN JOIN HOSPITALIZACION_PACIENTE HP ON EN.ID_ENFERMERA = HP.ID_ENFERMERA
GROUP BY  APATERNO, AMATERNO, NOMBRE
HAVING COUNT (*) =
(
SELECT MAX (COUNT(*))
FROM ENFERMERA EN JOIN HOSPITALIZACION_PACIENTE HP ON EN.ID_ENFERMERA = HP.ID_ENFERMERA
GROUP BY  APATERNO, AMATERNO, NOMBRE
);

--15. Consultar al m�dico del a�o (El m�dico que m�s consultas realiz� en un determinado a�o).
SELECT *FROM MEDICO;
SELECT *FROM CONSULTA;
SELECT  ME.APATERNO, ME.AMATERNO, ME.NOMBRE
FROM MEDICO ME JOIN CONSULTA CON ON ME.ID_MEDICO = CON.ID_MEDICO
WHERE FECHA BETWEEN '01/01/16' AND '30/12/16'
GROUP BY  ME.APATERNO, ME.AMATERNO, ME.NOMBRE
HAVING COUNT(*) = 
(
SELECT  MAX(COUNT (*))
FROM MEDICO ME JOIN CONSULTA CON ON ME.ID_MEDICO = CON.ID_MEDICO
WHERE FECHA BETWEEN '01/01/16' AND '30/12/16'
GROUP BY  ME.APATERNO, ME.AMATERNO, ME.NOMBRE
);

--16. Consultar el nombre completo de los pacientes que no se han realizado an�lisis cl�nicos.
SELECT * FROM PACIENTE;
SELECT * FROM ANALISIS_CLINICO;
SELECT APATERNO, AMATERNO, NOMBRE AS PACIENTES_NO_ANALISIS 
FROM PACIENTE WHERE ID_PACIENTE NOT IN (SELECT ID_PACIENTE FROM ANALISIS_CLINICO);

--17. Consultar el nombre completo de los pacientes que sacaron cita pero no asistieron a la consulta.
SELECT * FROM PACIENTE;
SELECT * FROM PACIENTE_CITA;
SELECT * FROM CONSULTA;
SELECT APATERNO, AMATERNO, NOMBRE AS PACIENTE FROM PACIENTE WHERE ID_PACIENTE IN (SELECT ID_PACIENTE FROM PACIENTE_CITA 
WHERE ID_PACIENTE NOT IN (SELECT ID_PACIENTE FROM CONSULTA));

--18. Consultar el nombre completo de los pacientes que fueron consultados pero que no fueron hospitalizados.
SELECT * FROM PACIENTE;
SELECT * FROM HOSPITALIZACION_PACIENTE;
SELECT * FROM CONSULTA;
SELECT APATERNO, AMATERNO, NOMBRE AS PACIENTE FROM PACIENTE WHERE ID_PACIENTE IN (SELECT ID_PACIENTE FROM CONSULTA 
WHERE ID_PACIENTE NOT IN (SELECT ID_PACIENTE FROM HOSPITALIZACION_PACIENTE));

--19. Consultar el nombre completo de la asistente del mes (La asistente que m�s cita gener� en un determinado mes).
SELECT *FROM RECEPCIONISTA;
SELECT *FROM PACIENTE_CITA;
SELECT  REC.APATERNO, REC.AMATERNO, REC.NOMBRE
FROM RECEPCIONISTA REC JOIN PACIENTE_CITA PC ON REC.ID_RECEPCIONISTA = PC.ID_RECEPCIONISTA
WHERE FECHA BETWEEN '01/01/17' AND '30/01/17'
GROUP BY  REC.APATERNO, REC.AMATERNO, REC.NOMBRE
HAVING COUNT(*) = 
(
SELECT  MAX(COUNT (*))
FROM RECEPCIONISTA REC JOIN PACIENTE_CITA PC ON REC.ID_RECEPCIONISTA = PC.ID_RECEPCIONISTA
WHERE FECHA BETWEEN '01/01/17' AND '30/01/17'
GROUP BY  REC.APATERNO, REC.AMATERNO, REC.NOMBRE
);

--20. Consultar el nombre completo del m�dico que menos consultas ha tenido.
SELECT *FROM CONSULTA;
SELECT *FROM MEDICO;
SELECT APATERNO, AMATERNO, NOMBRE
FROM MEDICO ME JOIN CONSULTA CON ON ME.ID_MEDICO = CON.ID_MEDICO
GROUP BY  APATERNO, AMATERNO, NOMBRE
HAVING COUNT (*) =
(
SELECT MIN (COUNT(*))
FROM MEDICO ME JOIN CONSULTA CON ON ME.ID_MEDICO = CON.ID_MEDICO
GROUP BY  APATERNO, AMATERNO, NOMBRE
);

--21. Consultar el nombre completo de los pacientes que fueron consultados y fueron hospitalizados.
SELECT * FROM PACIENTE;
SELECT * FROM HOSPITALIZACION_PACIENTE;
SELECT * FROM CONSULTA;
SELECT APATERNO, AMATERNO, NOMBRE AS PACIENTE FROM PACIENTE WHERE ID_PACIENTE IN (SELECT ID_PACIENTE FROM CONSULTA 
WHERE ID_PACIENTE IN (SELECT ID_PACIENTE FROM HOSPITALIZACION_PACIENTE));

--22. Consultar el nombre completo de los pacientes que sacaron cita y asistieron a la consulta.
SELECT * FROM PACIENTE;
SELECT * FROM PACIENTE_CITA;
SELECT * FROM CONSULTA;
SELECT APATERNO, AMATERNO, NOMBRE AS PACIENTE FROM PACIENTE WHERE ID_PACIENTE IN (SELECT ID_PACIENTE FROM PACIENTE_CITA 
WHERE ID_PACIENTE IN (SELECT ID_PACIENTE FROM CONSULTA));

--23. Consultar el nombre completo de los pacientes que menos han sido hospitalizados.
SELECT *FROM HOSPITALIZACION_PACIENTE;
SELECT *FROM PACIENTE;
SELECT APATERNO, AMATERNO, NOMBRE
FROM PACIENTE PA JOIN HOSPITALIZACION_PACIENTE HP ON PA.ID_PACIENTE = HP.ID_PACIENTE
GROUP BY  APATERNO, AMATERNO, NOMBRE
HAVING COUNT (*) =
(
SELECT MIN (COUNT(*))
FROM PACIENTE PA JOIN HOSPITALIZACION_PACIENTE HP ON PA.ID_PACIENTE = HP.ID_PACIENTE
GROUP BY  APATERNO, AMATERNO, NOMBRE
);

--24. Consultar el nombre de los medicamentos que se han recetado.
SELECT * FROM MEDICAMENTO;
SELECT * FROM RECETA;
SELECT TIPO_MEDICAMENTO AS MEDICAMENTO_NO_RECETADO FROM MEDICAMENTO WHERE ID_MEDICAMENTO IN (SELECT ID_MEDICAMENTO FROM RECETA);

--25. Consultar el nombre completo de las enfermeras que menos pacientes han atendido.
SELECT *FROM HOSPITALIZACION_PACIENTE;
SELECT *FROM ENFERMERA;
SELECT APATERNO, AMATERNO, NOMBRE
FROM ENFERMERA EN JOIN HOSPITALIZACION_PACIENTE HP ON EN.ID_ENFERMERA = HP.ID_ENFERMERA
GROUP BY  APATERNO, AMATERNO, NOMBRE
HAVING COUNT (*) =
(
SELECT MIN (COUNT(*))
FROM ENFERMERA EN JOIN HOSPITALIZACION_PACIENTE HP ON EN.ID_ENFERMERA = HP.ID_ENFERMERA
GROUP BY  APATERNO, AMATERNO, NOMBRE
);