
CREATE TABLE PROVEDOR( 
ID_PROVEDOR NUMBER(10) CONSTRAINT P_IDP_NN NOT NULL,
NOM_PROVEDOR varchar2 (50) CONSTRAINT P_NOP_NN NOT NULL,
TELEFONO varchar2 (50) CONSTRAINT P_TEL_NN NOT NULL,
DIRECCION varchar2 (50) CONSTRAINT P_DIR_NN NOT NULL,
CORREOE varchar2 (50) CONSTRAINT P_COR_NN NOT NULL,
CONSTRAINT PROVEDOR_PK PRIMARY KEY (ID_PROVEDOR)
);

CREATE TABLE CLIENTE ( 
ID_CLIENTE NUMBER (10) CONSTRAINT C_IDC_NN NOT NULL,
NOM_CLIENTE varchar2 (50) CONSTRAINT C_NOC_NN NOT NULL,
TELEFONO varchar2 (50) CONSTRAINT C_TEL_NN NOT NULL,
DIRECCION varchar2 (50) CONSTRAINT C_DIR_NN NOT NULL,
CORREOE varchar2 (50) CONSTRAINT C_COR_NN NOT NULL,
FECHANA DATE CONSTRAINT C_FE_NN NOT NULL,
CONSTRAINT CLIENTE_PK PRIMARY KEY (ID_CLIENTE)
);

CREATE TABLE EMPLEADO ( 
ID_EMPLEADO NUMBER (10) CONSTRAINT E_IDE_NN NOT NULL,
NOM_EMPLEADO varchar2 (50) CONSTRAINT E_NOE_NN NOT NULL,
TELEFONO varchar2 (50) CONSTRAINT E_TEL_NN NOT NULL,
DIRECCION varchar2 (50) CONSTRAINT E_DIR_NN NOT NULL,
CORREOE varchar2 (50) CONSTRAINT E_COR_NN NOT NULL,
FECHANA DATE CONSTRAINT E_FE_NN NOT NULL,
SUELDO NUMBER (10) CONSTRAINT E_S_NN NOT NULL,
CONSTRAINT EMPLEADO_PK PRIMARY KEY (ID_EMPLEADO)
);

CREATE TABLE FARMACIA ( 
ID_FARMACIA NUMBER (10) CONSTRAINT F_IDF_NN NOT NULL,
NOM_FARMACIA varchar2 (50) CONSTRAINT F_NOF_NN NOT NULL,
TELEFONO varchar2 (50) CONSTRAINT F_TEL_NN NOT NULL,
DIRECCION varchar2 (50) CONSTRAINT F_DIR_NN NOT NULL,
CORREOE varchar2 (50) CONSTRAINT F_COR_NN NOT NULL,
CONSTRAINT FARMACIA_PK PRIMARY KEY (ID_FARMACIA)
);

CREATE TABLE PRODUCTO( 
ID_PRODUCTO NUMBER(10) CONSTRAINT PR_IDPR_NN NOT NULL,
NOM_PRODUCTO varchar2 (50) CONSTRAINT PR_NOMP_NN NOT NULL,
MARCA varchar2 (50) CONSTRAINT PR_MARC_NN NOT NULL,
ID_TIPO NUMBER (10) CONSTRAINT PR_IDTI_NN NOT NULL,
COSTO NUMBER (10) CONSTRAINT PR_COS_NN NOT NULL,
CONSTRAINT PRODUCTO_PK PRIMARY KEY (ID_PRODUCTO),
CONSTRAINT TIPO_PRODUCTO_FK FOREIGN KEY (ID_TIPO)  REFERENCES TIPO(ID_TIPO)
);

CREATE TABLE TIPO ( 
ID_TIPO NUMBER (10) CONSTRAINT T_IDT_NN NOT NULL,
DESCRIPCION varchar2 (100) CONSTRAINT T_DES_NN NOT NULL,
CONSTRAINT TIPO_PK PRIMARY KEY (ID_TIPO)
);



CREATE TABLE SURTE ( 
ID_SURTE NUMBER (10) CONSTRAINT S_IDS_NN NOT NULL,
ID_FARMACIA NUMBER (10) CONSTRAINT S_IDF_NN NOT NULL,
ID_PROVEDOR NUMBER (10) CONSTRAINT S_IDP_NN NOT NULL,
CONSTRAINT SURTE_PK PRIMARY KEY (ID_SURTE),
CONSTRAINT PROVEDOR_FK FOREIGN KEY (ID_PROVEDOR)  REFERENCES PROVEDOR (ID_PROVEDOR),
CONSTRAINT FARMACIA_FK FOREIGN KEY (ID_FARMACIA)  REFERENCES FARMACIA (ID_FARMACIA)
);

CREATE TABLE COMPRA ( 
ID_COMPRA NUMBER (10) CONSTRAINT CO_IDCO_NN NOT NULL,
ID_CLIENTE NUMBER (10) CONSTRAINT CO_IDCL_NN NOT NULL,
ID_ATIENDE NUMBER (10) CONSTRAINT CO_IDAT_NN NOT NULL,
ID_PRODUCTO NUMBER (10) CONSTRAINT CO_IDP_NN NOT NULL,
CONSTRAINT COMPRA_PK PRIMARY KEY (ID_COMPRA),
CONSTRAINT CLIENTE_COMPRA_FK FOREIGN KEY (ID_CLIENTE)  REFERENCES CLIENTE (ID_CLIENTE),
CONSTRAINT ATIENDE_COMPRA_FK FOREIGN KEY (ID_ATIENDE)  REFERENCES ATIENDE (ID_ATIENDE),
CONSTRAINT PRODUCTO_COMPRA_FK FOREIGN KEY (ID_PRODUCTO)  REFERENCES PRODUCTO (ID_PRODUCTO)

);
CREATE TABLE ATIENDE( 
ID_ATIENDE NUMBER (10) CONSTRAINT AT_IDAT_NN NOT NULL,
ID_FARMACIA NUMBER (10) CONSTRAINT AT_IDFA_NN NOT NULL,
ID_EMPLEADO NUMBER (10) CONSTRAINT AT_IDEM_NN NOT NULL,
CONSTRAINT ATIENDE_PK PRIMARY KEY (ID_ATIENDE),
CONSTRAINT EMPLEADO_ATIENDE_FK FOREIGN KEY (ID_EMPLEADO)  REFERENCES EMPLEADO(ID_EMPLEADO),
CONSTRAINT FARMACIA_ATIENDE_FK FOREIGN KEY (ID_FARMACIA)  REFERENCES FARMACIA(ID_FARMACIA) 
);

/*INSERCIONES*/

/*Tabla proveedor */
INSERT INTO PROVEDOR VALUES (001,'Federico Gonz�lez Reyes','4921399529','Venustiano Carranza 2, centro, Zac, Zac','fesd3@gmail.com');
INSERT INTO PROVEDOR VALUES (010,'Mario Flores Hernandez','4921379569','Fco. I Madero 5, centro, Guadalupe, Zac','darksid3@hotmail.com');
INSERT INTO PROVEDOR VALUES (011,'Juan P�rez Barron','4471294529','Gonzalez Ortega 4, centro, Zac, Zac','juanp3@gmail.com');
INSERT INTO PROVEDOR VALUES (100, 'Josu� Gonz�lez Reyes','4581392524','Venustiano Carranza 2, centro, Zac, Zac','d03te@hotmail.com');
INSERT INTO PROVEDOR VALUES (101,'Antonio �vila Rojas','4221169529','Guerrero 32, tres cruces, Zac, Zac','AnArojas@gmail.com');
select * from provedor;

/*Tabla cliente*/
INSERT INTO CLIENTE VALUES (001,'Nelson P. Gipson','408-496-6783 ',' Ford Street Santa Clara, CA 95054 ',' NelsonPGipson@superrito.com ',' 04/09/78');
INSERT INTO CLIENTE VALUES (002,' Karen V. Howard ','612-870-4059',' Rocket Drive Minneapolis, MN 55404',' KarenVHoward@gmail.com',' 11/10/88');
INSERT INTO CLIENTE VALUES (003,' Noelino Pizarro Zedillo ',' 804-503-8636 ',' Biddie Lane Richmond, VA 23224 ',' NoelinoPizarroSedillo@gustr.com',' 01/10/92');
INSERT INTO CLIENTE VALUES (004,' Roxanne Carranza Corral',' 207-829-6452',' El Roqueo, 25 15911 Rois ',' AnushCandelariaVela@hotmail.com ',' 02/01/51');
INSERT INTO CLIENTE VALUES (005,'Jos� mar�a Santill�n Galv�n',' 691 835 644',' Pza. Fuensanta, 33 32212  ',' JosemariaSantillanGalvan@gustr.com',' 02/03/84');
select * from cliente;




/*Tabla empleado*/
INSERT INTO EMPLEADO VALUES (001,' Ian Aponte Noriega',' 764 633 004 ',' Fuente del Gallo, 58 14860 Do�a Mec�a',' IanAponteNoriega@gmail.com',' 19/01/88',1200);
INSERT INTO EMPLEADO VALUES (002,' Agenor Qui�ones Anaya',' 739 741 385 ', 'Crta. C�diz-M�laga, 97 12230 Toga', 'AgenorQuinonesAnaya@superrito.com',' 10/10/83',1300);
INSERT INTO EMPLEADO VALUES (003,' Teolinda Trujillo Carre�n',' 657 804 125 ',' Ctra. de Siles, 84 27320 Quiroga',' TeolindaCarreon@hotmail.com',' 11/04/62',1200);
INSERT INTO EMPLEADO VALUES (004,'Jaqueline Cuellar Lovato',' 561-739-9123 ',' 162 Mulberry Lane Boynton Beach, FL 33435 ',' JaquelineCuellarLovato@gustr.com',' 02/01/51',1300);
INSERT INTO EMPLEADO VALUES (005,' Jos� P�rez Galv�n',' 391 335 544',' 2047 Francis Mine Redding, CA 96003 ',' JoseGalvan@gmail.com',' 01/01/64',1000);
select * from empleado;

/*Tabla farmacia*/
INSERT INTO FARMACIA VALUES (101,' Farmacias Unidas 101 ',' 964 333 101 ',' Avenida El Bouzidi No. 3, Guadalupe, Zac',' dwbucsa101@yopmail.com');
INSERT INTO FARMACIA VALUES (212,' Farmacias Unidas 212 ',' 244 583 516 ',' Cerrada Gabarain No. 180 Guadalupe, Zac',' farbucsa212@yopmail.com');
INSERT INTO FARMACIA VALUES (545,' Farmacias Unidas 545 ',' 921 583 213 ',' Real del Yanez No. 863 Zacatecas, Zac',' fdocbucsa545@yopmail.com');
INSERT INTO FARMACIA VALUES (325,' Farmacias Unidas 325 ',' 931 485 751 ',' Real del Amesti No. 941  Fresnillo, Zac','fsocbucsa325@yopmail.com');
INSERT INTO FARMACIA VALUES (125,' Farmacias Unidas 125 ',' 931 475 838 ',' Privada Guindal No. 415 Zacatecas, Zac',' zzaocbucsa125@yopmail.com');
select* from farmacia;


/*Tabla tipo*/
INSERT INTO TIPO VALUES (01,'Medicamento para Ni�os');
INSERT INTO TIPO VALUES (02,'Medicamento para Adultos');
INSERT INTO TIPO VALUES (03,'Medicamento para Ancianos');
select * from tipo;


/*Tabla producto*/
INSERT INTO PRODUCTO VALUES (0020,'Vitamina C ',' Morita ', 01,75);
INSERT INTO PRODUCTO VALUES (0030,'Paracetamol  A',' SyN ', 02,40);
INSERT INTO PRODUCTO VALUES (0040,' Suero Fresa',' G. labs ', 01,35);
INSERT INTO PRODUCTO VALUES (0050,' Calcio Ad ',' C. Emps ', 03,125);
INSERT INTO PRODUCTO VALUES (0060,' Ranitidina 500 ',' G. labs ', 02,25);
select * from producto;

/*Tabla surte*/
INSERT INTO SURTE VALUES (015, 212, 010);
INSERT INTO SURTE VALUES (016, 545, 100);
INSERT INTO SURTE VALUES (017, 125, 101);
INSERT INTO SURTE VALUES (018, 325, 101);
INSERT INTO SURTE VALUES (019, 101, 001);
select * from surte;

/*Tabla atiende*/
INSERT INTO ATIENDE VALUES (10, 212, 001);
INSERT INTO ATIENDE VALUES (11, 125, 005);
INSERT INTO ATIENDE VALUES (12, 101, 002);
INSERT INTO ATIENDE VALUES (13, 325, 004);
INSERT INTO ATIENDE VALUES (14, 545, 003);
select * from atiende;

/*Tabla compra*/
INSERT INTO COMPRA VALUES (100, 001, 10, 0040);
INSERT INTO COMPRA VALUES (101, 002, 10, 0020);
INSERT INTO COMPRA VALUES (102, 003, 14, 0050);
INSERT INTO COMPRA VALUES (103, 003, 11, 0060);
INSERT INTO COMPRA VALUES (104, 001, 12, 0030);
select * from compra;

UPDATE EMPLEADO SET SUELDO=1500 WHERE ID_EMPLEADO = '001';
select*from empleado;