```sql

-- Función de encapsulamiento
DELIMITER //

DROP FUNCTION IF EXISTS comprobante; 
DELIMITER //

CREATE FUNCTION comprobante(nota DECIMAL) 
RETURNS DECIMAL DETERMINISTIC
BEGIN
    IF nota < 0 THEN
        SET nota = 0;
    ELSEIF nota > 10 THEN
        SET nota = 10;
    END IF;
RETURN nota;
END//

DELIMITER ;


-- Triggers de before
DROP TRIGGER IF EXISTS before_insert_nota;
DELIMITER //
CREATE TRIGGER before_insert_nota
BEFORE INSERT ON alumno
FOR EACH ROW
BEGIN
    SET NEW.nota = comprobante(NEW.nota);
END//

DELIMITER ;



DROP TRIGGER IF EXISTS before_update_nota;
DELIMITER //
CREATE TRIGGER before_update_nota
BEFORE UPDATE ON alumno
FOR EACH ROW
BEGIN
    SET NEW.nota = comprobante(OLD.nota);
END//

DELIMITER ;



-- Procedimiento

DELIMITER //

DROP PROCEDURE IF EXISTS insercion_alumnos;

CREATE PROCEDURE insercion_alumnos(IN iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE aux INT DEFAULT 0;
    DECLARE nombre_random VARCHAR(25);
    DECLARE apellido1 VARCHAR(25);
    DECLARE apellido2 VARCHAR(25);
    DECLARE nota DECIMAL(10,2);

    WHILE counter < iterations DO
        SET aux = aux + FLOOR(RAND() * (10 - 100 + 1) + 100);
        SET nombre_random = CONCAT('Alumno', '-', aux);
        SET apellido1 = CONCAT('Apellido1', '-', aux);
        SET apellido2 = CONCAT('Apellido2', '-', aux);
        SET nota = ((RAND() * (10 - 3)) + 3);
        INSERT INTO alumno (nombre, apellido1, apellido2, nota)
        VALUES (nombre_random, apellido1, apellido2, nota);

        SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;

DELIMITER //

DROP PROCEDURE IF EXISTS insercion_alumnos_nota_inferior;

CREATE PROCEDURE insercion_alumnos_nota_inferior(IN iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE aux INT DEFAULT 0;
    DECLARE nombre_random VARCHAR(25);
    DECLARE apellido1 VARCHAR(25);
    DECLARE apellido2 VARCHAR(25);
    DECLARE nota DECIMAL(10,2);


    WHILE counter < iterations DO
        SET aux = aux + FLOOR(RAND() * (10 - 100 + 1) + 100);
        SET nombre_random = CONCAT('Alumno', '-', aux);
        SET apellido1 = CONCAT('Apellido1', '-', aux);
        SET apellido2 = CONCAT('Apellido2', '-', aux);
        SET nota = ((RAND() * (12 - -10)) + -10);
        INSERT INTO alumno (nombre, apellido1, apellido2, nota)
        VALUES (nombre_random, apellido1, apellido2, nota);

        SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;


-- Resultados:
call insercion_alumnos(10);
Query OK, 1 row affected (0.01 sec)

mysql> CALL insercion_alumnos_nota_inferior(10);
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM alumno;
+----+------------+---------------+---------------+------+
| id | nombre     | apellido1     | apellido2     | nota |
+----+------------+---------------+---------------+------+
| 31 | Alumno-94  | Apellido1-94  | Apellido2-94  | 8.00 |
| 32 | Alumno-138 | Apellido1-138 | Apellido2-138 | 9.00 |
| 33 | Alumno-208 | Apellido1-208 | Apellido2-208 | 4.00 |
| 34 | Alumno-251 | Apellido1-251 | Apellido2-251 | 9.00 |
| 35 | Alumno-347 | Apellido1-347 | Apellido2-347 | 9.00 |
| 36 | Alumno-443 | Apellido1-443 | Apellido2-443 | 8.00 |
| 37 | Alumno-502 | Apellido1-502 | Apellido2-502 | 4.00 |
| 38 | Alumno-571 | Apellido1-571 | Apellido2-571 | 5.00 |
| 39 | Alumno-644 | Apellido1-644 | Apellido2-644 | 8.00 |
| 40 | Alumno-680 | Apellido1-680 | Apellido2-680 | 6.00 |
| 41 | Alumno-22  | Apellido1-22  | Apellido2-22  | 0.00 |
| 42 | Alumno-118 | Apellido1-118 | Apellido2-118 | 8.00 |
| 43 | Alumno-216 | Apellido1-216 | Apellido2-216 | 3.00 |
| 44 | Alumno-235 | Apellido1-235 | Apellido2-235 | 6.00 |
| 45 | Alumno-249 | Apellido1-249 | Apellido2-249 | 3.00 |
| 46 | Alumno-343 | Apellido1-343 | Apellido2-343 | 2.00 |
| 47 | Alumno-389 | Apellido1-389 | Apellido2-389 | 0.00 |
| 48 | Alumno-411 | Apellido1-411 | Apellido2-411 | 0.00 |
| 49 | Alumno-507 | Apellido1-507 | Apellido2-507 | 0.00 |
| 50 | Alumno-528 | Apellido1-528 | Apellido2-528 | 8.00 |
+----+------------+---------------+---------------+------+
20 rows in set (0.00 sec)

mysql> INSERT INTO alumno (nombre, apellido1, apellido2, nota) VALUES ('negativo', 'negativo1', 'negativo2', 13);
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM alumno;
+----+------------+---------------+---------------+-------+
| id | nombre     | apellido1     | apellido2     | nota  |
+----+------------+---------------+---------------+-------+
| 31 | Alumno-94  | Apellido1-94  | Apellido2-94  |  8.00 |
| 32 | Alumno-138 | Apellido1-138 | Apellido2-138 |  9.00 |
| 33 | Alumno-208 | Apellido1-208 | Apellido2-208 |  4.00 |
| 34 | Alumno-251 | Apellido1-251 | Apellido2-251 |  9.00 |
| 35 | Alumno-347 | Apellido1-347 | Apellido2-347 |  9.00 |
| 36 | Alumno-443 | Apellido1-443 | Apellido2-443 |  8.00 |
| 37 | Alumno-502 | Apellido1-502 | Apellido2-502 |  4.00 |
| 38 | Alumno-571 | Apellido1-571 | Apellido2-571 |  5.00 |
| 39 | Alumno-644 | Apellido1-644 | Apellido2-644 |  8.00 |
| 40 | Alumno-680 | Apellido1-680 | Apellido2-680 |  6.00 |
| 41 | Alumno-22  | Apellido1-22  | Apellido2-22  |  0.00 |
| 42 | Alumno-118 | Apellido1-118 | Apellido2-118 |  8.00 |
| 43 | Alumno-216 | Apellido1-216 | Apellido2-216 |  3.00 |
| 44 | Alumno-235 | Apellido1-235 | Apellido2-235 |  6.00 |
| 45 | Alumno-249 | Apellido1-249 | Apellido2-249 |  3.00 |
| 46 | Alumno-343 | Apellido1-343 | Apellido2-343 |  2.00 |
| 47 | Alumno-389 | Apellido1-389 | Apellido2-389 |  0.00 |
| 48 | Alumno-411 | Apellido1-411 | Apellido2-411 |  0.00 |
| 49 | Alumno-507 | Apellido1-507 | Apellido2-507 |  0.00 |
| 50 | Alumno-528 | Apellido1-528 | Apellido2-528 |  8.00 |
| 51 | negativo   | negativo1     | negativo2     | 10.00 |
+----+------------+---------------+---------------+-------+
21 rows in set (0.00 sec)




```