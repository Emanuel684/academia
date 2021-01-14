USE academia;

DROP TABLE IF EXISTS actores;
DROP TABLE IF EXISTS tipo_documento;
DROP TABLE IF EXISTS tipo_actores;
DROP TABLE IF EXISTS estado_actores;
DROP TABLE IF EXISTS modulos;

CREATE TABLE tipo_documento(
    codigo VARCHAR(3) PRIMARY KEY,
    descripcion VARCHAR(100) NOT NULL
);

CREATE TABLE tipo_actores(
    id INT(5) UNSIGNED AUTO_INCREMENT,
    perfil VARCHAR(100),
    PRIMARY KEY(id)
);

-- Insertar informacion en tipo_actores

INSERT INTO tipo_actores VALUES(1,'Alumno');
INSERT INTO tipo_actores(perfil) VALUES('Docente'); -- Insertar unicamente a columnas expecificas
INSERT INTO tipo_actores(perfil) VALUES ('Cordinador'),('Rector'); -- Insertar valores multiples

-- Actualizar un registro
UPDATE tipo_actores SET perfil = 'Estudiante' WHERE id = 1;
UPDATE tipo_actores SET perfil = 'Estudiante' WHERE id IN (1,2,3); -- Se transfiere el valor a los registros expecificados

-- Eliminar un registro de la tabla
DELETE FROM tipo_actores WHERE id = 1; -- Elimina el registro 1
DELETE FROM tipo_actores; -- Elimina todos los registros
TRUNCATE tipo_actores; -- Resetea la tabla completamente 




SELECT perfil FROM tipo_actores;
SELECT id FROM tipo_actores;
SELECT * FROM tipo_actores;
SELECT perfil, id, NOW() FROM tipo_actores;

-- Fin insertar informacion en tipo_actores


CREATE TABLE estado_actores(
    id INTEGER(5) UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    estado VARCHAR(30)
) ENGINE = INNODB;

CREATE TABLE modulos(
    id INT(5),
    modulo VARCHAR(255),
    mo VARCHAR(10)
) ENGINE = INNODB;

ALTER TABLE modulos
ADD PRIMARY KEY(id);

ALTER TABLE modulos
DROP COLUMN mo;

ALTER TABLE modulos
ADD COLUMN `mod` VARCHAR(10);

CREATE TABLE actores(
    id INT(5) UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    documento VARCHAR(20) NOT NULL UNIQUE,
    tipo_documento VARCHAR(3) NOT NULL,
    nombres VARCHAR(255),
    apellidos VARCHAR(255),
    contrasena VARCHAR(100) NOT NULL,
    correo VARCHAR(255) NOT NULL DEFAULT 'correo@dominio.com',
    telefono_celular VARCHAR(30) COMMENT 'Telefono celular del estudiante',
    numero_expediente VARCHAR(255) NOT NULL UNIQUE,
    genero ENUM('hombre','mujer') NOT NULL,
    fecha_nacimiento DATE NOT NULL, -- DEFAULT NOW()
    estado_actor_id INT(5) UNSIGNED,
    institucion_id INT(5),
    tipo_actor_id INT(5) UNSIGNED,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (`tipo_actor_id`) REFERENCES `tipo_actores` (`id`)
) ENGINE=INNODB;

ALTER TABLE actores
ADD CONSTRAINT `fk_estado_actor`
FOREIGN KEY (`estado_actor_id`)
REFERENCES `estado_actores` (`id`)
    ON DELETE RESTRICT -- Restringe la eliminacion en la relacion
    ON UPDATE CASCADE; -- Si se actualiza automaticamente se actualiza en la tabla de la relacion


