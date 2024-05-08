

## Escribe un procedimiento almacenado que aumente los salarios de todos los empleados en un 5%, pero excluya a aquellos cuyo salario sea superior a 3200. El procedimiento debe tener parámetros de entrada.

```sql
DROP PROCEDURE IF EXISTS aumentar_salarios;

  DELIMITER //
  CREATE PROCEDURE aumentar_salarios(IN porcentaje DECIMAL(5,2), limite DECIMAL(10,2))
  BEGIN
      DECLARE done INT DEFAULT FALSE;
      DECLARE emp_id INT;
      DECLARE emp_nombre VARCHAR(100);
      DECLARE emp_salario DECIMAL(10, 2);
      DECLARE cur CURSOR FOR SELECT id, nombre, salario FROM empleados;
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

      OPEN cur;
      read_loop: LOOP
          FETCH cur INTO emp_id, emp_nombre, emp_salario;
          IF done THEN
              LEAVE read_loop;
          END IF;
          UPDATE empleados SET salario = salario * (1 + porcentaje / 100) WHERE salario > limite;
      END LOOP;
      CLOSE cur;
  END //
  DELIMITER ;

CALL aumentar_salarios(0.05, 3200);
Query OK, 0 rows affected (0,04 sec)
--Resultado:
mysql> SELECT * FROM empleados;
+----+--------+---------+
| id | nombre | salario |
+----+--------+---------+
|  1 | Juan   | 3000.00 |
|  2 | María  | 3505.25 |
|  3 | Pedro  | 3365.04 |
+----+--------+---------+
3 rows in set (0,00 sec)

```

## Escribe un procedimiento almacenado que calcule el salario anual de cada empleado (asumiendo que trabajan todo el año) y lo imprima.
```sql
DROP PROCEDURE IF EXISTS salario_anual;

  DELIMITER //
  CREATE PROCEDURE salario_anual(IN id_empleado INT)
  BEGIN
      DECLARE done INT DEFAULT FALSE;
      DECLARE emp_id INT;
      DECLARE emp_nombre VARCHAR(100);
      DECLARE emp_salario DECIMAL(10, 2);
      DECLARE cur CURSOR FOR SELECT id, nombre, salario FROM empleados;
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

      OPEN cur;
      read_loop: LOOP
          FETCH cur INTO emp_id, emp_nombre, emp_salario;
          IF done THEN
              LEAVE read_loop;
          END IF;
          SELECT id, nombre, salario * 12 as salario_anual from empleados WHERE id = id_empleado;
      END LOOP;
      CLOSE cur;
  END //
  DELIMITER ;

call salario_anual(2);

--Resultad:
+----+--------+---------------+
| id | nombre | salario_anual |
+----+--------+---------------+
|  2 | María  |      42063.00 |
+----+--------+---------------+
1 row in set (0,00 sec)

```


## Escribe un procedimiento almacenado que cuente y muestre el número de empleados en cada rango de salario (por ejemplo, menos de 3000, entre 3000 y 5000, más de 5000). El procedimiento debe tener parámetros de entrada.
```sql
DROP PROCEDURE IF EXISTS rango_salario;

  DELIMITER //
  CREATE PROCEDURE rango_salario(IN min_limit INT, max_limit INT)
  BEGIN
      DECLARE done INT DEFAULT FALSE;
      DECLARE emp_id INT;
      DECLARE emp_nombre VARCHAR(100);
      DECLARE emp_salario DECIMAL(10, 2);
      DECLARE cur CURSOR FOR SELECT id, nombre, salario FROM empleados;
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

      OPEN cur;
      read_loop: LOOP
          FETCH cur INTO emp_id, emp_nombre, emp_salario;
          IF done THEN
              LEAVE read_loop;
          END IF;
          SELECT id, nombre, salario from empleados WHERE salario BETWEEN min_limit AND max_limit;
      END LOOP;
      CLOSE cur;
  END //
  DELIMITER ;

call rango_salario(3200, 3600);

--Resultado:
+----+--------+---------+
| id | nombre | salario |
+----+--------+---------+
|  2 | María  | 3505.25 |
|  3 | Pedro  | 3365.04 |
+----+--------+---------+
2 rows in set (0,00 sec)

```