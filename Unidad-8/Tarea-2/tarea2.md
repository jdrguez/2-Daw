
´´´sql
CREATE FUNCTION calcular_precio_total_pedido(codigo_pedido INT) RETURNS FLOAT
BEGIN
    DECLARE total_pedido FLOAT;

    SELECT SUM(d.cantidad * d.precio_unitario)
    INTO total_pedido
    FROM Detalles_Pedido d
    WHERE d.codigo_pedido = codigo_pedido;
    
    RETURN total_pedido;
END;

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