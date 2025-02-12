-- Crear la tabla de clientes
-- DROP TABLE clientes; 
CREATE TABLE IF NOT EXISTS clientes (
    id_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email varchar(100) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    telefono varchar(15) NOT NULL,
    pais varchar(100) NOT NULL,
   	UNIQUE (email,telefono));
    
-- Crear la tabla de empleados
   
CREATE TABLE IF NOT EXISTS empleados (
	id_empleado serial PRIMARY KEY,
	nombre varchar(100) NOT NULL,
	cargo varchar (100) NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL);

-- Crear la tabla de proveedores
CREATE TABLE IF NOT EXISTS proveedores (
	id_proveedor serial PRIMARY KEY,
	nombre varchar(100) NOT null, 
	contacto varchar(100) UNIQUE NOT NULL,
	telefono varchar(15) UNIQUE NOT null, -- cantidad de numeros
	direccion VARCHAR(100) NOT NULL);

CREATE TABLE IF NOT EXISTS envios (
	id_envio serial PRIMARY KEY,
	id_cliente int NOT NULL, 
	id_empleado int NOT NULL,
	id_proveedor int NOT NULL,
	fecha_envio DATE CHECK (fecha_envio <= CURRENT_DATE),
	estado varchar(100),
	total int CHECK(total > 0),
	FOREIGN KEY (id_cliente)
		REFERENCES clientes(id_cliente)
		ON DELETE RESTRICT
		ON UPDATE CASCADE,
	FOREIGN KEY (id_empleado)
		REFERENCES empleados(id_empleado)
		ON DELETE RESTRICT
		ON UPDATE CASCADE,
	FOREIGN KEY (id_proveedor)
		REFERENCES proveedores(id_proveedor)
		ON DELETE RESTRICT
		ON UPDATE CASCADE);
	
CREATE TABLE IF NOT EXISTS detalles_envio (
	id_detalle serial PRIMARY KEY,
	id_envio int NOT NULL,
	producto varchar(100) NOT null,
	cantidad int CHECK (cantidad >= 1),
	precio_unitario float CHECK (precio_unitario > 0),
	FOREIGN KEY (id_envio)
		REFERENCES envios(id_envio)
		ON DELETE RESTRICT
		ON UPDATE CASCADE);

CREATE TABLE IF NOT EXISTS regiones (
	id_region serial PRIMARY KEY,
	nombre varchar(100) NOT NULL,
	pais varchar(100) NOT NULL);
	
INSERT INTO clientes (nombre, email, direccion, telefono,pais)
VALUES ('Lola', 'lola@gmail.com', 'Calle de Luis Ruiz', '616244520', 'España');

INSERT INTO clientes (nombre, email, direccion, telefono,pais)
VALUES ('Flores', 'flores@gmail.com', 'Calle de Ruiz', '616286220', 'España'),
		('Jose', 'jose@gmail.com', 'Calle de Arturo Soria', '616764520', 'España'),
		('Luis', 'luis@gmail.com', 'Calle de Vallecas', '616244520', 'España'),
		('Jean', 'jean@gmail.com', 'Calle de Robles', '616244576', 'España'),
		('Ana', 'ana@gmail.com', 'Calle de Cibeles', '616244594', 'España'), 
		('Yan', 'yan@gmail.com', 'Calle de medrano', '616244512', 'España'),
		('Elena', 'elena@gmail.com', 'Calle de Valles', '616244509', 'España'),
		('Miguel', 'miguel@gmail.com', 'Calle de Vital Aza', '616244522', 'España'),
		('Charles', 'charles@gmail.com', 'Calle de Mares', '616244554', 'España'),
		('Adri', 'adri@gmail.com', 'Calle de Soles', '616244476', 'España');

    INSERT INTO empleados (nombre, cargo , email)
    VALUES 
    ('Carlos Díaz', 'Analista', 'cdiaz#gmail.com'),
    ('María Gómez', 'Desarrolladora', 'mgomez@gmail.com'),
    ('Pedro Martínez', 'Soporte Técnico', 'pmartinez@gmail.com'),
   	('Ana Pérez', 'Científica de Datos', 'aperez@hotmail.com'),
   	('Luis González', 'Ingeniero de Software', 'lgonzalez@outlook.com');

   INSERT INTO proveedores (nombre,contacto, telefono, direccion)
   VALUES 
       ('FEDEX', 'Cristian Martinez', '616244896', 'Calle de Hermanos de Pablo'),
       ('DHL', 'María López', '612345678', 'Avenida del Sol 123'),
       ('UPS', 'Javier Rodríguez', '619876543', 'Calle de las Flores 45');
       
  INSERT INTO envios (id_cliente, id_empleado, id_proveedor, fecha_envio, estado, total)
  VALUES 
  		(1, 1, 1, '2014-10-10', 'Recibido', 2 )
  		
INSERT INTO envios (id_cliente, id_empleado, id_proveedor, fecha_envio, estado, total)
  VALUES 
  		(3, 4, 2, '2014-10-11', 'Enviado', 4),
		(7, 2, 1, '2014-10-12', 'Entregado', 3),
		(2, 1, 3, '2014-10-13', 'Recibido', 5),
		(9, 3, 1, '2014-10-14', 'Enviado', 2),
		(5, 4, 2, '2014-10-15', 'Entregado', 3),
		(8, 2, 1, '2014-10-16', 'Recibido', 4),
		(6, 5, 3, '2014-10-17', 'Enviado', 1);
		
	INSERT INTO detalles_envio (id_envio, producto, cantidad, precio_unitario)
	VALUES 
		(1, 'Producto A', 2, 250.00)
		
	INSERT INTO detalles_envio (id_envio, producto, cantidad, precio_unitario)
	VALUES 	
		(2, 'Producto B', 4, 100.00),
		(3, 'Producto C', 3, 600.00),
		(4, 'Producto D', 5, 70.00),
		(5, 'Producto E', 2, 80.00),
		(6, 'Producto F', 3, 25.00),
		(7, 'Producto G', 4, 150.00),
		(8, 'Producto H', 1, 75.00);
		
	
	INSERT INTO regiones (nombre,pais)
	VALUES 
		('Andalucía', 'España'),
		('Madrid', 'España'),
				('Cataluña', 'España'),
						('Valencia', 'España'),
								('Galicia', 'España');
							

-- Actualizar el Estado de un Envío. Actualiza el estado del envío con id_envio = 3 a "Entregado".
							
UPDATE envios 
SET estado = 'Entregado'
WHERE id_envio =3;

SELECT *
FROM envios e 
ORDER BY id_envio 

-- Modificar el Cargo de un Empleado. Cambia el cargo del empleado con id_empleado = 5 a "Director de Datos".

UPDATE empleados 
SET cargo = 'Director de Datos'
WHERE id_empleado =5;

SELECT *
FROM empleados e 
ORDER BY id_empleado;

-- Incrementar el Precio Unitario de un Producto. Incrementa en un 10% el precio unitario del producto "Producto A" en la tabla Detalle_Envíos.

UPDATE detalles_envio
SET precio_unitario = precio_unitario *1.10
WHERE producto = 'Producto A';

SELECT *
FROM detalles_envio de 

-- Actualizar la Dirección de un Cliente. Modifica la dirección del cliente con id_cliente = 2 a "Nueva Calle B, 123".

UPDATE clientes 
SET direccion = 'Nueva Calle B, 123'
WHERE id_cliente =2;

SELECT *
FROM clientes c 

-- Cambiar el Proveedor de un Envío. Cambia el proveedor del envío con id_envio = 4 al proveedor con id_proveedor = 3.
---- El enunciado pide cambiar al proveedor con ID = 3, peromis datos ya están así. Lo haré al proveedor 2.
SELECT *
FROM envios e 

UPDATE envios 
SET id_proveedor = 2
WHERE id_envio =4;

SELECT *
FROM envios e 

-- Actualizar la Cantidad de un Producto en un Envío. Modifica la cantidad del producto "Producto C" en el envío con id_envio = 2 a 5 unidades.
SELECT * FROM detalles_envio de 

UPDATE detalles_envio 
SET cantidad = 5
WHERE id_envio = 2;

-- Actualizar el Total de un Envío. Incrementa el total del envío con id_envio = 5 en 50 unidades monetarias.

UPDATE envios 
SET total= 50
WHERE id_envio =5

SELECT *
FROM envios e 

-- Modificar el Contacto de un Proveedor. Cambia el contacto del proveedor con id_proveedor = 2 a "Nuevo Contacto 2".
UPDATE proveedores 
SET contacto = 'Nuevo Contacto 2'
WHERE id_proveedor =2;

SELECT *
FROM proveedores p 

-- Cambiar el País de un Cliente. Actualiza el país del cliente con id_cliente = 6 a "Portugal".
UPDATE clientes 
SET pais = 'Portugal'
WHERE id_cliente =6;

SELECT *
FROM clientes c 

-- Actualizar la Fecha de un Envío. Modifica la fecha del envío con id_envio = 7 a "2024-08-10".
UPDATE envios 
SET fecha_envio = '2024-08-10'
WHERE id_envio =7;

-- Añadir una Columna. Añade una columna fecha_nacimiento de tipo DATE a la tabla Clientes.
ALTER TABLE clientes 
ADD COLUMN fecha_nacimiento date;

-- Añadir una Columna. Añade una columna codigo_postal de tipo VARCHAR(10) a la tabla Proveedores.
ALTER TABLE proveedores 
ADD COLUMN codigo_postal varchar(10);

-- Eliminar una Columna. Elimina la columna contacto de la tabla Proveedores.
ALTER TABLE proveedores 
DROP COLUMN contacto;

SELECT *
FROM proveedores p 

-- Eliminar una Columna. Elimina la columna pais de la tabla Regiones.
ALTER TABLE regiones 
DROP COLUMN pais;

-- Modificar el Tipo de Dato de una Columna. Modifica el tipo de dato de la columna telefono en la tabla Clientes a VARCHAR(15).
ALTER TABLE clientes 
ALTER COLUMN telefono TYPE VARCHAR(15);

-- Modificar el Tipo de Dato de una Columna. Modifica el tipo de dato de la columna total en la tabla Envíos a NUMERIC(12, 2).
ALTER TABLE envios 
ALTER COLUMN total TYPE NUMERIC(12, 2);

-- Añadir una Columna. Añade una columna fecha_contrato de tipo DATE a la tabla Empleados.
ALTER TABLE empleados 
ADD COLUMN fecha_contrato date;

-- Eliminar una Columna. Elimina la columna estado de la tabla Envíos.

ALTER TABLE envios 
DROP COLUMN estado;

-- Modificar el Nombre de una Columna. Modifica el nombre de la columna nombre en la tabla Empleados a nombre_completo.
    ALTER TABLE empleados
    RENAME COLUMN nombre TO nombre_completo;
   
-- Listar todos los clientes que viven en España.
SELECT *
FROM clientes c 
WHERE pais = 'España'

-- Obtener todos los envíos realizados por un empleado específico.
SELECT * FROM envios e 
WHERE id_empleado =1

-- Listar todos los productos incluidos en un envío específico.
SELECT *
FROM detalles_envio de 
WHERE de.id_envio = 1
-- Encontrar todos los proveedores con un teléfono específico.
SELECT *
FROM proveedores p 
WHERE telefono = '616244896'
-- Listar los empleados que tienen un cargo de "Supervisor de Envíos".
SELECT *
FROM empleados e 
WHERE cargo = 'Supervisor de Envíos'
-- Obtener todos los envíos que fueron realizados por el cliente con id_cliente = 5.
SELECT *
FROM envios e 
WHERE id_cliente = 5
-- Listar todas las regiones con su nombre y país.
SELECT *
FROM regiones r 
-- Mostrar todos los productos cuyo precio unitario sea mayor que 50.
SELECT *
FROM detalles_envio de2 
WHERE precio_unitario > 50
-- Obtener todos los envíos realizados el 2024-08-05.
SELECT *
FROM envios e 
WHERE fecha_envio = '2024-08-10'
-- Listar todos los clientes que tienen un número de teléfono que comienza con "6003".
SELECT *
FROM clientes c 
WHERE telefono LIKE '6003'
