
```sql
DELIMITER //
DROP FUNCTION IF EXISTS dominio;

CREATE FUNCTION dominio()
RETURNS VARCHAR(20) DETERMINISTIC
BEGIN
    DECLARE dominio VARCHAR(20);
    SET dominio = 'miempresa.com';
RETURN dominio;
END //

DELIMITER ;

DROP FUNCTION IF EXISTS quitar_tildes;
DELIMITER //

CREATE FUNCTION quitar_tildes(input VARCHAR(255)) RETURNS VARCHAR(255) DETERMINISTIC
BEGIN
    DECLARE salida VARCHAR(255);
    
    SET salida = input;
    SET salida = REPLACE(salida, 'á', 'a');
    SET salida = REPLACE(salida, 'é', 'e');
    SET salida = REPLACE(salida, 'í', 'i');
    SET salida = REPLACE(salida, 'ó', 'o');
    SET salida = REPLACE(salida, 'ú', 'u');
    SET salida = REPLACE(salida, 'Á', 'A');
    SET salida = REPLACE(salida, 'É', 'E');
    SET salida = REPLACE(salida, 'Í', 'I');
    SET salida = REPLACE(salida, 'Ó', 'O');
    SET salida = REPLACE(salida, 'Ú', 'U');

RETURN salida;
END//

DELIMITER ;



DROP FUNCTION IF EXISTS crear_email; 
DELIMITER //

CREATE FUNCTION crear_email(nombre VARCHAR(20), apellido1 VARCHAR(20), apellido2 VARCHAR(20)) 
RETURNS VARCHAR(100) DETERMINISTIC
BEGIN
    DECLARE inicial VARCHAR(1);
    DECLARE tres_apellido1 VARCHAR(3);
    DECLARE tres_apellido2 VARCHAR(3);
    DECLARE aux_special VARCHAR(1);
    DECLARE email VARCHAR(100);

    SET inicial = UPPER(SUBSTRING(quitar_tildes(nombre), 1, 1));
    SET tres_apellido1 = UPPER(SUBSTRING(quitar_tildes(apellido1), 1, 3));
    SET tres_apellido2 = UPPER(SUBSTRING(quitar_tildes(apellido2), 1, 3));
    SET aux_special = '@';

    SET email = CONCAT(inicial, tres_apellido1, tres_apellido2, aux_special, dominio());


RETURN email;
END//

DELIMITER ;


DROP TRIGGER IF EXISTS trigger_crear_email_before_insert;

DELIMITER //

CREATE TRIGGER trigger_crear_email_before_insert
BEFORE INSERT ON alumno
FOR EACH ROW
BEGIN
    IF NEW.email is NULL THEN
        SET NEW.email = crear_email(NEW.nombre, NEW.apellido1, NEW.apellido2);
    END IF;

END //
DELIMITER ;



DROP PROCEDURE IF EXISTS inserciones;
DELIMITER //
CREATE PROCEDURE inserciones(in insercion INT)
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE nombre_random VARCHAR(25);
    DECLARE apellido1 VARCHAR(25);
    DECLARE apellido2 VARCHAR(25);
    
    WHILE counter < insercion DO
        SET nombre_random = CONCAT('Alumno', '-', FLOOR(RAND() * (10 - 100 + 1) + 100));
        SET apellido1 = CONCAT('Apellido1',  '-', FLOOR(RAND() * (10 - 100 + 1) + 100));
        SET apellido2 = CONCAT('Apellido2', '-', FLOOR(RAND() * (10 - 100 + 1) + 100));
        
        INSERT INTO alumno (nombre, apellido1, apellido2, email) VALUES (nombre_random, apellido1, apellido2, NULL);

        SET counter = counter + 1;
    END WHILE;
END //

DELIMITER ;


-- RESULTADOS:


 call inserciones(10);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO alumno(nombre, apellido1, apellido2, email) VALUES('jose', 'rodríguez', 'rodríguez', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> SELECT * FROM alumno;
+----+-----------+--------------+--------------+-----------------------+
| id | nombre    | apellido1    | apellido2    | email                 |
+----+-----------+--------------+--------------+-----------------------+
| 23 | Alumno-84 | Apellido1-90 | Apellido2-95 | AAPEAPE@miempresa.com |
| 24 | Alumno-19 | Apellido1-65 | Apellido2-82 | AAPEAPE@miempresa.com |
| 25 | Alumno-26 | Apellido1-50 | Apellido2-73 | AAPEAPE@miempresa.com |
| 26 | Alumno-26 | Apellido1-80 | Apellido2-44 | AAPEAPE@miempresa.com |
| 27 | Alumno-57 | Apellido1-54 | Apellido2-89 | AAPEAPE@miempresa.com |
| 28 | Alumno-94 | Apellido1-15 | Apellido2-49 | AAPEAPE@miempresa.com |
| 29 | Alumno-12 | Apellido1-78 | Apellido2-79 | AAPEAPE@miempresa.com |
| 30 | Alumno-61 | Apellido1-57 | Apellido2-92 | AAPEAPE@miempresa.com |
| 31 | Alumno-11 | Apellido1-37 | Apellido2-51 | AAPEAPE@miempresa.com |
| 32 | Alumno-46 | Apellido1-67 | Apellido2-95 | AAPEAPE@miempresa.com |
| 33 | jose      | rodríguez    | rodríguez    | JRODROD@miempresa.com |
+----+-----------+--------------+--------------+-----------------------+
11 rows in set (0.00 sec)



UPDATE persona
SET fecha_transaccion = (SELECT DATE_ADD('2014-01-01', INTERVAL FLOOR(RAND() * 3650) DAY));



```