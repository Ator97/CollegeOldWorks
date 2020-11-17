---------------------------------------------
 --      Oscar Gutiérrez Castillo           --
 --      Jorge Luis Chavez Delgado          --
 --      Programa de Tecnología            --
 --            en Computo                    --
 ---------------------------------------------

---------Creacion de las tablas-------------------- (25%)

--Tabla 1--
CREATE TABLE catalogo_marca(
	id_marca NUMBER(5) PRIMARY KEY,
	clave VARCHAR(3)  NOT NULL,
	descripcion VARCHAR(20) NOT NULL
);
--Tabla 2--
CREATE TABLE catalogo_modelos(
	id_modelos NUMBER(5) PRIMARY KEY,	
	clave VARCHAR(3) NOT NULL,	descripcion VARCHAR(20) NOT NULL,	
	id_marca NUMBER(5) NOT NULL,		
		CONSTRAINT fk_id_marca FOREIGN KEY (id_marca) REFERENCES catalogo_marca(id_marca)
);
--Table 3--
CREATE TABLE catalogo_estados(
	id_estados NUMBER(5) PRIMARY KEY,
	descripcion VARCHAR(30) NOT NULL
);
--Table 4--
CREATE TABLE catalogo_tipo_seguro(
	id_seguro NUMBER(5) PRIMARY KEY,
	clave VARCHAR(4) NOT NULL,
	descripcion VARCHAR(20) NOT NULL
);
--Table 5--
CREATE TABLE cotizacion (
	id_cotizacion NUMBER(4) PRIMARY KEY,
	cp NUMBER(5) NOT NULL,
	edad NUMBER(3) NOT NULL,
	anno_am DATE NOT NULL,	
	id_marca NUMBER(5) NOT NULL,
	id_modelos NUMBER(5) NOT NULL,
	id_estados NUMBER(5) NOT NULL,
	id_seguro  NUMBER(5) NOT NULL,
		CONSTRAINT fk_id_marcas FOREIGN  KEY (id_marca) REFERENCES catalogo_marca(id_marca),
		CONSTRAINT fk_id_modelos FOREIGN KEY (id_modelos) REFERENCES catalogo_modelos(id_modelos),
		CONSTRAINT fk_id_estados FOREIGN KEY (id_estados) REFERENCES catalogo_estados(id_estados),
		CONSTRAINT fk_id_seguro FOREIGN KEY (id_seguro) REFERENCES catalogo_tipo_seguro(id_seguro),
	costo NUMBER(10,3) NOT NULL
);
--Table 6--
CREATE TABLE cliente(
	id_cliente NUMBER(4) PRIMARY KEY,
	nombre VARCHAR(20) NOT NULL,
	a_paterno VARCHAR(20) NOT NULL,
	a_materno VARCHAR(20) NOT NULL,
	RFC VARCHAR(12) NOT NULL,
	email VARCHAR(40) NOT NULL,
	direccion VARCHAR(80) NOT NULL
);
--Table 7--
CREATE TABLE tarjeta_credito(
	id_tarjeta NUMBER(5) PRIMARY KEY,
	n_tarjeta NUMBER(16) NOT NULL ,
	tipo VARCHAR(20) NOT NULL ,
	mes_expiracion NUMBER(2) NOT NULL,
	annio_expiraicon NUMBER(2) NOT NULL,
	n_seguridad NUMBER(3) NOT NULL
);
--Table 8--
CREATE TABLE poliza(
	folio NUMBER(13) PRIMARY KEY,
	f_inicio DATE NOT NULL,
	h_inicio DATE NOT NULL,
	f_fin DATE NOT NULL,
	h_fin DATE NOT NULL,
	n_placas NUMBER(7) NOT NULL,
	n_serie NUMBER(20) NOT NULL,
	id_cotizacion NUMBER(4) NOT NULL,
	id_cliente NUMBER(4) NOT NULL,
		CONSTRAINT fk_id_cotizacion FOREIGN KEY (id_cotizacion) REFERENCES cotizacion(id_cotizacion),
		CONSTRAINT fk_id_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);
--Table 9--
CREATE TABLE general_siniestro(
	id_siniestro NUMBER(2) PRIMARY KEY,
	f_siniestro DATE NOT NULL,
	h_siniestro DATE NOT NULL,
	direccion VARCHAR(50) NOT NULL,
	tipo_danio VARCHAR(50) 
);
--Table 10--  
CREATE TABLE estado_siniestro(
	id_estado NUMBER(5) PRIMARY KEY,
	estado VARCHAR(12) NOT NULL,
	fecha_inicio DATE NOT NULL,
	detalle VARCHAR(12) NOT NULL
);
--Table 11-- 
CREATE TABLE catalogo_aseguradoras (
	id_aseguradora NUMBER(5) PRIMARY KEY,
	nombre VARCHAR(30) NOT NULL,
	descripcion VARCHAR(50) NOT NULL
);
--Table 12--
CREATE TABLE persona(
	CURP VARCHAR(18) PRIMARY KEY,
	descripcion VARCHAR(50) NOT NULL
); 
--Table 13--
CREATE TABLE automoviles_involucrados (
    id_auto_involucrado NUMBER(5) PRIMARY KEY,
    marca VARCHAR(10) NOT NULL,
    modelo VARCHAR(10) NOT NULL,
    n_serie VARCHAR(20) NOT NULL,
    n_poliza NUMBER(13) NULL,
    aseguradora NUMBER(10) NULL,
        CONSTRAINT fk_aseguradora FOREIGN KEY (aseguradora) REFERENCES catalogo_aseguradoras(id_aseguradora)
 );
--Table 14--
 CREATE TABLE siniestro_social(
 	id_social NUMBER(2) PRIMARY KEY,
 	ambulancia VARCHAR(1) NOT NULL,
 	direccion_hospital VARCHAR(70) NOT NULL,
 	id_persona VARCHAR(18) NOT NULL,
 	id_siniestro NUMBER(2) NOT NULL,
 	id_estado_seguro NUMBER(5) NOT NULL,
 		CONSTRAINT fk_id_persona FOREIGN KEY (id_persona) REFERENCES persona(CURP),
 		CONSTRAINT fk_id_siniestro2 FOREIGN KEY (id_siniestro) REFERENCES general_siniestro(id_siniestro),
 		CONSTRAINT fk_id_estado_seguro2 FOREIGN KEY (id_estado_seguro) REFERENCES estado_siniestro(id_estado)
);
 --Table 15--
 CREATE TABLE siniestro_material(
 	id_material NUMBER(2) PRIMARY KEY,
 	descripcion VARCHAR(50) NOT NULL,
 	foto_danio LONG RAW NOT NUll,
 	id_siniestro NUMBER(2) 	NOT NULL,
 	id_estado_seguro NUMBER(5) NOT NULL,
 		CONSTRAINT fk_id_siniestro3 FOREIGN KEY (id_siniestro) REFERENCES general_siniestro(id_siniestro),
 		CONSTRAINT fk_id_estado_seguro3 FOREIGN KEY (id_estado_seguro) REFERENCES estado_siniestro(id_estado)
 );
--Table 16--
 CREATE TABLE siniestro_colision(
 	id_colision NUMBER(2) PRIMARY KEY,
 	n_reporte VARCHAR(8) NOT NULL,
 	grua VARCHAR(1) NOT NULL,
 	id_involucrado NUMBER(5) NOT NULL,
 	id_estado_seguro NUMBER(5) NOT NULL,
 	id_siniestro NUMBER(2) NOT NULL,
 	CONSTRAINT fk_id_involucrado FOREIGN KEY (id_involucrado) REFERENCES automoviles_involucrados(id_auto_involucrado),
 	CONSTRAINT fk_id_siniestro FOREIGN KEY (id_siniestro) REFERENCES general_siniestro(id_siniestro),
 	CONSTRAINT fk_id_estado_seguro FOREIGN KEY (id_estado_seguro) REFERENCES estado_siniestro(id_estado)
 );
-------------------------------Fin de la ceacion de tablas ----------------------------------------------

---------------------------------Secuencias para el aumento automatico de los Id's---------------------(5%)

--Secuencia para el catalogo de marcas (Tabla 1)--
CREATE SEQUENCE Seq_marca
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE;
--Secuencia para el catalogo de autos de cada marca (Tabla 2)--
CREATE SEQUENCE Seq_modelo
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE;
--Secuencia para los estados de la repubica (Tabla 3)--
CREATE SEQUENCE Seq_estados
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 31;
--Secuencia para los tipos de catalogo (Tabla 4)--
CREATE SEQUENCE Seq_tipo
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 4;
--Secuencia para las cotizaciones (Tabla 5) --
CREATE SEQUENCE Seq_cotiazcion
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE;
--Secuencia para los clientes (Tabla 6)--
CREATE SEQUENCE Seq_cliente
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE;
--Secuencia para las tarjetas de credito (Tabla 7)--
CREATE SEQUENCE Seq_tc
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE;
--Secuencia para las polizas (Tabla 8)--
CREATE SEQUENCE Seq_poliza
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE;
--Secuencia apra las siniestros reportados por el cliente (Tabla 9)--
CREATE SEQUENCE Seq_siniestros
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE;
--Secuencia para las tablas del estado del siniestro (Tabla 10)--
CREATE SEQUENCE Seq_estado_siniestro
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE;
--Secuencias de las posibles aseguradoras de los demas clintes (Tabla 11)--
CREATE SEQUENCE Seq_catalogo_aseguradoras
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE;
--Seciencia para los automoviles involucrados en el accidente (Tabla 13)--
CREATE SEQUENCE Seq_Auto_invo
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE;
-- Secuencies del siniestro social(Tabla 14)--
CREATE SEQUENCE Seq_siniestro_social
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE;
--Secuencias del siniestro material (Tabla 15)--
CREATE SEQUENCE Seq_siniestro_material
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE;
--Seciencias del siniestro de colision (Tabla 16)--
CREATE SEQUENCE Seq_siniestro_colision
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE;
-----------------------------------------Fin de las secuencias de los ID's--------------------------------------

--------------------------------Creación de sinonimos--------------------------------------------------(5%)

CREATE PUBLIC SYNONYM marcas FOR ORACLE.catalogo_marca;
 CREATE PUBLIC SYNONYM modelos FOR ORACLE.modelo;
 CREATE PUBLIC SYNONYM estados FOR ORACLE.catalogo_estados;
 CREATE PUBLIC SYNONYM seguros FOR ORACLE.seguros;
 CREATE PUBLIC SYNONYM cotizaciones FOR ORACLE.cotizacion;
 CREATE PUBLIC SYNONYM clientes FOR ORACLE.cliente;
 CREATE PUBLIC SYNONYM tarjetas FOR ORACLE.tarjeta_credito;
 CREATE PUBLIC SYNONYM polizas FOR ORACLE.poliza;
 CREATE PUBLIC SYNONYM sin FOR ORACLE.siniestros;
 CREATE PUBLIC SYNONYM edoSiniestros FOR ORACLE.estado_siniestro;
 CREATE PUBLIC SYNONYM t_seguro FOR ORACLE.catalogo_tipo_seguro;
 CREATE PUBLIC SYNONYM aseguradoras FOR ORACLE.catalogo_aseguradoras;
 CREATE PUBLIC SYNONYM personas FOR ORACLE.persona;
 CREATE PUBLIC SYNONYM autoInvolucrados FOR ORACLE.automoviles_involucrados;
 CREATE PUBLIC SYNONYM sinSocial FOR ORACLE.siniestro_social;
 CREATE PUBLIC SYNONYM sinMaterial FOR ORACLE.siniestro_material;
 CREATE PUBLIC SYNONYM sinColision FOR ORACLE.siniestro_colision;


---------------------------------------------------------------------------------------
-----------------------------------Fin de la creación de sinonimos---------------------
---------------------------------------------------------------------------------------
 --------------------------------Poblado  basico de tablas-----------------------------
---------------------------------------------------------------------------------------

-----------------------------Catalogo de las marcas en venta------------------------
INSERT INTO  catalogo_marca VALUES  (Seq_marca.nextval,'VW','Volkswagen');
 INSERT INTO catalogo_marca VALUES  (Seq_marca.nextval,'NSN','Nissan');
 INSERT INTO catalogo_marca VALUES  (Seq_marca.nextval,'FRD','Ford');
 INSERT INTO catalogo_marca VALUES  (Seq_marca.nextval,'AUI','Audi');
 INSERT INTO catalogo_marca VALUES  (Seq_marca.nextval,'FRI','Ferrari');
 INSERT INTO catalogo_marca VALUES  (Seq_marca.nextval,'LBN','Lamborgini');
 INSERT INTO catalogo_marca VALUES  (Seq_marca.nextval,'ABT','Abarth');
 INSERT INTO catalogo_marca VALUES  (Seq_marca.nextval,'ARM','Alfa Romeo');
 INSERT INTO catalogo_marca VALUES  (Seq_marca.nextval,'AMN','Aston Martin');
 INSERT INTO catalogo_marca VALUES  (Seq_marca.nextval,'BTL','Bentley');
 INSERT INTO catalogo_marca VALUES  (Seq_marca.nextval,'BMW','BMW');
 INSERT INTO catalogo_marca VALUES  (Seq_marca.nextval,'BGT','Bugati');
 INSERT INTO catalogo_marca VALUES  (Seq_marca.nextval,'CDC','Cadillac');
 INSERT INTO catalogo_marca VALUES  (Seq_marca.nextval,'CTH','Caterham');
 INSERT INTO catalogo_marca VALUES  (Seq_marca.nextval,'FAT','FIAT');

-----------------Catalogo de los modelos--------------------

INSERT INTO  catalogo_modelos VALUES (Seq_modelo.nextval, 'CON', 'Continental GT',10);
 INSERT INTO catalogo_modelos VALUES (Seq_modelo.nextval, 'MUL', 'Mulssane GT',10);
 INSERT INTO catalogo_modelos VALUES (Seq_modelo.nextval, 'Fly', 'Flying Spur GT',10);
 INSERT INTO catalogo_modelos VALUES (Seq_modelo.nextval, 'FOC', 'Focus',3);
 INSERT INTO catalogo_modelos VALUES (Seq_modelo.nextval, 'KUG', 'Kuga',3);
 INSERT INTO catalogo_modelos VALUES (Seq_modelo.nextval, 'MON', 'Mondeo',3);
 INSERT INTO catalogo_modelos VALUES (Seq_modelo.nextval, 'GUI', 'Guilitteta',8);
 INSERT INTO catalogo_modelos VALUES (Seq_modelo.nextval, 'MiT', 'MiTo',8);
 INSERT INTO catalogo_modelos VALUES (Seq_modelo.nextval, '4C', '4C',8);
 INSERT INTO catalogo_modelos VALUES (Seq_modelo.nextval, 'SEV', 'Seven', 14);
 INSERT INTO catalogo_modelos VALUES (Seq_modelo.nextval, 'CAL', 'California T', 5);
 INSERT INTO catalogo_modelos VALUES (Seq_modelo.nextval, 'BER', 'F12 Berlinetta', 5);
 INSERT INTO catalogo_modelos VALUES (Seq_modelo.nextval, 'GTB', '488 GTB', 5);
 INSERT INTO catalogo_modelos VALUES (Seq_modelo.nextval, 'ESC', 'Escalade', 13);
 INSERT INTO catalogo_modelos VALUES (Seq_modelo.nextval, 'CTS', 'CTS', 13);

-----------------------Catalogo de estados----------------------------
INSERT INTO  catalogo_estados VALUES (Seq_estados.nextval,'Puebla');
 INSERT INTO catalogo_estados VALUES (Seq_estados.nextval,'Tlaxcala');
 INSERT INTO catalogo_estados VALUES (Seq_estados.nextval,'Coahuila');
 INSERT INTO catalogo_estados VALUES (Seq_estados.nextval,'Sinaloa');
 INSERT INTO catalogo_estados VALUES (Seq_estados.nextval,'Yucatan');
 INSERT INTO catalogo_estados VALUES (Seq_estados.nextval,'Quintana Roo');
 INSERT INTO catalogo_estados VALUES (Seq_estados.nextval,'Tabasco');
 INSERT INTO catalogo_estados VALUES (Seq_estados.nextval,'Chiapas');
 INSERT INTO catalogo_estados VALUES (Seq_estados.nextval,'Veracruz');
 INSERT INTO catalogo_estados VALUES (Seq_estados.nextval,'Oaxaca');
 INSERT INTO catalogo_estados VALUES (Seq_estados.nextval,'Baja California');
 INSERT INTO catalogo_estados VALUES (Seq_estados.nextval,'Aguascalientes');
 INSERT INTO catalogo_estados VALUES (Seq_estados.nextval,'Campeche');
 INSERT INTO catalogo_estados VALUES (Seq_estados.nextval,'Colima');
 INSERT INTO catalogo_estados VALUES (Seq_estados.nextval,'Michoacan');

---------------------Catalogo de seguros------------------------	
INSERT INTO catalogo_tipo_seguro VALUES (Seq_tipo.nextval,'CA','Cobertura Amplia');
 INSERT INTO catalogo_tipo_seguro VALUES (Seq_tipo.nextval,'CB','Cobertura Basica');
 INSERT INTO catalogo_tipo_seguro VALUES (Seq_tipo.nextval,'CP','Cobertura Plus');

------------------------Cotizaciones-----------------------------
INSERT INTO  cotizacion  VALUES (Seq_cotiazcion.nextval, 01480, 19, TO_DATE('2003/05/03', 'yyyy/mm/dd'),3,1,4,1  ,100000);
 INSERT INTO cotizacion  VALUES (Seq_cotiazcion.nextval, 45654, 34, TO_DATE('2009/07/16', 'yyyy/mm/dd'),3,2,4,2  ,100000);
 INSERT INTO cotizacion  VALUES (Seq_cotiazcion.nextval, 34576, 54, TO_DATE('2020/01/24', 'yyyy/mm/dd'),3,3,9,3  ,100000);
 INSERT INTO cotizacion  VALUES (Seq_cotiazcion.nextval, 76456, 18, TO_DATE('2012/07/03', 'yyyy/mm/dd'),10,1,10,1,100000);
 INSERT INTO cotizacion  VALUES (Seq_cotiazcion.nextval, 76534, 45, TO_DATE('2000/01/12', 'yyyy/mm/dd'),10,2,3,2 ,100000);
 INSERT INTO cotizacion  VALUES (Seq_cotiazcion.nextval, 76434, 24, TO_DATE('2006/11/08', 'yyyy/mm/dd'),10,3,4,3 ,100000);
 INSERT INTO cotizacion  VALUES (Seq_cotiazcion.nextval, 74453, 26, TO_DATE('2006/12/03', 'yyyy/mm/dd'),8,1,1,1  ,100000);
 INSERT INTO cotizacion  VALUES (Seq_cotiazcion.nextval, 34566, 18, TO_DATE('2003/04/13', 'yyyy/mm/dd'),8,2,4,3  ,100000);
 INSERT INTO cotizacion  VALUES (Seq_cotiazcion.nextval, 23465, 45, TO_DATE('2005/05/03', 'yyyy/mm/dd'),8,3,4,2  ,100000);
 INSERT INTO cotizacion  VALUES (Seq_cotiazcion.nextval, 78645, 23, TO_DATE('2003/03/03', 'yyyy/mm/dd'),10,1,12,2,100000);
 INSERT INTO cotizacion  VALUES (Seq_cotiazcion.nextval, 87645, 18, TO_DATE('2005/07/06', 'yyyy/mm/dd'),10,1,4,2 ,100000);
 INSERT INTO cotizacion  VALUES (Seq_cotiazcion.nextval, 87645, 67, TO_DATE('2009/09/05', 'yyyy/mm/dd'),13,1,13,2,100000);
 INSERT INTO cotizacion  VALUES (Seq_cotiazcion.nextval, 01454, 19, TO_DATE('2010/02/03', 'yyyy/mm/dd'),13,2,2,2 ,100000);

-------------------------------------Clientes--------------------------------------------------------
INSERT INTO   cliente VALUES (Seq_cliente.nextval,'Juan','Ramirez','Castillo','RACJ970503','ejemplo1@gmail.com','Plateros');
 INSERT INTO  cliente VALUES (Seq_cliente.nextval,'Martin','Gonzalez','Perez','GRRG970503','ejemplo2@gmail.com','Rosa');
 INSERT INTO  cliente VALUES (Seq_cliente.nextval,'Ernesto','Martinez','Rodriguez','FDRR900703','ejemplo3@gmail.com','Neza');
 INSERT INTO  cliente VALUES (Seq_cliente.nextval,'Emma','Gutíerrez','Castillo','GUCO970503','ejemplo4@gmail.com','Izta');
 INSERT INTO  cliente VALUES (Seq_cliente.nextval,'Pedro','Gutíerrez','Castillo','GUCO970603','ejemplo5@gmail.com','Valle');
 INSERT INTO  cliente VALUES (Seq_cliente.nextval,'Julia','Perez','Castillo','GUCO970503','ejemplo6@gmail.com','Del Valle');
 INSERT INTO  cliente VALUES (Seq_cliente.nextval,'Elba','Gutíerrez','Castillo','GUCO970503','ejemplo7@gmail.com','Colinas del Sur');
 INSERT INTO  cliente VALUES (Seq_cliente.nextval,'Carlos','Oneil','Ectl','GUCO970503','ejemplo8@gmail.com','Mixcoac');
 INSERT INTO  cliente VALUES (Seq_cliente.nextval,'Alfonso','Gutíerrez','Hernandez','GUCO970503','ejemplo9@gmail.com','Iztapaluca');
 INSERT INTO  cliente VALUES (Seq_cliente.nextval,'Luisa','Oconor','Castillo','GUCO970503','ejemplo10@gmail.com','Coyoacan');
 INSERT INTO  cliente VALUES (Seq_cliente.nextval,'Francisco','Gutíerrez','Real','GUCO970503','ejemplo11@gmail.com','Santa fe');
 INSERT INTO  cliente VALUES (Seq_cliente.nextval,'Julieta','Leon','Castillo','GUCO970503','ejemplo12@gmail.com','Villa');
 INSERT INTO  cliente VALUES (Seq_cliente.nextval,'Oscar','Gutíerrez','Castillo','GUCO970503','ejemplo13@gmail.com','Nativitas');
 INSERT INTO  cliente VALUES (Seq_cliente.nextval,'Ericka','Gutíerrez','Castillo','GUCO970503','ejemplo14@gmail.com','Zocalo');

-------------------------------Tarjetas de credito-------------------------------
INSERT INTO  tarjeta_credito VALUES (Seq_tc.nextval,6434653476346534, 'Visa', 03,21,034);
 INSERT INTO tarjeta_credito VALUES (Seq_tc.nextval,5674657675675667, 'Mastercard', 03,21,456);
 INSERT INTO tarjeta_credito VALUES (Seq_tc.nextval,6586760359874609, 'AmericanExpress', 03,21,789);
 INSERT INTO tarjeta_credito VALUES (Seq_tc.nextval,5489865424567767, 'Visa', 03,22,789);
 INSERT INTO tarjeta_credito VALUES (Seq_tc.nextval,9855897569877570, 'Mastercard', 03,21,799);
 INSERT INTO tarjeta_credito VALUES (Seq_tc.nextval,2346577986477987, 'Visa', 03,18,098);
 INSERT INTO tarjeta_credito VALUES (Seq_tc.nextval,2345345657657652, 'AmericanExpress', 03,21,456);
 INSERT INTO tarjeta_credito VALUES (Seq_tc.nextval,4356780987898787, 'Visa', 03,16,875);
 INSERT INTO tarjeta_credito VALUES (Seq_tc.nextval,2345676543234569, 'Visa', 03,15,057);
 INSERT INTO tarjeta_credito VALUES (Seq_tc.nextval,1239834843678958, 'Mastercard', 03,21,345);
 INSERT INTO tarjeta_credito VALUES (Seq_tc.nextval,3459234568230764, 'Visa', 03,16,248);
 INSERT INTO tarjeta_credito VALUES (Seq_tc.nextval,9344567678634534, 'Visa', 03,18,379);
 INSERT INTO tarjeta_credito VALUES (Seq_tc.nextval,7896553454567688, 'Martercard', 03,21,709);
 INSERT INTO tarjeta_credito VALUES (Seq_tc.nextval,7856534547923425, 'Visa', 03,20,258);
 INSERT INTO tarjeta_credito VALUES (Seq_tc.nextval,2387897456567678, 'AmericanExpress', 03,21,498);

-----------------------------------------Polizas----------------------------------------------------
INSERT INTO  poliza VALUES (Seq_poliza.nextval, TO_DATE('2003/05/03', 'yyyy/mm/dd'), TO_DATE('10:30', 'HH:MI'), TO_DATE('2004/05/03', 'yyyy/mm/dd'), TO_DATE('10:30', 'HH:MI'),5696875,45698745609856834701,1,1);
 INSERT INTO poliza VALUES (Seq_poliza.nextval, TO_DATE('2003/06/03', 'yyyy/mm/dd'), TO_DATE('10:30', 'HH:MI'), TO_DATE('2004/06/03', 'yyyy/mm/dd'), TO_DATE('10:30', 'HH:MI'),5696875,45698745609856834701,2,2);
 INSERT INTO poliza VALUES (Seq_poliza.nextval, TO_DATE('2003/07/03', 'yyyy/mm/dd'), TO_DATE('10:30', 'HH:MI'), TO_DATE('2004/07/03', 'yyyy/mm/dd'), TO_DATE('10:30', 'HH:MI'),5696875,45698745609856834701,3,3);
 INSERT INTO poliza VALUES (Seq_poliza.nextval, TO_DATE('2003/08/03', 'yyyy/mm/dd'), TO_DATE('10:30', 'HH:MI'), TO_DATE('2004/08/03', 'yyyy/mm/dd'), TO_DATE('10:30', 'HH:MI'),5696875,45698745609856834701,4,4);
 INSERT INTO poliza VALUES (Seq_poliza.nextval, TO_DATE('2003/09/03', 'yyyy/mm/dd'), TO_DATE('10:30', 'HH:MI'), TO_DATE('2004/09/03', 'yyyy/mm/dd'), TO_DATE('10:30', 'HH:MI'),5696875,45698745609856834701,5,5);
 INSERT INTO poliza VALUES (Seq_poliza.nextval, TO_DATE('2003/10/03', 'yyyy/mm/dd'), TO_DATE('10:30', 'HH:MI'), TO_DATE('2004/10/03', 'yyyy/mm/dd'), TO_DATE('10:30', 'HH:MI'),5696875,45698745609856834701,6,6);
 INSERT INTO poliza VALUES (Seq_poliza.nextval, TO_DATE('2003/11/03', 'yyyy/mm/dd'), TO_DATE('10:30', 'HH:MI'), TO_DATE('2004/11/03', 'yyyy/mm/dd'), TO_DATE('10:30', 'HH:MI'),5696875,45698745609856834701,7,7);
 INSERT INTO poliza VALUES (Seq_poliza.nextval, TO_DATE('2003/12/03', 'yyyy/mm/dd'), TO_DATE('10:30', 'HH:MI'), TO_DATE('2004/12/03', 'yyyy/mm/dd'), TO_DATE('10:30', 'HH:MI'),5696875,45698745609856834701,8,8);
 INSERT INTO poliza VALUES (Seq_poliza.nextval, TO_DATE('2004/01/03', 'yyyy/mm/dd'), TO_DATE('10:30', 'HH:MI'), TO_DATE('2005/01/03', 'yyyy/mm/dd'), TO_DATE('10:30', 'HH:MI'),5696875,45698745609856834701,9,1);
 INSERT INTO poliza VALUES (Seq_poliza.nextval, TO_DATE('2004/02/03', 'yyyy/mm/dd'), TO_DATE('10:30', 'HH:MI'), TO_DATE('2005/02/03', 'yyyy/mm/dd'), TO_DATE('10:30', 'HH:MI'),5696875,45698745609856834701,10,9);
 INSERT INTO poliza VALUES (Seq_poliza.nextval, TO_DATE('2004/03/03', 'yyyy/mm/dd'), TO_DATE('10:30', 'HH:MI'), TO_DATE('2005/03/03', 'yyyy/mm/dd'), TO_DATE('10:30', 'HH:MI'),5696875,45698745609856834701,11,10);
 INSERT INTO poliza VALUES (Seq_poliza.nextval, TO_DATE('2004/04/03', 'yyyy/mm/dd'), TO_DATE('10:30', 'HH:MI'), TO_DATE('2005/04/03', 'yyyy/mm/dd'), TO_DATE('10:30', 'HH:MI'),5696875,45698745609856834701,12,11);
 INSERT INTO poliza VALUES (Seq_poliza.nextval, TO_DATE('2004/05/03', 'yyyy/mm/dd'), TO_DATE('10:30', 'HH:MI'), TO_DATE('2005/05/03', 'yyyy/mm/dd'), TO_DATE('10:30', 'HH:MI'),5696875,45698745609856834701,13,12);
 INSERT INTO poliza VALUES (Seq_poliza.nextval, TO_DATE('2004/06/03', 'yyyy/mm/dd'), TO_DATE('10:30', 'HH:MI'), TO_DATE('2005/06/03', 'yyyy/mm/dd'), TO_DATE('10:30', 'HH:MI'),5696875,45698745609856834701,10,9);
 INSERT INTO poliza VALUES (Seq_poliza.nextval, TO_DATE('2004/07/03', 'yyyy/mm/dd'), TO_DATE('10:30', 'HH:MI'), TO_DATE('2005/07/03', 'yyyy/mm/dd'), TO_DATE('10:30', 'HH:MI'),5696875,45698745609856834701,1,14);


-----------------------------------Siniestros------------------------------------------------------
INSERT INTO  general_siniestro VALUES (Seq_siniestros.nextval, TO_DATE('2004/04/04', 'yyyy/mm/dd'), TO_DATE('23:23', 'HH24:MI'),'Las flores','Choque de dos automoviles');
 INSERT INTO general_siniestro VALUES (Seq_siniestros.nextval, TO_DATE('2004/04/04', 'yyyy/mm/dd'), TO_DATE('23:23', 'HH24:MI'),'Magallanes','Choque contra un poste');
 INSERT INTO general_siniestro VALUES (Seq_siniestros.nextval, TO_DATE('2004/04/04', 'yyyy/mm/dd'), TO_DATE('23:23', 'HH24:MI'),'Sofismos','Atropellado');
 INSERT INTO general_siniestro VALUES (Seq_siniestros.nextval, TO_DATE('2004/04/04', 'yyyy/mm/dd'), TO_DATE('23:23', 'HH24:MI'),'Rotterdam','Choque automoviles');
 INSERT INTO general_siniestro VALUES (Seq_siniestros.nextval, TO_DATE('2004/04/04', 'yyyy/mm/dd'), TO_DATE('23:23', 'HH24:MI'),'Copilco','Choque casa');
 INSERT INTO general_siniestro VALUES (Seq_siniestros.nextval, TO_DATE('2004/04/04', 'yyyy/mm/dd'), TO_DATE('23:23', 'HH24:MI'),'Mixcoac','Atropelló a un perro y su dueño');
 INSERT INTO general_siniestro VALUES (Seq_siniestros.nextval, TO_DATE('2004/04/04', 'yyyy/mm/dd'), TO_DATE('23:23', 'HH24:MI'),'Plaza Universidad','Niño se atravesó');
 INSERT INTO general_siniestro VALUES (Seq_siniestros.nextval, TO_DATE('2004/04/04', 'yyyy/mm/dd'), TO_DATE('23:23', 'HH24:MI'),'Gran Sur','Choque de dos automoviles');
 INSERT INTO general_siniestro VALUES (Seq_siniestros.nextval, TO_DATE('2004/04/04', 'yyyy/mm/dd'), TO_DATE('23:23', 'HH24:MI'),'Santa fe','Atropellado');
 INSERT INTO general_siniestro VALUES (Seq_siniestros.nextval, TO_DATE('2004/04/04', 'yyyy/mm/dd'), TO_DATE('23:23', 'HH24:MI'),'Aristoteles','Conduccion en estado inconveniente');
 INSERT INTO general_siniestro VALUES (Seq_siniestros.nextval, TO_DATE('2004/04/04', 'yyyy/mm/dd'), TO_DATE('23:23', 'HH24:MI'),'Planco','Choque de dos automoviles');
 INSERT INTO general_siniestro VALUES (Seq_siniestros.nextval, TO_DATE('2004/04/04', 'yyyy/mm/dd'), TO_DATE('23:23', 'HH24:MI'),'Auditorio Nacional','Choque de dos automoviles');
 INSERT INTO general_siniestro VALUES (Seq_siniestros.nextval, TO_DATE('2004/04/04', 'yyyy/mm/dd'), TO_DATE('23:23', 'HH24:MI'),'Camellon','Choque de dos automoviles');
 INSERT INTO general_siniestro VALUES (Seq_siniestros.nextval, TO_DATE('2004/04/04', 'yyyy/mm/dd'), TO_DATE('23:23', 'HH24:MI'),'Fraccionamiento','Choque de dos automoviles');
 INSERT INTO general_siniestro  VALUES (Seq_siniestros.nextval, TO_DATE('2004/04/04','yyyy/mm/dd'), TO_DATE('23:23', 'HH24:MI'),'Zocalo','Choque de dos automoviles');
--------------------------------------Aseguradoras-------------------------------------------------------
INSERT INTO catalogo_aseguradoras VALUES (Seq_catalogo_aseguradoras.nextval, 'Allianz', 'Aseguradora Allianz');
INSERT INTO catalogo_aseguradoras VALUES (Seq_catalogo_aseguradoras.nextval, 'AXA', 'AXA Seguros');
INSERT INTO catalogo_aseguradoras VALUES (Seq_catalogo_aseguradoras.nextval, 'BBVA', 'Seguros Bancomer');
INSERT INTO catalogo_aseguradoras VALUES (Seq_catalogo_aseguradoras.nextval, 'ClickSeguros', 'Seguro con un click');
INSERT INTO catalogo_aseguradoras VALUES (Seq_catalogo_aseguradoras.nextval, 'Fenix', 'Vuela seguro');
INSERT INTO catalogo_aseguradoras VALUES (Seq_catalogo_aseguradoras.nextval, 'Ges', 'Ges para viaje feliz');
INSERT INTO catalogo_aseguradoras VALUES (Seq_catalogo_aseguradoras.nextval, 'Liberty', 'Libertad en tu viaje');
INSERT INTO catalogo_aseguradoras VALUES (Seq_catalogo_aseguradoras.nextval, 'Mapfre', 'Seguros MAPFRE');
INSERT INTO catalogo_aseguradoras VALUES (Seq_catalogo_aseguradoras.nextval, 'Metropolis', 'Seguro Metropolis');
INSERT INTO catalogo_aseguradoras VALUES (Seq_catalogo_aseguradoras.nextval, 'Sabadell', 'Viajando seguros');
INSERT INTO catalogo_aseguradoras VALUES (Seq_catalogo_aseguradoras.nextval, 'Solis', 'Solis seguros');
INSERT INTO catalogo_aseguradoras VALUES (Seq_catalogo_aseguradoras.nextval, 'Patito', 'No somos seguros');
INSERT INTO catalogo_aseguradoras VALUES (Seq_catalogo_aseguradoras.nextval, 'Umas', 'Seguro Umas');
INSERT INTO catalogo_aseguradoras VALUES (Seq_catalogo_aseguradoras.nextval, 'Zurich', 'Zurich seguros');
INSERT INTO catalogo_aseguradoras VALUES (Seq_catalogo_aseguradoras.nextval, 'Caixa', 'Seguros Caixa ');
------------------------------------------Personas-----------------------------------------------------------
INSERT INTO persona VALUES ('AABS840102MDGBTR04','Persona física');
INSERT INTO persona VALUES ('AABS840102MDGBTR00','Persona física');
INSERT INTO persona VALUES ('AABS840102MDGBTR01','Persona física');
INSERT INTO persona VALUES ('AABS840102MDGBTR02','Persona física');
INSERT INTO persona VALUES ('AABS840102MDGBTR03','Persona física');
INSERT INTO persona VALUES ('AABS840102MDGBTR05','Persona física');
INSERT INTO persona VALUES ('AABS840102MDGBTR06','Persona física');
INSERT INTO persona VALUES ('AABS840102MDGBTR07','Persona física');
INSERT INTO persona VALUES ('AABS840102MDGBTR08','Persona física');
INSERT INTO persona VALUES ('AABS840102MDGBTR09','Persona física');
INSERT INTO persona VALUES ('AABS840102MDGBTR14','Persona física');
INSERT INTO persona VALUES ('AABS840102MDGBTR24','Persona física');
INSERT INTO persona VALUES ('AABS840102MDGBTR34','Persona física');
INSERT INTO persona VALUES ('AABS840102MDGBTR44','Persona física');
INSERT INTO persona VALUES ('AABS840102MDGBTR54','Persona física');
-----------------------------------------------Autos involucrados--------------------------------------------
-------------------------Siniestro Social------------------------------------------------

-----------------------Fin del poblado basico de tablas------------------------
----------------------------------------Siniestro material------------------------------------------------
-------------------------------------------Siniestro colision---------------------------------------------

-------------------------------------------------------------------------------
------------------------Vistas-------------------------------------------------

CREATE OR REPLACE VIEW Cotizaciones_Mayor_1900 AS
	SELECT * FROM cotizacion WHERE cotizacion.costo > 1900;
	SELECT * FROM Cotizaciones_Mayor_1900;

CREATE OR REPLACE VIEW Polizas_Octubre2016 AS
	SELECT * FROM poliza WHERE poliza.f_inicio > TO_DATE('30/09/2016','DD/MM/YYYY');
	SELECT * FROM Polizas_Octubre2016;
CREATE OR REPLACE VIEW Poliza_Siniestro_Registrado(id_cliente,nombre,n_placas) AS
	SELECT cliente.id_cliente,cliente.nombre,poliza.n_placas
	FROM cliente, poliza
	WHERE cliente.id_cliente = ANY (
		SELECT poliza.n_placas FROM poliza WHERE poliza.folio = ANY (
			SELECT general_siniestro.id_siniestro FROM general_siniestro WHERE general_siniestro.id_siniestro = ANY (
				SELECT estado_siniestro.id_estado FROM estado_siniestro WHERE estado_siniestro.id_estado = ANY (
					SELECT estado_siniestro.id_estado FROM estado_siniestro WHERE estado_siniestro.detalle = 'REGISTRADO'
					)
				)
			)
		);
	SELECT * FROM Polizas_Octubre2016;
-------------------------------Fin de vistas------------------------------------

-------------------------------Trigger------------------------------------------
------------------------------Fin de Trigger------------------------------------
-----------------Soltando todos los elementos ----------------------------------
DROP PUBLIC SYNONYM marcas;      
DROP PUBLIC SYNONYM modelos;      
DROP PUBLIC SYNONYM estados;      
DROP PUBLIC SYNONYM seguros;      
DROP PUBLIC SYNONYM cotizaciones;      
DROP PUBLIC SYNONYM clientes;      
DROP PUBLIC SYNONYM tarjetas;      
DROP PUBLIC SYNONYM polizas;      
DROP PUBLIC SYNONYM sin;      
DROP PUBLIC SYNONYM edoSiniestros;      
DROP PUBLIC SYNONYM aseguradoras;      
DROP PUBLIC SYNONYM personas;      
DROP PUBLIC SYNONYM autoInvolucrados;      
DROP PUBLIC SYNONYM sinSocial;      
DROP PUBLIC SYNONYM sinMaterial;       
DROP PUBLIC SYNONYM sinColision;      
DROP PUBLIC SYNONYM t_seguro;


DROP TABLE siniestro_material;
DROP TABLE siniestro_social;
DROP TABLE siniestro_colision;
DROP TABLE persona;
DROP TABLE automoviles_involucrados;
DROP TABLE catalogo_aseguradoras;
DROP TABLE estado_siniestro;
DROP TABLE general_siniestro;
DROP TABLE poliza;
DROP TABLE tarjeta_credito;
DROP TABLE cliente;
DROP TABLE cotizacion;
DROP TABLE catalogo_tipo_seguro;
DROP TABLE catalogo_estados;
DROP TABLE catalogo_modelos;
DROP TABLE catalogo_marca;


DROP SEQUENCE Seq_marca;
DROP SEQUENCE Seq_modelo;
DROP SEQUENCE Seq_estados;
DROP SEQUENCE Seq_tipo;
DROP SEQUENCE Seq_cotiazcion;
DROP SEQUENCE Seq_cliente;
DROP SEQUENCE Seq_tc;
DROP SEQUENCE Seq_poliza;
DROP SEQUENCE Seq_siniestros;
DROP SEQUENCE Seq_estado_siniestro;
DROP SEQUENCE Seq_catalogo_aseguradoras;
DROP SEQUENCE Seq_Auto_invo;
DROP SEQUENCE Seq_siniestro_social;
DROP SEQUENCE Seq_siniestro_material;
DROP SEQUENCE Seq_siniestro_colision;

--@/home/kubos/Escritorio/PROTECO/BasesDatos/proyecto2/BasesDatos33/PreBeSafe.sql--









