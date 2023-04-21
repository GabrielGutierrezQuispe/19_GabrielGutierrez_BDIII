/*Actividad 1*/

/*Eliminamos la base de datos db_SalesClothes.*/
DROP DATABASE IF EXISTS db_SalesClothes
GO

/* Crear base de datos Sales Clothes */
CREATE DATABASE db_SalesClothes
GO

/* Poner en uso la base de datos */
USE db_SalesClothes
GO

/*Configurar el idioma español el motor de base de datos*/
SET LANGUAGE Español
GO
SELECT @@language AS 'Idioma'
GO

/* Vemos ver el formato de fecha y hora del servidor*/
SELECT sysdatetime() as 'Fecha y  hora'
GO

/* Luego configuramos el formato de fecha */
SET DATEFORMAT dmy
GO

/* Creamos la tabla client a la ves ponemos el campo id como autoincrementable, empezando en 1 e incrementa de 1 en uno */
DROP TABLE IF EXISTS client
GO

 CREATE TABLE client
(
	id int identity(1,1),
	type_document char(3),
	number_document char(9),
	names varchar(60),
	last_name varchar(90),
	email varchar(80),
	cell_phone char(9),
	birthdate date,
	active bit DEFAULT (1)
	CONSTRAINT client_pk PRIMARY KEY (id)
)
GO

/*Agregamos las restricciones*/
/*Agregamos la restriccion de solo se aseptan DNI y CNE*/

ALTER TABLE client
	ADD CONSTRAINT type_document1_client 
	CHECK(type_document ='DNI' OR type_document ='CNE')
GO
/*El campo number_document sólo permite dígitos entre 0 a 9, y serán 8 cuando es DNI y 9 cuando sea CNE.*/
ALTER TABLE client
	ADD CONSTRAINT number_document_client
	CHECK (number_document like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][^A-Z]')
GO

/* Agregar las restriccion a la columna email sólo permite correos electrónicos válidos, por ejemplo: mario@gmail.com*/
ALTER TABLE client
	ADD CONSTRAINT email_client
	CHECK(email LIKE '%@%._%')
GO

/*al campo cell_phone acepta solamente 9 dígitos numéricos*/
ALTER TABLE client
	ADD CONSTRAINT cellphone_client
	CHECK (cell_phone like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
GO

/*El campo birthdate sólo permite la fecha de nacimiento de clientes mayores de edad*/
ALTER TABLE client
	ADD CONSTRAINT birthdate_client
	CHECK((YEAR(GETDATE())- YEAR(birthdate )) >= 18)
GO

/* Listar las restricciones de la tabla client */
SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
WHERE TABLE_NAME = 'client'
GO

/*Creamos la tabla seller agregando la restriccion de del id aoutoimcrementable y el valor predeterminado en 1 de active*/
DROP TABLE IF EXISTS seller
GO

CREATE TABLE seller
(
	id int identity(1,1),
	type_document char(3),
	number_document char(9),
	names varchar(60),
	last_name varchar(90),
	salary decimal(8,2) DEFAULT (1025),
	cell_phone char(9),
	email varchar(80),
	active bit DEFAULT (1)
	CONSTRAINT seller_pk PRIMARY KEY (id)
)
GO

/*Agregamos la restriccion de solo se aceptan valores de DNI Y CNE en type_document*/
ALTER TABLE seller
	ADD CONSTRAINT type_document1_seller 
	CHECK(type_document ='DNI' OR type_document ='CNE')
GO

/*El campo number_document sólo permite dígitos entre 0 a 9, y serán 8 cuando es DNI y 9 cuando sea CNE.*/
ALTER TABLE seller
	ADD CONSTRAINT number_document_seller
	CHECK (number_document like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][^A-Z]')
GO
/*al campo cell_phone acepta solamente 9 dígitos numéricos*/
ALTER TABLE seller
	ADD CONSTRAINT cellphone_seller
	CHECK (cell_phone like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
GO

/* Agregar las restriccion a la columna email sólo permite correos electrónicos válidos, por ejemplo: mario@gmail.com*/
ALTER TABLE seller
	ADD CONSTRAINT email_seller
	CHECK(email LIKE '%@%._%')
GO

/* Listar las restricciones de la tabla seller */
SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
WHERE TABLE_NAME = 'seller'
GO

/*Creamos la tabla clothes agregando la restriccion de del id aoutoimcrementable y el valor predeterminado en 1 de active*/
DROP TABLE IF EXISTS clothes
GO

CREATE TABLE clothes
(
	id int identity(1,1),
	descriptions varchar(60),
	brand varchar(60),
	amount int,
	size varchar(10),
	price decimal(8,2),
	active bit DEFAULT (1)
	CONSTRAINT clothes_pk PRIMARY KEY (id) 
)
GO

/*Creamos la tabla sale agregando la restriccion de del id aoutoimcrementable y el valor predeterminado en 1 de active*/
DROP TABLE IF EXISTS sale
GO

CREATE TABLE sale
(
	id int identity(1,1),
	date_time datetime,
	seller_id int,
	client_id int,
	active bit DEFAULT (1)
	CONSTRAINT sale_pk PRIMARY KEY (id) 
)
GO
/*El campo date_time debe tener como valor predeterminado la fecha y hora del servidor.*/
ALTER TABLE sale 
	ADD CONSTRAINT date_time_sale 
	DEFAULT GETDATE() FOR date_time
GO

/*Creamos la tabla sale_detail*/
DROP TABLE IF EXISTS sale_detail
GO
CREATE TABLE sale_detail
(
	id int identity(1,1),
	sale_id int,
	clothes_id int,
	amount int
	CONSTRAINT sale_detail_pk PRIMARY KEY (id) 
)
GO

/* Relacionar tabla sale con tabla client */
ALTER TABLE sale
	ADD CONSTRAINT sale_client FOREIGN KEY (client_id)
	REFERENCES client (id)
	ON UPDATE CASCADE 
	ON DELETE CASCADE
GO

/* Relacionar tabla sale con seller */
ALTER TABLE sale
	ADD CONSTRAINT sale_seller FOREIGN KEY (seller_id)
	REFERENCES seller (id)
	ON UPDATE CASCADE
	ON DELETE CASCADE
GO

/* Relacionar tabla sale_detail con clothes */
ALTER TABLE sale_detail
	ADD CONSTRAINT sale_detail_clothes FOREIGN KEY (clothes_id)
	REFERENCES clothes (id)
	ON UPDATE CASCADE
	ON DELETE CASCADE
GO

/* Relacionar tabla sale con sale_detail */
ALTER TABLE sale_detail
	ADD CONSTRAINT sale_detail_sale FOREIGN KEY (sale_id)
	REFERENCES sale (id)
	ON UPDATE CASCADE
	ON DELETE CASCADE
GO

INSERT INTO client 
(type_document, number_document, names, last_name, email, cell_phone, birthdate)
VALUES
('DNI', '78451233', 'Fabiola', 'Perales Campos', 'fabiolaperales@gmail.com', '991692597', '19/01/2005'),
('DNI', '14782536', 'Marcos', 'Dávila Palomino', 'marcosdavila@gmail.com', '982514752', '03/03/1990'),
('DNI', '78451236', 'Luis Alberto', 'Barrios Paredes', 'luisbarrios@outlook.com', '985414752', '03/10/1995'),
('CNE', '352514789', 'Claudia María', 'Martínez Rodríguez', 'claudiamartinez@yahoo.com', '995522147', '23/09/1992'),
('CNE', '142536792', 'Mario Tadeo', 'Farfán Castillo', 'mariotadeo@outlook.com', '973125478', '25/11/1997'),
('DNI', '50251433', 'Ana Lucrecia', 'Chumpitaz Prada', 'anachumpitaz@gmail.com', '982514361', '17/10/1992'),
('DNI', '15223369', 'Humberto', 'Cabrera Tadeo', 'humbertocabrera@yahoo.com', '977112234', '27/05/1990'),
('CNE', '442233693', 'Rosario', 'Prada Velásquez', 'rosarioprada@aoutlook.com', '971144782', '05/11/1990');