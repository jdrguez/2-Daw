DROP DATABASE IF EXISTS alumnos;
CREATE DATABASE alumnos;
USE alumnos;



DROP TABLE IF EXISTS alumno;
CREATE TABLE alumno(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30),
    apellido1 VARCHAR(30),
    apellido2 VARCHAR(30),
    email VARCHAR(30)
);


DROP TABLE IF EXISTS log_cambios_email;
CREATE TABLE log_cambios_email(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_alumno INT,
    fecha_hora DATE,
    old_email VARCHAR(30),
    new_email VARCHAR(30)
);

DROP TABLE IF EXISTS log_cambios_eliminados;
CREATE TABLE log_cambios_eliminados(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_alumno INT,
    fecha_hora DATE,
    nombre VARCHAR(30),
    apellido1 VARCHAR(30),
    apellido2 VARCHAR(30),
    email VARCHAR(30),
);

DROP TRIGGER IF EXISTS trigger_guardar_email_after_update;
DELIMITER //

CREATE TRIGGER trigger_guardar_email_after_update
AFTER UPDATE ON alumno
FOR EACH ROW
BEGIN

    INSERT INTO log_cambios_email(id_alumno, fecha_hora, old_email, new_email)
    VALUES(OLD.id, NOW(), OLD.email, NEW.email);

END //

DELIMITER ;



DROP TRIGGER IF EXISTS trigger_guardar_alumnos_eliminados;
DELIMITER //

CREATE TRIGGER trigger_guardar_alumnos_eliminados
AFTER DELETE ON alumno
FOR EACH ROW
BEGIN


    INSERT INTO log_cambios_eliminados(id_alumno, fecha_hora, nombre, apellido1, apellido2, email)
    VALUES(OLD.id, NOW(), OLD.nombre, OLD.apellido1, OLD.apellido2,OLD.email);


END //

DELIMITER ;