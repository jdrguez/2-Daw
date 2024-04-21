
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
    codigo_pedido VARCHAR(30)
)
RETURNS FLOAT
DETERMINISTIC
BEGIN
    DECLARE total_price FLOAT;
    SELECT SUM(d.cantidad * d.precio_unidad) INTO total_price FROM
    detalle_pedido as d WHERE d.codigo_producto = codigo_pedido;
    RETURN total_price;
END$$
DELIMITER ;

--Resultado:

4 | FR-31           |       12 |          8.00 |            7 |


SELECT calcular_precio_total_pedidos('FR-31');
+----------------------------------------+
| calcular_precio_total_pedidos('FR-31') |
+----------------------------------------+
|                                     96 |
+----------------------------------------+
1 row in set (0.01 sec)

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
    
    SELECT SUM(calcular_precio_total_pedidos(p.codigo_pedido))
    INTO total_pagos_cliente
    FROM pedido p
    JOIN cliente c ON p.codigo_cliente = c.codigo_cliente
    WHERE c.codigo_cliente = codigo_cliente;
    
    RETURN total_pagos_cliente;
END$$
DELIMITER ;



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

```







SELECT p.codigo_pedido
    FROM pedido p
    JOIN cliente c ON p.codigo_cliente = c.codigo_cliente
    WHERE c.codigo_cliente = p.codigo_cliente
    AND c.codigo_cliente = 16;




Nota:Dado un código de cliente la función debe calcular la suma total de los pagos realizados por ese cliente.
Parámetros de entrada: codigo_cliente (INT)
Parámetros de salida: La suma total de todos los pagos del cliente (FLOAT)
Procedimiento calcular_pagos_pendientes

Nota:Deberá calcular los pagos pendientes de todos los clientes. Para saber si un cliente tiene algún pago pendiente deberemos calcular cuál es la cantidad de todos los pedidos y los pagos que ha realizado. Si la cantidad de los pedidos es mayor que la de los pagos entonces ese cliente tiene pagos pendientes.




















´´´sql

-- Función para calcular la suma total de todos los pedidos realizados por un cliente
CREATE FUNCTION calcular_suma_pedidos_cliente(codigo_cliente INT) RETURNS FLOAT
BEGIN
    DECLARE total_pedidos_cliente FLOAT;
    
    SELECT SUM(calcular_precio_total_pedido(p.codigo_pedido))
    INTO total_pedidos_cliente
    FROM Pedidos p
    WHERE p.codigo_cliente = codigo_cliente;
    
    RETURN total_pedidos_cliente;
END;

-- Función para calcular la suma total de los pagos realizados por un cliente
CREATE FUNCTION calcular_suma_pagos_cliente(codigo_cliente INT) RETURNS FLOAT
BEGIN
    DECLARE total_pagos_cliente FLOAT;
    
    SELECT SUM(monto_pago)
    INTO total_pagos_cliente
    FROM Pagos
    WHERE codigo_cliente = codigo_cliente;
    
    RETURN total_pagos_cliente;
END;

´´´