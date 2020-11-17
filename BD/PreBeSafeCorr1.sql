---------------------------------------------
--      Oscar Gutiérrez Castillo           --
--      Jorge Luis Chavez Delgado          --
--      Proeyecto de Tecnología            --
--            y Computo                    --
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
	tipo VARCHAR(10) NOT NULL ,
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
	tipo_danio VARCHAR(50),
	foto_danio LONG RAW NULL
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
    marca VARCHAR(3) NOT NULL,
    modelo VARCHAR(3) NOT NULL,
    n_serie VARCHAR(20) NOT NULL,
    n_poliza NUMBER(13) NULL,
    aseguradora NUMBER(5) NULL,
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

--------------------------------Creación de sinonimos--------------------------------------------------(5%)
CREATE PUBLIC SYNONYM marcas FOR ORACLE.catalogo_marca;
CREATE PUBLIC SYNONYM modelos FOR ORACLE.modelo;
CREATE PUBLIC SYNONYM estados FOR ORACLE.estado;
CREATE PUBLIC SYNONYM seguros FOR ORACLE.seguros;
CREATE PUBLIC SYNONYM cotizaciones FOR ORACLE.cotizacion;
CREATE PUBLIC SYNONYM clientes FOR ORACLE.cliente;
CREATE PUBLIC SYNONYM tarjetas FOR ORACLE.tarjeta_credito;
CREATE PUBLIC SYNONYM polizas FOR ORACLE.poliza;
CREATE PUBLIC SYNONYM sin FOR ORACLE.general_siniestro;
CREATE PUBLIC SYNONYM edoSiniestros FOR ORACLE.estado_siniestro;
CREATE PUBLIC SYNONYM aseguradoras FOR ORACLE.catalogo_aseguradoras;
CREATE PUBLIC SYNONYM personas FOR ORACLE.persona;
CREATE PUBLIC SYNONYM autoInvolucrados FOR ORACLE.automoviles_involucrados;
CREATE PUBLIC SYNONYM sinSocial FOR ORACLE.siniestro_social;
CREATE PUBLIC SYNONYM sinMaterial FOR ORACLE.siniestro_material;
CREATE PUBLIC SYNONYM sinColision FOR ORACLE.siniestro_colision;
CREATE PUBLIC SYNONYM t_seguro FOR ORACLE.catalogo_tipo_seguro;

-----------------------------------Fin de la creación de sinonimos

-------------------------Poblado  basico de tablas--------------------------
--@/home/kubos/Escritorio/PROTECO/BasesDatos/proyecto2/BasesDatos33/PreBeSafe.sql--

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
DROP TABLE general_siniestro;
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
