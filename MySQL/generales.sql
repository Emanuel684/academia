-- mysql -h localhost -u root -p
SHOW databases; -- Nos permite visualizar las bases de datos en MySql que tenemos
SHOW tables; -- Nos muestra las tablas que se encuentran en la base de datos estando en ella
USE acedemia; -- Nos permite seleccionar la base de datos ya existente
CREATE TABLE nombre_tabla; -- Nos permite crear la tabla dentro de una base de datos
DROP TABLE IF EXISTS nombre_table; -- Borra la tabla si existe

FLUSH PRIVILEGES; -- Brinda privilegios en los comandos

-- PARA CREAR UN USUARIO
CREATE USER 'nombre_usuario'@'localhost' IDENTIFIED BY 'tu_contrasena';
-- Fin 

-- Asignar los privilegios a un usuario
GRANT USAGE ON *.* TO 'nombre'@'localhost' IDENTIFIED BY 'password'; -- Permite otorgat todos los privilegios a un usuario
GRANT USAGE ON *.* TO 'emanuel'@'localhost' IDENTIFIED BY '1000305848';
GRANT ALL PRIVILEGES ON *.* TO 'nombre_usuario'@'localhost' IDENTIFIED BY 'password';

GRANT ALL PRIVILEGES ON academia* TO 'nombre_usuario'@'localhost';
-- Fin asignar privilegios


desc tipo_documento; -- Ver la descripcion de una tabla en una base de datos

-- CLASE #2 CON MYSQL

mysqldump -u emanuel -p academia >MySQL\script_exportable.sql -- Exportar una base de datos en formato sql

UNSIGNED -- Para que no reciva valores negativos

SHOW ENGINES; -- Mostrar los motores de almacenamiento 

-- /////////////////////////////////////////////////
-- ALTERS

ALTER TABLE modulos
ADD PRIMARY KEY(id);

ALTER TABLE modulos
DROP COLUMN mo;

ALTER TABLE modulos
ADD COLUMN `mod` VARCHAR(10);

-- /////////////////////////////////////////////

-- FOREN KEYS
ALTER TABLE actores
ADD CONSTRAINT `fk_estado_actor`
FOREIGN KEY (`estado_actor_id`)
REFERENCES `estado_actores` (`id`);

CONSTRAINT `fk_estado_actor`
    FOREIGN KEY (`estado_actor_id`)
    REFERENCES `estado_actores` (`id`)
        ON DELETE RESTRICT
        ON UPDATE CASCADE

FOREIGN KEY (`tipo_actor_id`) REFERENCES `tipo_actores` (`id`)