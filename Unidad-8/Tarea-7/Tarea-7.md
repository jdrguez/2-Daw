```sql

DROP FUNCTION IF EXISTS subsidio_transporte; 
DELIMITER //

CREATE FUNCTION subsidio_transporte(id_persona VARCHAR(100)) 
RETURNS DECIMAL DETERMINISTIC
BEGIN
    DECLARE total DECIMAL;
    DECLARE current_salario DECIMAL;

    SELECT salario_base FROM persona where id=id_persona INTO current_salario;

    SET total = current_salario * 0.07;
RETURN total;
END//


DELIMITER ;





DROP FUNCTION IF EXISTS salud; 
DELIMITER //

CREATE FUNCTION salud(id_persona VARCHAR(100)) 
RETURNS DECIMAL DETERMINISTIC
BEGIN
    DECLARE total DECIMAL;
    DECLARE current_salario DECIMAL;

    SELECT salario_base FROM persona where id=id_persona INTO current_salario;

    SET total = current_salario * 0.04;
RETURN total;
END//

DELIMITER ;




DROP FUNCTION IF EXISTS pension; 
DELIMITER //

CREATE FUNCTION pension(id_persona VARCHAR(100)) 
RETURNS DECIMAL DETERMINISTIC
BEGIN
    DECLARE total DECIMAL;
    DECLARE current_salario DECIMAL;

    SELECT salario_base FROM persona where id=id_persona INTO current_salario;

    SET total = current_salario * 0.04;
    RETURN total;
END//

DELIMITER ;





DROP FUNCTION IF EXISTS bono; 
DELIMITER //

CREATE FUNCTION bono(id_persona VARCHAR(100)) 
RETURNS DECIMAL DETERMINISTIC
BEGIN
    DECLARE total DECIMAL;
    DECLARE current_salario DECIMAL;

    SELECT salario_base FROM persona where id=id_persona INTO current_salario;

    SET total = current_salario * 0.08;
    RETURN total;
END//

DELIMITER ;




DROP FUNCTION IF EXISTS integral; 
DELIMITER //

CREATE FUNCTION integral(id_persona VARCHAR(100)) 
RETURNS DECIMAL DETERMINISTIC
BEGIN
    DECLARE total DECIMAL;
    DECLARE current_salario DECIMAL;
    DECLARE current_subsidio DECIMAL;
    DECLARE current_salud DECIMAL;
    DECLARE current_pension DECIMAL;
    DECLARE current_bono DECIMAL;

    SELECT salario_base, subsidio, salud, pension, bono FROM persona where id=id_persona INTO current_salario, current_subsidio, current_salud, current_pension, current_bono;

    SET total = current_salario - current_salud - current_pension + current_bono + current_subsidio; 
    RETURN total;
END//

DELIMITER ;















DROP PROCEDURE IF EXISTS inserciones;

DELIMITER //

CREATE PROCEDURE inserciones(IN iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE aux INT DEFAULT 0;
    DECLARE id_random VARCHAR(100);
    DECLARE salario INT;
    DECLARE nombre_random VARCHAR(150);
    DECLARE subsidio_random DECIMAL;
    DECLARE salud_random DECIMAL;
    DECLARE pension_random DECIMAL;
    DECLARE bono_random DECIMAL;
    DECLARE integral_random DECIMAL;
   

    WHILE counter < iterations DO
        SET id_random = CONCAT(UUID(), '-', -1);
        SET salario = FLOOR(RAND()* (2000 - 1000 + 1)) + 1000;
        SET aux = aux + 1;
        SET nombre_random = CONCAT('Empleado', '-', aux);
        SELECT subsidio_transporte(id_random) into subsidio_random;
        SELECT salud(id_random) into salud_random;
        SELECT pension(id_random) into pension_random;
        SELECT bono(id_random) into bono_random;
        SELECT integral(id_random) into integral_random;

        INSERT INTO persona (id, nombre, salario_base, subsidio, salud, pension, bono, integral)
        VALUES (id_random, nombre_random, salario, subsidio_random, salud_random, pension_random, bono_random, integral_random);

        SET counter = counter + 1;
        
    END WHILE;
END//

DELIMITER ;








```