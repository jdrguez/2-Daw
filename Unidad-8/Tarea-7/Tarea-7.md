# Funciones para encapsular el código
```sql

DROP FUNCTION IF EXISTS subsidio_transporte; 
DELIMITER //

CREATE FUNCTION subsidio_transporte(current_salario DECIMAL) 
RETURNS DECIMAL DETERMINISTIC
BEGIN
    DECLARE total DECIMAL;
    SET total = current_salario * 0.07;
RETURN total;
END//


DELIMITER ;


DROP FUNCTION IF EXISTS salud; 
DELIMITER //

CREATE FUNCTION salud(current_salario DECIMAL) 
RETURNS DECIMAL DETERMINISTIC
BEGIN
    DECLARE total DECIMAL;

    SET total = current_salario * 0.04;
RETURN total;
END//

DELIMITER ;




DROP FUNCTION IF EXISTS pension; 
DELIMITER //

CREATE FUNCTION pension(current_salario DECIMAL) 
RETURNS DECIMAL DETERMINISTIC
BEGIN
    DECLARE total DECIMAL;
    SET total = current_salario * 0.04;
    RETURN total;
END//

DELIMITER ;





DROP FUNCTION IF EXISTS bono; 
DELIMITER //

CREATE FUNCTION bono(current_salario DECIMAL) 
RETURNS DECIMAL DETERMINISTIC
BEGIN
    DECLARE total DECIMAL;
    SET total = current_salario * 0.08;
    RETURN total;
END//

DELIMITER ;


```
# Trigger Before para calcular las inserciones

```sql
DELIMITER //

DROP TRIGGER IF EXISTS before_insert_persona;

CREATE TRIGGER before_insert_persona
BEFORE INSERT ON persona
FOR EACH ROW
BEGIN
    DECLARE salario_base DECIMAL;
    DECLARE subsidio DECIMAL;
    DECLARE salud_val DECIMAL;
    DECLARE pension_val DECIMAL;
    DECLARE bono_val DECIMAL;
    DECLARE integral_val DECIMAL;
    SET salario_base = FLOOR(RAND() * (2000 - 1000 + 1)) + 1000;
    SET NEW.salario_base = salario_base;

    SET subsidio = subsidio_transporte(salario_base);
    SET salud_val = salud(salario_base);
    SET pension_val = pension(salario_base);
    SET bono_val = bono(salario_base);
    SET integral_val = salario_base - salud_val - pension_val + bono_val + subsidio;

    SET NEW.subsidio = subsidio;
    SET NEW.salud = salud_val;
    SET NEW.pension = pension_val;
    SET NEW.bono = bono_val;
    SET NEW.integral = integral_val;
END//

DELIMITER ;


```

# Procedimiento

```sql
DELIMITER //

DROP PROCEDURE IF EXISTS inserciones;

CREATE PROCEDURE inserciones(IN iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE aux INT DEFAULT 0;
    DECLARE id_random VARCHAR(100);
    DECLARE nombre_random VARCHAR(150);

    WHILE counter < iterations DO
        SET id_random = CONCAT(UUID(), '-', -1);
        SET aux = aux + FLOOR(RAND() * (10 - 100 + 1) + 100);
        SET nombre_random = CONCAT('Empleado', '-', aux);

        INSERT INTO persona (id, nombre, salario_base, subsidio, salud, pension, bono, integral)
        VALUES (id_random, nombre_random, 0, 0, 0, 0, 0, 0);

        SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;

```

# Ejecutado el procedimiento con diez:
```sql
call inserciones(10);
Query OK, 1 row affected (0.03 sec)

mysql> SELECT * FROM persona;
+-----------------------------------------+--------------+--------------+----------+-------+---------+------+----------+
| id                                      | nombre       | salario_base | subsidio | salud | pension | bono | integral |
+-----------------------------------------+--------------+--------------+----------+-------+---------+------+----------+
| df085982-15ef-11ef-8fb1-7a48fa1060af--1 | Empleado-99  |         1897 |      133 |    76 |      76 |  152 |     2030 |
| df08a1ee-15ef-11ef-8fb1-7a48fa1060af--1 | Empleado-156 |         1680 |      118 |    67 |      67 |  134 |     1798 |
| df08d2fe-15ef-11ef-8fb1-7a48fa1060af--1 | Empleado-168 |         1851 |      130 |    74 |      74 |  148 |     1981 |
| df0902d8-15ef-11ef-8fb1-7a48fa1060af--1 | Empleado-239 |         1048 |       73 |    42 |      42 |   84 |     1121 |
| df0942a2-15ef-11ef-8fb1-7a48fa1060af--1 | Empleado-313 |         1259 |       88 |    50 |      50 |  101 |     1348 |
| df097362-15ef-11ef-8fb1-7a48fa1060af--1 | Empleado-372 |         1497 |      105 |    60 |      60 |  120 |     1602 |
| df09a706-15ef-11ef-8fb1-7a48fa1060af--1 | Empleado-461 |         1104 |       77 |    44 |      44 |   88 |     1181 |
| df09dffa-15ef-11ef-8fb1-7a48fa1060af--1 | Empleado-546 |         1505 |      105 |    60 |      60 |  120 |     1610 |
| df0a0e8a-15ef-11ef-8fb1-7a48fa1060af--1 | Empleado-642 |         1667 |      117 |    67 |      67 |  133 |     1783 |
| df0a2c4e-15ef-11ef-8fb1-7a48fa1060af--1 | Empleado-722 |         1120 |       78 |    45 |      45 |   90 |     1198 |
+-----------------------------------------+--------------+--------------+----------+-------+---------+------+----------+
10 rows in set (0.01 sec)
```

# Ejecutado el procedimiento con 100000:

call inserciones(100000);
Query OK, 1 row affected (4 min 3.20 sec)
No te pongo el select porque el gigante
