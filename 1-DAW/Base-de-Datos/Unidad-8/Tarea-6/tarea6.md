# Dado el procedimiento base:
```sql
DELIMITER //

CREATE PROCEDURE my_loop(IN iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < iterations DO
        -- Coloca aquí el código que deseas ejecutar en cada iteración del bucle
        -- Por ejemplo, puedes imprimir el valor del contador
        SELECT counter;

        SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;

-- Llama al procedimiento 
CALL my_loop(5);
```
## Y las funciones descritas en aleatoriedad, realiza los siguientes procedimientos, que realicen las siguietes operaciones:

### Inserta cinco filas en la tabla empleados con nombres aleatorios generados usando la función CONCAT() junto con RAND().
```sql
DELIMITER //

CREATE PROCEDURE insertar_empleado(IN iterations INT, emp_nombre VARCHAR(100))
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE emp_salario INT;

    SET emp_salario = 2000;
    WHILE counter < iterations DO
        -- Coloca aquí el código que deseas ejecutar en cada iteración del bucle
        -- Por ejemplo, puedes imprimir el valor del contador
        INSERT INTO empleados (nombre, salario)
        VALUES (CONCAT(emp_nombre, RAND()), FLOOR(RAND() * (10000 - 2000 + 1)) + emp_salario);
        SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;

-- Llama al procedimiento 
CALL insertar_empleado(5, 'Pedro');

--Antes:
SELECT * FROM empleados;
+----+--------+---------+
| id | nombre | salario |
+----+--------+---------+
|  1 | Juan   | 3000.00 |
|  2 | María  | 3500.00 |
|  3 | Pedro  | 3200.00 |
+----+--------+---------+
3 rows in set (0,00 sec)

--Después:
CALL insertar_empleado(5);
Query OK, 1 row affected (0,06 sec)

mysql> SELECT * FROM empleados;
+----+--------------------------+---------+
| id | nombre                   | salario |
+----+--------------------------+---------+
|  1 | Juan                     | 3000.00 |
|  2 | María                    | 3500.00 |
|  3 | Pedro                    | 3200.00 |
|  4 | Pedro0.3416846770250096  | 9617.00 |
|  5 | Pedro0.7350332110515173  | 8553.00 |
|  6 | Pedro0.8904691933565486  | 9961.00 |
|  7 | Pedro0.30361605091357236 | 6265.00 |
|  8 | Pedro0.7544825037517422  | 3385.00 |
+----+--------------------------+---------+
8 rows in set (0,00 sec)
```

### Inserta tres filas en la tabla empleados con nombres aleatorios generados usando la función UUID().

INSERT INTO empleados (nombre, salario)
VALUES (UUID(), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000),
      (UUID(), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000),
      (UUID(), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000);

```sql
DELIMITER //

CREATE PROCEDURE insertar_nombre_unico(IN iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE emp_nombre VARCHAR(100);
    DECLARE emp_salario INT;

    SET emp_salario = 2000;
    WHILE counter < iterations DO
        -- Coloca aquí el código que deseas ejecutar en cada iteración del bucle
        -- Por ejemplo, puedes imprimir el valor del contador
        SELECT UUID() into emp_nombre;

        INSERT INTO empleados (nombre, salario)
        VALUES (emp_nombre, FLOOR(RAND() * (10000 - 2000 + 1)) + emp_salario);

        SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;

--RESULTADO:
CALL insertar_nombre_unico(7);
Query OK, 3 rows affected (0,05 sec)

mysql> SELECT * FROM empleados;
+----+--------------------------------------+---------+
| id | nombre                               | salario |
+----+--------------------------------------+---------+
|  1 | Juan                                 | 3000.00 |
|  2 | María                                | 3500.00 |
|  3 | Pedro                                | 3200.00 |
|  4 | Pedro0.3416846770250096              | 9617.00 |
|  5 | Pedro0.7350332110515173              | 8553.00 |
|  6 | Pedro0.8904691933565486              | 9961.00 |
|  7 | Pedro0.30361605091357236             | 6265.00 |
|  8 | Pedro0.7544825037517422              | 3385.00 |
|  9 | 4502b9ab-1201-11ef-8a1d-080027b67a95 | 6821.00 |
| 10 | 4502b9ab-1201-11ef-8a1d-080027b67a95 | 5948.00 |
| 11 | 4502b9ab-1201-11ef-8a1d-080027b67a95 | 7276.00 |
| 12 | 4505c77b-1201-11ef-8a1d-080027b67a95 | 8537.00 |
| 13 | 4505c77b-1201-11ef-8a1d-080027b67a95 | 2855.00 |
| 14 | 4505c77b-1201-11ef-8a1d-080027b67a95 | 2667.00 |
| 15 | 45086918-1201-11ef-8a1d-080027b67a95 | 2769.00 |
| 16 | 45086918-1201-11ef-8a1d-080027b67a95 | 3845.00 |
| 17 | 45086918-1201-11ef-8a1d-080027b67a95 | 8918.00 |
+----+--------------------------------------+---------+
17 rows in set (0,00 sec)
```

### Inserta dos filas en la tabla empleados con nombres aleatorios generados usando la función RAND() junto con ORDER BY RAND().
```sql
DELIMITER //

CREATE PROCEDURE group_by_nombre(IN iterations INT, base VARCHAR(10))
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE emp_nombre VARCHAR(10);
    DECLARE emp_salario INT;

    SET emp_nombre = base;
    SET emp_salario = 2000;
    WHILE counter < iterations DO
        -- Coloca aquí el código que deseas ejecutar en cada iteración del bucle
        -- Por ejemplo, puedes imprimir el valor del contador
        INSERT INTO empleados (nombre, salario)
        SELECT CONCAT(base, RAND()), FLOOR(RAND() * (10000 - emp_salario + 1)) + emp_salario
        FROM (SELECT 1 UNION SELECT 2) AS sub
        ORDER BY RAND()
        LIMIT 1;
        SET counter = counter + 1;
    END WHILE;
END//
DELIMITER ;

--Resultado:
CALL group_by_nombre(4, 'Frank');
Query OK, 2 rows affected (0,04 sec)
SELECT * FROM empleados;
+----+--------------------------------------+---------+
| id | nombre                               | salario |
+----+--------------------------------------+---------+
|  1 | Juan                                 | 3000.00 |
|  2 | María                                | 3500.00 |
|  3 | Pedro                                | 3200.00 |
|  4 | Pedro0.3416846770250096              | 9617.00 |
|  5 | Pedro0.7350332110515173              | 8553.00 |
|  6 | Pedro0.8904691933565486              | 9961.00 |
|  7 | Pedro0.30361605091357236             | 6265.00 |
|  8 | Pedro0.7544825037517422              | 3385.00 |
|  9 | 4502b9ab-1201-11ef-8a1d-080027b67a95 | 6821.00 |
| 10 | 4502b9ab-1201-11ef-8a1d-080027b67a95 | 5948.00 |
| 11 | 4502b9ab-1201-11ef-8a1d-080027b67a95 | 7276.00 |
| 12 | 4505c77b-1201-11ef-8a1d-080027b67a95 | 8537.00 |
| 13 | 4505c77b-1201-11ef-8a1d-080027b67a95 | 2855.00 |
| 14 | 4505c77b-1201-11ef-8a1d-080027b67a95 | 2667.00 |
| 15 | 45086918-1201-11ef-8a1d-080027b67a95 | 2769.00 |
| 16 | 45086918-1201-11ef-8a1d-080027b67a95 | 3845.00 |
| 17 | 45086918-1201-11ef-8a1d-080027b67a95 | 8918.00 |
| 18 | Frank0.5637113093991869              | 9391.00 |
| 19 | Frank0.8697496660703324              | 6511.00 |
| 21 | Frank0.3597695299980878              | 3343.00 |
| 22 | Frank0.2983230140975891              | 3682.00 |
+----+--------------------------------------+---------+
21 rows in set (0,00 sec)

```

### Inserta cuatro filas en la tabla empleados con nombres aleatorios generados usando la función SUBSTRING_INDEX(UUID(), '-', -1).

```sql
DELIMITER //
DROP procedure if exists aleatorio_sub;
CREATE PROCEDURE aleatorio_sub(IN iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE emp_salario INT;
    SET emp_salario = 2000;
    WHILE counter < iterations DO
        -- Coloca aquí el código que deseas ejecutar en cada iteración del bucle
        -- Por ejemplo, puedes imprimir el valor del contador
        INSERT INTO empleados (nombre, salario)
        VALUES (SUBSTRING_INDEX(UUID(), '-', -1), FLOOR(RAND() * (10000 - emp_salario + 1)) + emp_salario);
        SET counter = counter + 1;
    END WHILE;
END//
DELIMITER ;

-- Resultado:
 CALL aleatorio_sub(4);
Query OK, 1 row affected (0,06 sec)

mysql> sELECT * FROM empleados;
+----+--------------+---------+
| id | nombre       | salario |
+----+--------------+---------+
|  1 | Juan         | 3000.00 |
|  2 | María        | 3505.25 |
|  3 | Pedro        | 3365.04 |
|  4 | Juan         | 3000.00 |
|  5 | María        | 3500.00 |
|  6 | Pedro        | 3200.00 |
|  7 | Juan         | 3000.00 |
|  8 | María        | 3500.00 |
|  9 | Pedro        | 3200.00 |
| 10 | 080027b67a95 | 6391.00 |
| 11 | 080027b67a95 | 3786.00 |
| 12 | 080027b67a95 | 5757.00 |
| 13 | 080027b67a95 | 7428.00 |
+----+--------------+---------+
13 rows in set (0,00 se


```


### Inserta seis filas en la tabla empleados con nombres aleatorios generados usando la función RAND() y una semilla diferente.
```sql
DELIMITER //
DROP procedure if exists semilla_diferente;
CREATE PROCEDURE semilla_diferente(IN iterations INT, base VARCHAR(10))
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE num INT DEFAULT 1;
    DECLARE emp_salario INT;
    SET emp_salario = 2000;
    WHILE counter < iterations DO
        -- Coloca aquí el código que deseas ejecutar en cada iteración del bucle
        -- Por ejemplo, puedes imprimir el valor del contador
        INSERT INTO empleados (nombre, salario)
        VALUES (CONCAT(base, RAND(num)), FLOOR(RAND() * (10000 - emp_salario + 1)) + emp_salario);
        SET counter = counter + 1;
        SET num = num + 1;
    END WHILE;
END//
DELIMITER ;

--Resultado:
 CALL semilla_diferente(6, 'Semilla');
Query OK, 1 row affected (0,10 sec)

mysql> SELECT * FROM empleados;
+----+----------------------------+---------+
| id | nombre                     | salario |
+----+----------------------------+---------+
|  1 | Juan                       | 3000.00 |
|  2 | María                      | 3505.25 |
|  3 | Pedro                      | 3365.04 |
|  4 | Juan                       | 3000.00 |
|  5 | María                      | 3500.00 |
|  6 | Pedro                      | 3200.00 |
|  7 | Juan                       | 3000.00 |
|  8 | María                      | 3500.00 |
|  9 | Pedro                      | 3200.00 |
| 10 | 080087a87a93               | 6391.00 |
| 11 | 090017c53b95               | 3786.00 |
| 12 | 050025b67c85               | 5757.00 |
| 13 | 030037b67a15               | 7428.00 |
| 14 | Semilla0.43240353712197789 | 5243.00 |
| 15 | Semilla0.45540353712197732 | 5289.00 |
| 16 | Semilla0.47540353712197765 | 3243.00 |
| 17 | Semilla0.49540353712197775 | 6256.00 |
| 18 | Semilla0.71540353892197780 | 3208.00 |
| 19 | Semilla0.40540353712197724 | 5000.00 |
+----+----------------------------+---------+
19 rows in set (0,00 sec)
```


### sCrea cada uno de los procedimientos, maximixando el número de parámetros de entrada necesarios, por ejemplo: _nombre, salario, e id.

```sql
DELIMITER //

CREATE PROCEDURE max_parametro_optimizado(IN iterations INT, base VARCHAR(10), base_salario INT)
BEGIN
    DECLARE counter INT DEFAULT 0;
    WHILE counter < iterations DO
        -- Coloca aquí el código que deseas ejecutar en cada iteración del bucle
        -- Por ejemplo, puedes imprimir el valor del contador
        INSERT INTO empleados (nombre, salario)
        SELECT CONCAT(base, RAND()), FLOOR(RAND() * (10000 - base_salario + 1)) + base_salario
        FROM (SELECT 1 UNION SELECT 2) AS sub
        ORDER BY RAND()
        LIMIT 1;
        SET counter = counter + 1;
    END WHILE;
END//
DELIMITER ;

-- Resultado:
 CALL max_parametro_optimizado(3, 'Prueba', '100');
Query OK, 1 row affected (0,05 sec)

mysql> SELECT * FROM empleados;
+----+----------------------------+---------+
| id | nombre                     | salario |
+----+----------------------------+---------+
|  1 | Juan                       | 3000.00 |
|  2 | María                      | 3505.25 |
|  3 | Pedro                      | 3365.04 |
|  4 | Juan                       | 3000.00 |
|  5 | María                      | 3500.00 |
|  6 | Pedro                      | 3200.00 |
|  7 | Juan                       | 3000.00 |
|  8 | María                      | 3500.00 |
|  9 | Pedro                      | 3200.00 |
| 10 | 080087a87a93               | 6391.00 |
| 11 | 090017c53b95               | 3786.00 |
| 12 | 050025b67c85               | 5757.00 |
| 13 | 030037b67a15               | 7428.00 |
| 14 | Semilla0.43240353712197789 | 5243.00 |
| 15 | Semilla0.45540353712197732 | 5289.00 |
| 16 | Semilla0.47540353712197765 | 3243.00 |
| 17 | Semilla0.49540353712197775 | 6256.00 |
| 18 | Semilla0.71540353892197780 | 3208.00 |
| 19 | Semilla0.40540353712197724 | 5000.00 |
| 20 | Prueba0.7791275445177477   |  206.00 |
| 21 | Prueba0.980426409263561    | 8328.00 |
| 22 | Prueba0.5784212160654564   | 2565.00 |
+----+----------------------------+---------+
22 rows in set (0,00 sec)

```

