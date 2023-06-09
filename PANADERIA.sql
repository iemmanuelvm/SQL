CREATE TABLE PROVEEDOR(
    ID_PROVEEDOR NUMBER(4) CONSTRAINT PROVEEDOR_PK PRIMARY KEY,
    APATERNO VARCHAR2(20) CONSTRAINT PRO_AP_NN NOT NULL,
    AMATERNO VARCHAR2(20) CONSTRAINT PRO_AM_NN NOT NULL,
    NOMBRE VARCHAR2(25) CONSTRAINT PRO_NOM_NN NOT NULL,
    EDAD NUMBER(2) CONSTRAINT PRO_EDAD_CK CHECK (EDAD >= 18),
    TIPO_PROVEEDOR VARCHAR2(20) CONSTRAINT PRO_TP_NN NOT NULL);
    DESC PROVEEDOR; 
INSERT INTO PROVEEDOR VALUES(1, 'HINOJOSA', 'ESTRADA', 'ISRAEL', 25, 'LACTEOS'); 
INSERT INTO PROVEEDOR VALUES(2, 'CORDOVA', 'LOPEZ', 'GABRIELA', 22, 'AZUCAR');
INSERT INTO PROVEEDOR VALUES(3, 'REGALADO', 'LOPEZ', 'RAMIRO', 24,'CONSUMIBLES');
INSERT INTO PROVEEDOR VALUES(4, 'RODRIGUEZ', 'SALCEDO', 'ZAIRA', 25,'HUEVO');
INSERT INTO PROVEEDOR VALUES(5, 'PEREZ', 'RODRIGUEZ', 'LUCERO', 22,'GLASEADO');
SELECT * FROM PROVEEDOR;

CREATE TABLE MATERIAL(
    ID_MATERIAL NUMBER(4) CONSTRAINT MATERIAL_PK PRIMARY KEY,
    NOMBRE VARCHAR2(25) CONSTRAINT MAT_NOM_NN NOT NULL,
    DISPONIBLES NUMBER(2) CONSTRAINT MAT_DIS_NN NOT NULL,
    PRECIO NUMBER(2) CONSTRAINT MAT_PRE_NN NOT NULL );
    DESC MATERIAL; 
INSERT INTO MATERIAL VALUES(1, 'HARINA', 25, 30); 
INSERT INTO MATERIAL VALUES(2, 'HUEVO', 10, 40);
INSERT INTO MATERIAL VALUES(3, 'MANTEQUILLA', 32, 25);
INSERT INTO MATERIAL VALUES(4, 'LECHE', 35, 19);
INSERT INTO MATERIAL VALUES(5, 'GLASEADO', 40, 25);
SELECT * FROM MATERIAL;

CREATE TABLE ENCARGADO(
    ID_ENCARGADO NUMBER(4) CONSTRAINT ENCARGADO_PK PRIMARY KEY,
    APATERNO VARCHAR2(20) CONSTRAINT ENC_AP_NO NOT NULL,
    AMATERNO VARCHAR2(20),
    NOMBRE VARCHAR2(25) CONSTRAINT ENC_NOM_NO NOT NULL,
    EDAD NUMBER(2) CONSTRAINT ENC_EDAD_CK CHECK (EDAD >= 18));
    DESC ENCARGADO;
    
INSERT INTO ENCARGADO VALUES(1, 'LOPEZ', 'OLIVERA', 'ANTONIO', 36);
INSERT INTO ENCARGADO VALUES(2, 'GARCIA', 'REYES', 'AMALIA', 25);
INSERT INTO ENCARGADO VALUES(3, 'ZEPEDA', 'TELLO', 'ALEJANDRO', 42);
INSERT INTO ENCARGADO VALUES(4, 'GARCIA', 'SOLIS', 'FRANCISCO', 40);
INSERT INTO ENCARGADO VALUES(5, 'PEREZ', 'DE LA TORRE', 'ROBERTO', 25);
SELECT * FROM ENCARGADO; 

CREATE TABLE DISTRIBUCION(
  ID_PROVEEDOR NUMBER(4) CONSTRAINT DIS_IDP_NN NOT NULL,
  ID_MATERIAL NUMBER(4) CONSTRAINT DIS_IDM_NN NOT NULL,
  ID_ENCARGADO NUMBER(4)CONSTRAINT DIS_IDE_NN NOT NULL,
  CONSTRAINT DISTRIBUCION_PK PRIMARY KEY (ID_PROVEEDOR, ID_MATERIAL, ID_ENCARGADO),
  CONSTRAINT PROVEEDOR_DIS_FK FOREIGN KEY (ID_PROVEEDOR) REFERENCES PROVEEDOR(ID_PROVEEDOR),
  CONSTRAINT MATERIAL_DIS_FK FOREIGN KEY (ID_MATERIAL) REFERENCES MATERIAL(ID_MATERIAL),
  CONSTRAINT ENCARGADO_DIS_FK FOREIGN KEY (ID_ENCARGADO) REFERENCES ENCARGADO(ID_ENCARGADO));

DESC DISTRIBUCION;
INSERT INTO DISTRIBUCION VALUES (1,1,1);
INSERT INTO DISTRIBUCION VALUES (2,2,2);
INSERT INTO DISTRIBUCION VALUES (3,3,3);
INSERT INTO DISTRIBUCION VALUES (4,4,4);
INSERT INTO DISTRIBUCION VALUES (5,5,5);
SELECT * FROM DISTRIBUCION;

CREATE TABLE PANADERO(
    ID_PANADERO NUMBER(4) CONSTRAINT PANADERO_PK PRIMARY KEY,
    APATERNO VARCHAR2(20) CONSTRAINT PANA_AP_NN NOT NULL,
    AMATERNO VARCHAR2(20) CONSTRAINT PANA_AM_NN NOT NULL,
    NOMBRE VARCHAR2(25) CONSTRAINT PANA_NOM_NN NOT NULL,
    EDAD NUMBER(2) CONSTRAINT PANA_EDAD_CK CHECK (EDAD >= 18),
    SALARIO NUMBER(4) CONSTRAINT PANA_SAL_NN NOT NULL );
    DESC PANADERO; 
INSERT INTO PANADERO VALUES(1, 'AVALOS',	'ESTRADA', 'MIGUEL', 32, 2500); 
INSERT INTO PANADERO VALUES(2, 'PE�A', 'BADILLO', 'CARLOS', 35, 2000);
INSERT INTO PANADERO VALUES(3, 'REVELES', 'VILLEGAS', 'ARMANDO', 30, 2250);
INSERT INTO PANADERO VALUES(4, 'PEREZ', 'CABRAL', 'PEDRO', 25, 2100);
INSERT INTO PANADERO VALUES(5, 'LOPEZ', 'OLIVAREZ','CESAR', 31, 2000);
SELECT * FROM PANADERO;

CREATE TABLE PAN(
    ID_PAN NUMBER(4) CONSTRAINT PAN_PK PRIMARY KEY,
    NOMBRE VARCHAR2(25) CONSTRAINT PAN_NOM_NN NOT NULL,
    COSTO NUMBER(3,2) CONSTRAINT PAN_COS_NN NOT NULL,
    CANTIDAD NUMBER (3) CONSTRAINT PAN_CAN_NN NOT NULL
    );
    DESC PAN; 
INSERT INTO PAN VALUES(1, 'BOLILLO', 3.50, 100); 
INSERT INTO PAN VALUES(2, 'CONCHA', 3, 100);
INSERT INTO PAN VALUES(3, 'POLVORON', 4, 100);
INSERT INTO PAN VALUES(4, 'CAMPECHANA', 5, 100);
INSERT INTO PAN VALUES(5, 'EMPANADA', 6, 100);
SELECT * FROM PAN;

CREATE TABLE MAQUINA(
    ID_MAQUINA NUMBER(4) CONSTRAINT MAQ_PK PRIMARY KEY,
    NOMBRE VARCHAR2(25) CONSTRAINT MAQ_NOM_NO NOT NULL
    );
    DESC MAQUINA; 
INSERT INTO MAQUINA VALUES(1, 'HORNO'); 
INSERT INTO MAQUINA VALUES(2, 'BATIDORA');
INSERT INTO MAQUINA VALUES(3, 'CILINDRADORA');
INSERT INTO MAQUINA VALUES(4, 'CORTADORA');
INSERT INTO MAQUINA VALUES(5, 'AMASADORA');
SELECT * FROM MAQUINA;

CREATE TABLE FABRICACION(
  ID_PANADERO NUMBER (4) CONSTRAINT FAB_IDPANA_NN NOT NULL,
  ID_PAN NUMBER (4) CONSTRAINT FAB_IDPAN_NN NOT NULL,
  ID_MAQUINA NUMBER (4) CONSTRAINT FAB_IDMAQ_NN NOT NULL,
  ID_PROVEEDOR NUMBER (4) CONSTRAINT FAB_IDPRO_NN NOT NULL,
  ID_MATERIAL NUMBER (4) CONSTRAINT FAB_IDMAT_NN NOT NULL,
  ID_ENCARGADO NUMBER (4) CONSTRAINT FAB_IDENC_NN NOT NULL,
  
  CONSTRAINT FABRICACION_PK PRIMARY KEY (ID_PANADERO, ID_PAN, ID_MAQUINA, ID_PROVEEDOR, ID_MATERIAL, ID_ENCARGADO),
  CONSTRAINT PANA_FAB_FK FOREIGN KEY (ID_PANADERO) REFERENCES PANADERO(ID_PANADERO),
  CONSTRAINT PAN_FAB_FK FOREIGN KEY (ID_PAN) REFERENCES PAN(ID_PAN),
  CONSTRAINT MAQ_FAB_FK FOREIGN KEY (ID_MAQUINA) REFERENCES MAQUINA(ID_MAQUINA),
  CONSTRAINT DIS_FAB_FK FOREIGN KEY (ID_PROVEEDOR, ID_MATERIAL, ID_ENCARGADO) REFERENCES DISTRIBUCION(ID_PROVEEDOR, ID_MATERIAL, ID_ENCARGADO) );
DESC FABRICACION;
INSERT INTO FABRICACION VALUES(1, 1, 1, 1, 1, 1);
INSERT INTO FABRICACION VALUES(2, 2, 2, 2, 2, 2);
INSERT INTO FABRICACION VALUES(3, 3, 3, 3, 3, 3);
INSERT INTO FABRICACION VALUES(4, 4, 4, 4, 4, 4);
INSERT INTO FABRICACION VALUES(5, 5, 5, 5, 5, 5);

SELECT * FROM FABRICACION;

CREATE TABLE EMPLEADO_MOSTRADOR(
    ID_EM NUMBER(4) CONSTRAINT EM_PK PRIMARY KEY,
    APATERNO VARCHAR2(20) CONSTRAINT EM_AP_NN NOT NULL,
    AMATERNO VARCHAR2(20) CONSTRAINT EM_AM_NN NOT NULL,
    NOMBRE VARCHAR2(25) CONSTRAINT EM_NOM_NN NOT NULL,
    EDAD NUMBER(2) CONSTRAINT EM_EDAD_CK CHECK (EDAD >= 18),
    SALARIO NUMBER(4) CONSTRAINT EM_SAL_NN NOT NULL );
    DESC EMPLEADO_MOSTRADOR; 
INSERT INTO EMPLEADO_MOSTRADOR VALUES(1, 'MURILLO', 'GARCIA', 'RUBEN', 21, 1000); 
INSERT INTO EMPLEADO_MOSTRADOR VALUES(2, 'GARCIA', 'LOPEZ', 'EMMANUEL', 25, 1500);
INSERT INTO EMPLEADO_MOSTRADOR VALUES(3, 'CISNEROS', 'LOPEZ', 'ISABEL', 23, 1800);
INSERT INTO EMPLEADO_MOSTRADOR VALUES(4, 'BA�UELOS', 'GARCIA', 'RAUL', 26, 1900);
INSERT INTO EMPLEADO_MOSTRADOR VALUES(5, 'CASTA�EDA', 'MARIN', 'MARIO', 31, 2000);
SELECT * FROM EMPLEADO_MOSTRADOR;

CREATE TABLE PEDIDO(
    FOLIO NUMBER(4) CONSTRAINT PED_PK PRIMARY KEY,
    APATERNO_CLIENTE VARCHAR2(20) CONSTRAINT PED_APC_NN NOT NULL,
    AMATERNO_CLIENTE VARCHAR2(20) CONSTRAINT PED_AMC_NN NOT NULL,
    NOMBRE_CLIENTE VARCHAR2(25) CONSTRAINT PED_NOMC_NN NOT NULL,
    PRODUCTO VARCHAR2(25) CONSTRAINT PED_PRO_NN NOT NULL,
    CANTIDAD NUMBER(2) CONSTRAINT PED_CAN_NN NOT NULL,
    FECHA_ENTREGA DATE CONSTRAINT PED_FE_NN NOT NULL);
    DESC PEDIDO; 
     
INSERT INTO PEDIDO VALUES(1,'REVELES','JACOBO', 'RAMIRO', 'BOLILLO', 10, '08/12/2017');
INSERT INTO PEDIDO VALUES(2,'PRIETO','MORALES', 'PATRICIA', 'CONCHA', 5, '12/01/2017');
INSERT INTO PEDIDO VALUES(3,'LUMBRERAS','JARAMILLO', 'JUAN', 'POLVORON', 15, '18/02/2018');
INSERT INTO PEDIDO VALUES(4,'REVELES','JACOBO', 'REGALADO', 'CAMPECHANA', 12, '17/02/2018');
INSERT INTO PEDIDO VALUES(5,'LECHUGA','REVELES', 'BLANCA', 'EMPANADA', 13, '25/12/2018');
SELECT * FROM PEDIDO;

CREATE TABLE VENTA(
  ID_EM NUMBER(4) CONSTRAINT VEN_IDEM_NN NOT NULL,
  FOLIO NUMBER(4) CONSTRAINT VEN_FOLIO_NN NOT NULL,
  ID_PANADERO NUMBER (4) CONSTRAINT VEN_IDPANA_NN NOT NULL,
  ID_PAN NUMBER (4) CONSTRAINT VEN_IDPAN_NN NOT NULL,
  ID_MAQUINA NUMBER (4) CONSTRAINT VEN_IDMAQ_NN NOT NULL,
  ID_PROVEEDOR NUMBER (4) CONSTRAINT VEN_IDPRO_NN NOT NULL,
  ID_MATERIAL NUMBER (4) CONSTRAINT VEN_IDMAT_NN NOT NULL,
  ID_ENCARGADO NUMBER (4) CONSTRAINT VEN_IDENC_NN NOT NULL,
  
  CONSTRAINT VENTA_PK PRIMARY KEY (ID_EM, FOLIO, ID_PANADERO, ID_PAN, ID_MAQUINA, ID_PROVEEDOR, ID_MATERIAL, ID_ENCARGADO),
  CONSTRAINT EM_VEN_FK FOREIGN KEY (ID_EM)REFERENCES EMPLEADO_MOSTRADOR(ID_EM),
  CONSTRAINT FOLIO_VEN_FK FOREIGN KEY (FOLIO) REFERENCES PEDIDO(FOLIO),
  CONSTRAINT PANA_VEN_FK FOREIGN KEY (ID_PANADERO) REFERENCES PANADERO(ID_PANADERO),
  CONSTRAINT PAN_VEN_FK FOREIGN KEY (ID_PAN) REFERENCES PAN(ID_PAN),
  CONSTRAINT MAQ_VEN_FK FOREIGN KEY (ID_MAQUINA) REFERENCES MAQUINA(ID_MAQUINA),
  CONSTRAINT DIS_VEN_FK FOREIGN KEY (ID_PROVEEDOR, ID_MATERIAL, ID_ENCARGADO) REFERENCES DISTRIBUCION(ID_PROVEEDOR, ID_MATERIAL, ID_ENCARGADO) 
  );
DESC VENTA;
INSERT INTO VENTA VALUES(1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO VENTA VALUES(2, 2, 2, 2, 2, 2, 2, 2);
INSERT INTO VENTA VALUES(3, 3, 3, 3, 3, 3, 3, 3);
INSERT INTO VENTA VALUES(4, 4, 4, 4, 4, 4, 4, 4);
INSERT INTO VENTA VALUES(5, 5, 5, 5, 5, 5, 5, 5);
SELECT * FROM VENTA;

CREATE TABLE EMPLEADO_REPARTIDOR(
    ID_ER NUMBER(4) CONSTRAINT ER_PK PRIMARY KEY,
    APATERNO VARCHAR2(20) CONSTRAINT ER_AP_NN NOT NULL,
    AMATERNO VARCHAR2(20) CONSTRAINT ER_AM_NN NOT NULL,
    NOMBRE VARCHAR2(25) CONSTRAINT ER_NOM_NN NOT NULL,
    EDAD NUMBER(2) CONSTRAINT ER_EDAD_CK CHECK (EDAD >= 18),
    SALARIO NUMBER(4) CONSTRAINT ER_SAL_NN NOT NULL );
    DESC EMPLEADO_REPARTIDOR; 
INSERT INTO EMPLEADO_REPARTIDOR VALUES(1, 'JARA', 'CASTILLO', 'ALBERTO', 25, 1500); 
INSERT INTO EMPLEADO_REPARTIDOR VALUES(2, 'MARIN', 'POOL', 'LUIS', 32, 1200);
INSERT INTO EMPLEADO_REPARTIDOR VALUES(3, 'GARCIA', 'SALINAS', 'JOSE', 27, 2000);
INSERT INTO EMPLEADO_REPARTIDOR VALUES(4, 'LUMBRERAS', 'LOPEZ', 'CELINA', 25, 2200);
INSERT INTO EMPLEADO_REPARTIDOR VALUES(5, 'POOL', 'CISNEROS', 'ANGEL', 27, 2300);
SELECT * FROM EMPLEADO_REPARTIDOR;

CREATE TABLE TIENDA(
    ID_TIENDA NUMBER(4) CONSTRAINT TIE_PK PRIMARY KEY,
    NOMBRE VARCHAR2(25) CONSTRAINT TIE_NOM_NN NOT NULL,
    COMUNIDAD VARCHAR2(25) CONSTRAINT TIE_COM_NN NOT NULL,
    DOMICILIO VARCHAR2(50)  CONSTRAINT TIE_DOM_NN NOT NULL
    );
    DESC TIENDA; 
INSERT INTO TIENDA VALUES(1, 'LA ESPIGA', 'ZACATECAS', 'Av San Marcos 407, Zona A, Minera, 98050');
INSERT INTO TIENDA VALUES(2, 'OLIVERS', 'GUADALUPE', 'Ancha 116, 5 Se�ores, 98089');
INSERT INTO TIENDA VALUES(3, 'JESSICA',	'ZACATECAS', 'Plazuela Genaro Codina 106');
INSERT INTO TIENDA VALUES(4, 'PETER PAN', 'LOMAS DEL LAGO', '�Lago de Chapala 141, Zona A');
INSERT INTO TIENDA VALUES(5, 'DORA', 'MECANICOS', 'Mercado de Abastos 4, Zona A');
SELECT * FROM TIENDA;

CREATE TABLE VEHICULO(
  ID_VEHICULO NUMBER(4) CONSTRAINT VEHICULO_PK PRIMARY KEY,
  MARCA VARCHAR2(30) CONSTRAINT VE_MA_NN NOT NULL,
  MODELO VARCHAR2(25) CONSTRAINT VE_MO_NN NOT NULL,
  A�O NUMBER(4) CONSTRAINT VE_A�_NN NOT NULL);
DESC VEHICULO;

INSERT INTO VEHICULO VALUES(1, 'FORD', 'FOCUS', 2017);
INSERT INTO VEHICULO VALUES(2, 'NISSAN', 'FIESTA', 2010);
INSERT INTO VEHICULO VALUES(3, 'CHEVROLET', 'CAMARO',2012);
INSERT INTO VEHICULO VALUES(4, 'VOLKSWAGEN', 'JETTA', 2013);
INSERT INTO VEHICULO VALUES(5, 'HYUNDAI', 'MISUBISI',2014);

CREATE TABLE REPARTICION(
  ID_ER NUMBER(4) CONSTRAINT REP_IDER_NN NOT NULL,
  ID_TIENDA NUMBER (4) CONSTRAINT REP_IDTIE_NN NOT NULL,
  ID_VEHICULO NUMBER(4) CONSTRAINT REP_IDVE_NN NOT NULL,
  ID_PANADERO NUMBER (4) CONSTRAINT REP_IDPANA_NN NOT NULL,
  ID_PAN NUMBER (4) CONSTRAINT REP_IDPAN_NN NOT NULL,
  ID_MAQUINA NUMBER (4) CONSTRAINT REP_IDMAQ_NN NOT NULL,
  ID_PROVEEDOR NUMBER (4) CONSTRAINT REP_IDPRO_NN NOT NULL,
  ID_MATERIAL NUMBER (4) CONSTRAINT REP_IDMAT_NN NOT NULL,
  ID_ENCARGADO NUMBER (4) CONSTRAINT REP_IDENC_NN NOT NULL,
  
  CONSTRAINT REPARTICION_PK PRIMARY KEY (ID_ER, ID_TIENDA, ID_VEHICULO, ID_PANADERO, ID_PAN, ID_MAQUINA, ID_PROVEEDOR, ID_MATERIAL, ID_ENCARGADO),
  CONSTRAINT ER_REP_FK FOREIGN KEY (ID_ER)REFERENCES EMPLEADO_REPARTIDOR(ID_ER),
  CONSTRAINT TIENDA_REP_FK FOREIGN KEY (ID_TIENDA) REFERENCES TIENDA(ID_TIENDA),
  CONSTRAINT VE_REP_FK FOREIGN KEY(ID_VEHICULO) REFERENCES VEHICULO(ID_VEHICULO),
  CONSTRAINT PANA_REP_FK FOREIGN KEY (ID_PANADERO) REFERENCES PANADERO(ID_PANADERO),
  CONSTRAINT PAN_REP_FK FOREIGN KEY (ID_PAN) REFERENCES PAN(ID_PAN),
  CONSTRAINT MAQ_REP_FK FOREIGN KEY (ID_MAQUINA) REFERENCES MAQUINA(ID_MAQUINA),
  CONSTRAINT DIS_REP_FK FOREIGN KEY (ID_PROVEEDOR, ID_MATERIAL, ID_ENCARGADO) REFERENCES DISTRIBUCION(ID_PROVEEDOR, ID_MATERIAL, ID_ENCARGADO) );
DESC REPARTICION;
INSERT INTO REPARTICION VALUES(1, 1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO REPARTICION VALUES(2, 2, 2, 2, 2, 2, 2, 2, 2);
INSERT INTO REPARTICION VALUES(3, 3, 3, 3, 3, 3, 3, 3, 3);
INSERT INTO REPARTICION VALUES(4, 4, 4, 4, 4, 4, 4, 4, 4);
INSERT INTO REPARTICION VALUES(5, 5, 5, 5, 5, 5, 5, 5, 5);
SELECT * FROM REPARTICION;

--Modificaci�n de datos
--1.- Aumentar SALARIO de un panadero.
UPDATE PANADERO SET SALARIO = 2100 WHERE ID_PANADERO = 5; 
SELECT * FROM PANADERO;
--2.- Modificar el apellido paterno de un proveedor.
UPDATE PROVEEDOR SET APATERNO= 'RAMIREZ' WHERE ID_PROVEEDOR = 3; 
SELECT *FROM PROVEEDOR;
--3.- Modificar la edad de un empleado de mostrador.
UPDATE EMPLEADO_MOSTRADOR SET EDAD = 49  WHERE ID_EM = 5; 
SELECT *FROM EMPLEADO_MOSTRADOR;
--4.- Modificar la fecha de entrega de un pedido.
UPDATE PEDIDO SET FECHA_ENTREGA = '11/02/2016' WHERE FOLIO = 2; 
SELECT *FROM PEDIDO;
--5.- Se le dar� un bono extra a un empleado repartidor de 500 pesos.
UPDATE EMPLEADO_REPARTIDOR SET SALARIO = SALARIO+500 WHERE ID_ER = 2; 
SELECT *FROM EMPLEADO_REPARTIDOR;
--6.- El proveedor 1 tiene mal escrito su nombre
UPDATE PROVEEDOR SET NOMBRE='SERGIO' WHERE ID_PROVEEDOR = 1;
SELECT *FROM PROVEEDOR;
--7.- Las conchas aumentaron su precio 2 pesos.
UPDATE PAN SET COSTO=COSTO+2 WHERE ID_PAN= 2; 
SELECT * FROM PAN;
--8.-La tienda JESSICA cambi� de nombre a LUPITA.
UPDATE TIENDA SET NOMBRE='LUPITA' WHERE NOMBRE='JESSICA'; 
SELECT *FROM TIENDA;
--9.- Quedan disponibles 2 kg de huevo.
UPDATE MATERIAL SET DISPONIBLES= 2 WHERE NOMBRE = 'HUEVO'; 
SELECT *FROM MATERIAL;
--10.- El cliente 2, compr� 5 conchas m�s.
UPDATE PEDIDO SET CANTIDAD=CANTIDAD+5 WHERE FOLIO=2; 
SELECT *FROM PEDIDO;

--Eliminaci�n de datos
--1.- Eliminar la tienda DORA.
SELECT  * FROM TIENDA;
DELETE FROM TIENDA WHERE ID_TIENDA = 'DORA';
--2.- Eliminar empleado de mostrador 3.
DELETE FROM EMPLEADO_MOSTRADOR WHERE ID_EM = 3; 
--3.- Eliminar el proveedor 1.
DELETE FROM PROVEEDOR WHERE ID_PROVEEDOR= 1;
--4.- Eliminar empleado que no haya vendido.
DELETE FROM EMPLEADO_MOSTRADOR WHERE ID_EM NOT IN (SELECT ID_EM FROM VENTA);
--5.- Eliminar el veh�culo que menos reparte.
DELETE FROM VEHICULO WHERE ID_VEHICULO NOT IN (SELECT ID_VEHICULO FROM REPARTICION);
--6.- Eliminar pedido con menos ventas.
DELETE FROM PEDIDO WHERE FOLIO NOT IN (SELECT FOLIO FROM VENTA);
--7.- Eliminar proveedor inactivo.
DELETE FROM PROVEEDOR WHERE ID_PROVEEDOR NOT IN (SELECT ID_PROVEEDOR FROM DISTRIBUCION);
--8.- Eliminar los polvorones.
DELETE FROM PAN WHERE NOMBRE ='POLVORON';
--9.- Eliminar panadero inactivo.
DELETE FROM PANADERO WHERE ID_PANADERO NOT IN (SELECT ID_PANADERO FROM FABRICACION);
--10.- Eliminar empleado de mostrador que no vende.
DELETE FROM EMPLEADO_MOSTRADOR WHERE ID_EM NOT IN (SELECT ID_EM FROM VENTA);

--Consultar datos
--1. Consultar los datos generales de todos los clientes
SELECT FOLIO, AMATERNO_CLIENTE, APATERNO_CLIENTE, NOMBRE_CLIENTE FROM PEDIDO;

--2. Consultar el nombre completo de los proveedores en una sola columna
SELECT APATERNO || ' ' || AMATERNO || ' ' || NOMBRE AS "NOMBRE COMPLETO" FROM PROVEEDOR;

--3. Consultar el salario anual de los panaderos
SELECT APATERNO || ' ' || AMATERNO || ' ' || NOMBRE AS "NOMBRE COMPLETO", SALARIO *24 AS "SALARIO ANUAL" FROM PANADERO;

--4. Consultar los datos generalesde todos los vehiculos de una determinada marca
SELECT * FROM VEHICULO WHERE MARCA = 'FORD';

--5.Consultar los datos generales de los empleados de mostrador cuyo salario est� entre 1500 y 1900.
SELECT * FROM EMPLEADO_MOSTRADOR WHERE SALARIO BETWEEN 1500 AND 1900;

--6.Consultar el total de ventas realizadas.
SELECT COUNT(*) AS TOTAL_DE_VENTAS FROM VENTA;

--7. Consultar el total de tiendas registradas de cada comunidad.
SELECT COMUNIDAD, COUNT(*) AS TOTAL FROM TIENDA GROUP BY COMUNIDAD;

--8. Consultar el total de ventas que ha hecho cada empleado de mostrador.
SELECT NOMBRE, APATERNO,AMATERNO, COUNT(*) AS TOTAL_DE_VENTAS
FROM EMPLEADO_MOSTRADOR EM JOIN VENTA V 
     ON EM.ID_EM= V.ID_EM
GROUP BY NOMBRE, APATERNO,AMATERNO; 

--9.- Consultar el nombre de los empleados repartidores que no han vendido repartido nada
SELECT APATERNO ||' '|| AMATERNO ||' '|| NOMBRE AS NOMBRE_COMPLETO FROM EMPLEADO_REPARTIDOR WHERE ID_ER NOT IN (SELECT ID_ER FROM REPARTICION);
     
--10. Consultar el nombre completo del empleado de mostrador que m�s vende.
SELECT NOMBRE, APATERNO,AMATERNO, COUNT(*) AS TOTAL_VENTAS
FROM EMPLEADO_MOSTRADOR EM JOIN VENTA V
     ON EM.ID_EM = V.ID_EM
GROUP BY NOMBRE, APATERNO,AMATERNO
HAVING COUNT(*) =(
SELECT MAX(COUNT(*)) AS TOTAL
FROM EMPLEADO_MOSTRADOR EM JOIN VENTA V 
     ON EM.ID_EM = V.ID_EM
GROUP BY NOMBRE, APATERNO,AMATERNO);

--11. Consultar el nombre completo del empleado repartidor que m�s reparte.
SELECT NOMBRE, APATERNO,AMATERNO, COUNT(*) AS REPARTICIONES
FROM EMPLEADO_REPARTIDOR ER JOIN REPARTICION R
     ON ER.ID_ER = R.ID_ER
GROUP BY NOMBRE, APATERNO,AMATERNO
HAVING COUNT(*) =(
SELECT MAX(COUNT(*)) AS TOTAL
FROM EMPLEADO_REPARTIDOR ER JOIN REPARTICION R
     ON ER.ID_ER = R.ID_ER
GROUP BY NOMBRE, APATERNO,AMATERNO);

--12. Consultar el nombre completo del empleado repartidor que menos reparte.
SELECT NOMBRE, APATERNO,AMATERNO, COUNT(*) AS REPARTICIONES
FROM EMPLEADO_REPARTIDOR ER JOIN REPARTICION R
     ON ER.ID_ER = R.ID_ER
GROUP BY NOMBRE, APATERNO,AMATERNO
HAVING COUNT(*) =(
SELECT MIN(COUNT(*)) AS TOTAL
FROM EMPLEADO_REPARTIDOR ER JOIN REPARTICION R
     ON ER.ID_ER = R.ID_ER
GROUP BY NOMBRE, APATERNO,AMATERNO);

--13. Consultar el nombre completo del empleado de mostrador que menos vende.
SELECT NOMBRE, APATERNO,AMATERNO, COUNT(*) AS TOTAL_VENTAS
FROM EMPLEADO_MOSTRADOR EM JOIN VENTA V
     ON EM.ID_EM = V.ID_EM
GROUP BY NOMBRE, APATERNO,AMATERNO
HAVING COUNT(*) =(
SELECT MIN(COUNT(*)) AS TOTAL
FROM EMPLEADO_MOSTRADOR EM JOIN VENTA V 
     ON EM.ID_EM = V.ID_EM
GROUP BY NOMBRE, APATERNO,AMATERNO);

--14. Consultar el nombre completo del empleado que menos p�lizas ha vendido.
SELECT ID_AGENTE, COUNT(*) AS TOTAL_VENTAS
FROM POLIZA C JOIN ACCIDENTE CA 
     ON C.FOLIO = CA.FOLIO
     GROUP BY ID_AGENTE
HAVING COUNT(*) = (
SELECT MIN(COUNT(*)) AS TOTAL
FROM POLIZA C JOIN ACCIDENTE CA 
     ON C.FOLIO = CA.FOLIO
     GROUP BY ID_AGENTE);
     
 --15. Mostrar los panaderos cuyo nombre empiecen con �A�.
SELECT * FROM PANADERO WHERE NOMBRE LIKE 'A%';
--16. Consultar el total de panes diferentes existentes.
 SELECT COUNT (*) TOTAL FROM PAN;
 --17.- Nombre de encargados mayores de 35 a�os.
SELECT APATERNO || ' ' || AMATERNO || ' ' || NOMBRE AS NOMBRE_COMPLETO FROM ENCARGADO where EDAD> 35;
--18.- Mostrar los vehiculos cuyo id est� entrE 2 Y 5.
SELECT * FROM VEHICULO WHERE ID_VEHICULO BETWEEN 2 AND 5;
--19.- Mostrar los panes con un precio mayor a 4 pesos.
select NOMBRE from PAN where COSTO > 4;
--20.- Mostrar los nombres de las maquinas que sus nombres tengan �b�.
SELECT * FROM MAQUINA WHERE NOMBRE LIKE 'B%';