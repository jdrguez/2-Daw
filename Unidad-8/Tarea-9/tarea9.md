```sql


DROP FUNCTION IF EXISTS eliminar_acentos;
DELIMITER //

CREATE FUNCTION eliminar_acentos(nombre VARCHAR(25))
RETURNS VARCHAR(25) DETERMINISTIC
BEGIN







RETURN nombre_sin_acentos:
END //

DELIMITER ;





DELIMITER //



DROP FUNCTION IF EXISTS crear_email; 
DELIMITER //

CREATE FUNCTION crear_email(nombre VARCHAR(20), apellido1 VARCHAR(20), apellido2 VARCHAR(20), dominio VARCHAR(20)) 
RETURNS VARCHAR(100) DETERMINISTIC
BEGIN
    DECLARE inicial VARCHAR(1);
    DECLARE tres_apellido1 VARCHAR(3);
    DECLARE tres_apellido2 VARCHAR(3);
    DECLARE aux_special VARCHAR(1);
    DECLARE email VARCHAR(100);

    SET inicial = UPPER(SUBSTRING(nombre, 1, 1));
    SET tres_apellido1 = UPPER(SUBSTRING(apellido1, 1, 3));
    SET tres_apellido2 = UPPER(SUBSTRING(apellido2, 1, 3));
    SET aux_special = '@';

    SET email = CONCAT(inicial,tres_apellido1, tres_apellido2, aux_special, dominio, '.com');

RETURN email;
END//

DELIMITER ;



```