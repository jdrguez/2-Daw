```sql

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

    SET inicial = SUBSTRING(nombre, 1, 1);
    SET tres_apellido1 = SUBSTRING(apellido1, 1, 3);
    SET tres_apellido2 = SUBSTRING(apellido2, 1, 3);
    SET aux_special = '@';




RETURN email;
END//

DELIMITER ;



```