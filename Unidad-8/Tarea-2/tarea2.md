
# Tarea 2, sobre procedimientos y funciones

## Se pide realizar los procedimientos y funciones:

### Función calcular_precio_total_pedidos

>Nota:Dado un código de pedido la función debe calcular la suma total del pedido. Tenga en cuenta que un pedido puede contener varios productos diferentes y varias cantidades de cada producto.
Parámetros de entrada: codigo_pedido (INT)
Parámetros de salida: El precio total del pedido (FLOAT)
Función calcular_suma_pedidos_cliente

```sql

DROP FUNCTION IF EXISTS calcular_precio_total_pedidos;

DELIMITER $$
CREATE FUNCTION calcular_precio_total_pedidos(
    codigo_pedido INT
)
RETURNS FLOAT
DETERMINISTIC
BEGIN
    DECLARE total_price FLOAT;
    SELECT SUM(d.cantidad * d.precio_unidad) INTO total_price FROM
    detalle_pedido as d WHERE d.codigo_pedido = codigo_pedido;
    RETURN total_price;
END$$
DELIMITER ;

--Resultado:

SELECT calcular_precio_total_pedidos(4);
+----------------------------------+
| calcular_precio_total_pedidos(4) |
+----------------------------------+
|                             2624 |
+----------------------------------+
1 row in set (0.01 sec)

mysql> SELECT * from detalle_pedido where codigo_pedido = 4;
+---------------+-----------------+----------+---------------+--------------+
| codigo_pedido | codigo_producto | cantidad | precio_unidad | numero_linea |
+---------------+-----------------+----------+---------------+--------------+
|             4 | FR-31           |       12 |          8.00 |            7 |
|             4 | FR-34           |       42 |          8.00 |            6 |
|             4 | FR-40           |       42 |          9.00 |            8 |
|             4 | OR-152          |        3 |          6.00 |            5 |
|             4 | OR-155          |        4 |          6.00 |            3 |
|             4 | OR-156          |       17 |          9.00 |            4 |
|             4 | OR-157          |       38 |         10.00 |            2 |
|             4 | OR-222          |       21 |         59.00 |            1 |
+---------------+-----------------+----------+---------------+--------------+

```




### Función calcular_suma_pagos_cliente

>Nota:Dado un código de cliente la función debe calcular la suma total de todos los pedidos realizados por el cliente. Deberá hacer uso de la función calcular_precio_total_pedido que ha desarrollado en el apartado anterior.
Parámetros de entrada: codigo_cliente (INT)
Parámetros de salida: La suma total de todos los pedidos del cliente (FLOAT)

```sql

DROP FUNCTION IF EXISTS calcular_suma_pagos_cliente;
DELIMITER $$
CREATE FUNCTION calcular_suma_pagos_cliente(codigo_cliente INT) 
RETURNS FLOAT
DETERMINISTIC
BEGIN
    DECLARE total_pagos_cliente FLOAT;
    DECLARE precio_total_pedido FLOAT;
    DECLARE codigo_pedido_actual INT;
    
    DECLARE cur CURSOR FOR 
        SELECT p.codigo_pedido
        FROM pedido p
        JOIN cliente c ON p.codigo_cliente = c.codigo_cliente
        WHERE c.codigo_cliente = codigo_cliente;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET total_pagos_cliente = 0;

    SET total_pagos_cliente = 0;
    OPEN cur;
    
    read_loop: LOOP
        FETCH cur INTO codigo_pedido_actual;
        IF total_pagos_cliente = 0 THEN
            LEAVE read_loop;
        END IF;

        SET precio_total_pedido = calcular_precio_total_pedidos(codigo_pedido_actual);
        SET total_pagos_cliente = total_pagos_cliente + precio_total_pedido;
    END LOOP;
    
    CLOSE cur;
    
    RETURN total_pagos_cliente;
END$$
DELIMITER ;


--Resultado

SELECT calcular_suma_pagos_cliente(16);
+---------------------------------+
| calcular_suma_pagos_cliente(16) |
+---------------------------------+
|                            4399 |
+---------------------------------+
1 row in set (0.00 sec)

```
 


### Función calcular_suma_pagos_cliente

>Nota:Dado un código de cliente la función debe calcular la suma total de los pagos realizados por ese cliente.
Parámetros de entrada: codigo_cliente (INT)
Parámetros de salida: La suma total de todos los pagos del cliente (FLOAT)


```sql
DROP FUNCTION IF EXISTS calcular_suma_pagos_cliente;
DELIMITER $$
CREATE FUNCTION calcular_suma_pagos_cliente(codigo_cliente INT) 
RETURNS FLOAT
DETERMINISTIC
BEGIN
    DECLARE total_pagos_cliente FLOAT;
    
    SELECT SUM(total)
    INTO total_pagos_cliente
    FROM pago as p
    WHERE p.codigo_cliente = codigo_cliente
    GROUP BY codigo_cliente;
    
    RETURN total_pagos_cliente;
END$$
DELIMITER ;


-- Resultado:
+----------------+---------------+----------------+------------+----------+
| codigo_cliente | forma_pago    | id_transaccion | fecha_pago | total    |
+----------------+---------------+----------------+------------+----------+
|              1 | PayPal        | ak-std-000001  | 2008-11-10 |  2000.00 |
|              1 | PayPal        | ak-std-000002  | 2008-12-10 |  2000.00 |

SELECT calcular_suma_pagos_cliente(1);
+--------------------------------+
| calcular_suma_pagos_cliente(1) |
+--------------------------------+
|                           4000 |
+--------------------------------+
1 row in set (0.02 sec)


```



### Procedimiento calcular_pagos_pendientes

>Nota:Deberá calcular los pagos pendientes de todos los clientes. Para saber si un cliente tiene algún pago pendiente deberemos calcular cuál es la cantidad de todos los pedidos y los pagos que ha realizado. Si la cantidad de los pedidos es mayor que la de los pagos entonces ese cliente tiene pagos pendientes.





