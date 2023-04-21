/*Actividad 2*/

SET LANGUAGE Español
GO
SELECT @@language AS 'Idioma'
GO
/*Insertar los siguientes registros en la tabla client*/
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
('CNE', '442233693', 'Rosario', 'Prada Velásquez', 'rosarioprada@aoutlook.com', '971144782', '05/11/1990')
GO

SELECT * FROM client
GO

/*Insertar los siguientes registros en la tabla seller*/

INSERT INTO seller 
(type_document, number_document, names, last_name, cell_phone, email)
VALUES
('DNI', '11224578', 'Oscar', 'Peredes Flores', '991692597', 'oparedes@miemrpesa.com'),
('CNE', '889922365', 'Azucena', 'Valle Alcazar', '982514752', 'avalle@miemrpesa.com'),
('CNE', '44771123', 'Rosario', 'Huarca Tarazona', '971144782', 'rhuaraca@miemrpesa.com')
GO

SELECT * FROM seller
GO

/*Insertar los siguientes registros en la tabla clothes*/

INSERT INTO clothes 
(descriptions, brand, amount, size, price)
VALUES
('Polo camisero', 'Adidas', '20', 'Medium', '40.50'),
('Short playero', 'Nike', '30', 'Medium', '55.50'),
('Camisa sport', 'Adams', '60', 'Large', '60.80'),
('Camisa sport', 'Adams', '70', 'Medium', '58.75'),
('Buzo de verano', 'Reebok', '45', 'Small', '62.90'),
('Pantalón Jean', 'Lewis', '35', 'Large', '73.60')
GO

SELECT * FROM clothes
GO

/*Listar todos los datos de los clientes (client) cuyo tipo de documento sea DNI*/
SELECT *
FROM client
WHERE type_document = 'DNI'
GO

/*Listar todos los datos de los clientes (client) cuyo servidor de correo electrónico sea outlook.com.*/
SELECT *
FROM client
WHERE email like '%@outlook.com'
GO

/*Listar todos los datos de los vendedores (seller) cuyo tipo de documento sea CNE.*/
SELECT *
FROM seller
WHERE type_document = 'CNE'
GO

/*Listar todas las prendas de ropa (clothes) cuyo costo sea menor e igual que S/. 55.00*/

SELECT *
FROM clothes
WHERE price <= 55.00
GO

/*Listar todas las prendas de ropa (clothes) cuya marca sea Adams.*/

SELECT *
FROM clothes
WHERE brand = 'Adams'
GO

/*Eliminar lógicamente los datos de un cliente client de acuerdo a un determinado id.*/
-- para caso eliminamos a un cliente de seller con id 2
UPDATE client
SET active = '0' 
WHERE id = '2'
GO

/* Listar clientes */
SELECT * FROM client
GO

/*Eliminar lógicamente los datos de un cliente seller de acuerdo a un determinado id.*/
-- para caso eliminamos a un cliente de seller con id 1
UPDATE seller
SET active = '0' 
WHERE id = '1'
GO
/* Listar seller */
SELECT * FROM seller
GO
/*Eliminar lógicamente los datos de un cliente clothes de acuerdo a un determinado id */
-- para caso eliminamos a un cliente de seller con id 4
UPDATE clothes
SET active = '0' 
WHERE id = '4'
GO
/* Listar clothes */
SELECT * FROM clothes
GO