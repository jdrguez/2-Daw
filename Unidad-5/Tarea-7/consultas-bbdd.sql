-- Obtener todos los clientes.

 SELECT * from Clientes;
 /**
┌────┬─────────────────┬───────────────────────────┐
│ id │     nombre      │           email           │
├────┼─────────────────┼───────────────────────────┤
│ 1  │ Juan Pérez      │ juan@example.com          │
│ 2  │ María Gómez     │ maria@example.com         │
│ 3  │ Carlos López    │ carlos@example.com        │
│ 4  │ Ana Rodríguez   │ ana@example.com           │
│ 5  │ Luisa Martínez  │ luisa@example.com         │
│ 6  │ Pedro Sánchez   │ pedro@example.com         │
│ 7  │ Laura García    │ laura@example.com         │
│ 8  │ Miguel Martín   │ miguel@example.com        │
│ 9  │ Elena González  │ elena@example.com         │
│ 10 │ David Torres    │ david@example.com         │
│ 11 │ Sofía Ruiz      │ sofia@example.com         │
│ 12 │ Javier López    │ javier@example.com        │
│ 13 │ Carmen Vargas   │ carmen@example.com        │
│ 14 │ Daniel Muñoz    │ daniel@example.com        │
│ 15 │ Isabel Serrano  │ isabel@example.com        │
│ 16 │ Alejandro Muñoz │ alejandro@example.com     │
│ 17 │ Raquel Herrera  │ raquel@example.com        │
│ 18 │ Francisco Mora  │ francisco@example.com     │
│ 19 │ Marina Díaz     │ marina@example.com        │
│ 20 │ Antonio Jiménez │ antonio@example.com       │
│ 21 │ Beatriz Romero  │ beatriz@example.com       │
│ 22 │ Carlos Gómez    │ carlos.gomez@example.com  │
│ 23 │ Clara Sánchez   │ clara.sanchez@example.com │
│ 24 │ Andrés Martínez │ andres@example.com        │
│ 25 │ Lucía Díaz      │ lucia@example.com         │
│ 26 │ Mario Serrano   │ mario@example.com         │
│ 27 │ Eva Torres      │ eva.torres@example.com    │
│ 28 │ Roberto Ruiz    │ roberto@example.com       │
│ 29 │ Celia García    │ celia@example.com         │
└────┴─────────────────┴───────────────────────────┘
**/
-- Obtener la cantidad total de productos en todos los pedidos

SELECT proc.nombre, proc.precio, ped.cantidad FROM pedidos as ped, productos as proc WHERE proc.id=ped.id_producto;
/**
┌───────────────────────────────────┬────────┬──────────┐
│              nombre               │ precio │ cantidad │
├───────────────────────────────────┼────────┼──────────┤
│ Laptop                            │ 1200.0 │ 2        │
│ Smartphone                        │ 699.99 │ 1        │
│ TV LED                            │ 799.5  │ 3        │
│ Tablet                            │ 299.99 │ 1        │
│ Auriculares Bluetooth             │ 79.99  │ 2        │
│ Impresora                         │ 199.99 │ 1        │
│ Cámara Digital                    │ 499.99 │ 3        │
│ Reproductor de Audio              │ 149.99 │ 2        │
│ Altavoces Inalámbricos            │ 129.99 │ 1        │
│ Reloj Inteligente                 │ 249.99 │ 2        │
│ Teclado Inalámbrico               │ 59.99  │ 1        │
│ Ratón Óptico                      │ 29.99  │ 3        │
│ Monitor LED                       │ 349.99 │ 1        │
│ Mochila para Portátil             │ 49.99  │ 2        │
│ Disco Duro Externo                │ 89.99  │ 1        │
│ Router Wi-Fi                      │ 69.99  │ 3        │
│ Lámpara LED                       │ 39.99  │ 2        │
│ Batería Externa                   │ 19.99  │ 1        │
│ Estuche para Auriculares          │ 14.99  │ 2        │
│ Tarjeta de Memoria                │ 24.99  │ 1        │
│ Cargador Inalámbrico              │ 34.99  │ 3        │
│ Kit de Limpieza para Computadoras │ 9.99   │ 1        │
│ Funda para Tablet                 │ 19.99  │ 2        │
│ Soporte para Teléfono             │ 14.99  │ 1        │
│ Hub USB                           │ 29.99  │ 3        │
│ Webcam HD                         │ 59.99  │ 2        │
│ Funda para Laptop                 │ 29.99  │ 1        │
│ Adaptador HDMI                    │ 12.99  │ 2        │
└───────────────────────────────────┴────────┴──────────┘
**/

-- Obtener el precio promedio de los productos:

SELECT AVG(precio) as precio_medio from productos;
/**
┌──────────────────┐
│   precio_medio   │
├──────────────────┤
│ 188.294285714286 │
└──────────────────┘
**/

-- Obtener los clientes que tienen un email válido (contiene '@'):

SELECT email from clientes WHERE email regexp '[a-zA-Z]@';
/**
┌───────────────────────────┐
│           email           │
├───────────────────────────┤
│ alejandro@example.com     │
│ ana@example.com           │
│ andres@example.com        │
│ antonio@example.com       │
│ beatriz@example.com       │
│ carlos.gomez@example.com  │
│ carlos@example.com        │
│ carmen@example.com        │
│ celia@example.com         │
│ clara.sanchez@example.com │
│ daniel@example.com        │
│ david@example.com         │
│ elena@example.com         │
│ eva.torres@example.com    │
│ francisco@example.com     │
│ isabel@example.com        │
│ javier@example.com        │
│ juan@example.com          │
│ laura@example.com         │
│ lucia@example.com         │
│ luisa@example.com         │
│ maria@example.com         │
│ marina@example.com        │
│ mario@example.com         │
│ miguel@example.com        │
│ pedro@example.com         │
│ raquel@example.com        │
│ roberto@example.com       │
│ sofia@example.com         │
└───────────────────────────┘
**/
-- Obtener el producto más caro.
SELECT nombre, MAX(precio) as producto_mas_caro FROM productos;
/**
┌────────┬───────────────────┐
│ nombre │ producto_mas_caro │
├────────┼───────────────────┤
│ Laptop │ 1200.0            │
└────────┴───────────────────┘
**/
-- Obtener los pedidos realizados en febrero de 2024.

SELECT ped.fecha_pedido, prod.nombre, prod.precio, ped.cantidad from pedidos as ped, productos as prod WHERE ped.fecha_pedido regexp '2024-02' AND prod.id=ped.id_producto;
/**
┌──────────────┬───────────────────────────────────┬────────┬──────────┐
│ fecha_pedido │              nombre               │ precio │ cantidad │
├──────────────┼───────────────────────────────────┼────────┼──────────┤
│ 2024-02-01   │ Laptop                            │ 1200.0 │ 2        │
│ 2024-02-02   │ Smartphone                        │ 699.99 │ 1        │
│ 2024-02-03   │ TV LED                            │ 799.5  │ 3        │
│ 2024-02-04   │ Tablet                            │ 299.99 │ 1        │
│ 2024-02-05   │ Auriculares Bluetooth             │ 79.99  │ 2        │
│ 2024-02-06   │ Impresora                         │ 199.99 │ 1        │
│ 2024-02-07   │ Cámara Digital                    │ 499.99 │ 3        │
│ 2024-02-08   │ Reproductor de Audio              │ 149.99 │ 2        │
│ 2024-02-09   │ Altavoces Inalámbricos            │ 129.99 │ 1        │
│ 2024-02-10   │ Reloj Inteligente                 │ 249.99 │ 2        │
│ 2024-02-11   │ Teclado Inalámbrico               │ 59.99  │ 1        │
│ 2024-02-12   │ Ratón Óptico                      │ 29.99  │ 3        │
│ 2024-02-13   │ Monitor LED                       │ 349.99 │ 1        │
│ 2024-02-14   │ Mochila para Portátil             │ 49.99  │ 2        │
│ 2024-02-15   │ Disco Duro Externo                │ 89.99  │ 1        │
│ 2024-02-16   │ Router Wi-Fi                      │ 69.99  │ 3        │
│ 2024-02-17   │ Lámpara LED                       │ 39.99  │ 2        │
│ 2024-02-18   │ Batería Externa                   │ 19.99  │ 1        │
│ 2024-02-19   │ Estuche para Auriculares          │ 14.99  │ 2        │
│ 2024-02-20   │ Tarjeta de Memoria                │ 24.99  │ 1        │
│ 2024-02-21   │ Cargador Inalámbrico              │ 34.99  │ 3        │
│ 2024-02-22   │ Kit de Limpieza para Computadoras │ 9.99   │ 1        │
│ 2024-02-23   │ Funda para Tablet                 │ 19.99  │ 2        │
│ 2024-02-24   │ Soporte para Teléfono             │ 14.99  │ 1        │
│ 2024-02-25   │ Hub USB                           │ 29.99  │ 3        │
│ 2024-02-26   │ Webcam HD                         │ 59.99  │ 2        │
│ 2024-02-27   │ Funda para Laptop                 │ 29.99  │ 1        │
│ 2024-02-28   │ Adaptador HDMI                    │ 12.99  │ 2        │
└──────────────┴───────────────────────────────────┴────────┴──────────┘
**/

-- Obtener la cantidad total de productos en todos los pedidos por producto.

SELECT COUNT(cantidad) as cantidad_total from pedidos as ped, productos as prod WHERE prod.id=ped.id_producto;
/**
┌────────────────┐
│ cantidad_total │
├────────────────┤
│ 28             │
└────────────────┘
**/

-- Obtener los clientes que han realizado más de un pedido.

SELECT c.*  from pedidos as ped, clientes as c  WHERE c.id=ped.id_cliente AND ped.cantidad > 1;
/**
┌────┬─────────────────┬───────────────────────────┐
│ id │     nombre      │           email           │
├────┼─────────────────┼───────────────────────────┤
│ 1  │ Juan Pérez      │ juan@example.com          │
│ 3  │ Carlos López    │ carlos@example.com        │
│ 5  │ Luisa Martínez  │ luisa@example.com         │
│ 7  │ Laura García    │ laura@example.com         │
│ 8  │ Miguel Martín   │ miguel@example.com        │
│ 10 │ David Torres    │ david@example.com         │
│ 12 │ Javier López    │ javier@example.com        │
│ 14 │ Daniel Muñoz    │ daniel@example.com        │
│ 16 │ Alejandro Muñoz │ alejandro@example.com     │
│ 17 │ Raquel Herrera  │ raquel@example.com        │
│ 19 │ Marina Díaz     │ marina@example.com        │
│ 21 │ Beatriz Romero  │ beatriz@example.com       │
│ 23 │ Clara Sánchez   │ clara.sanchez@example.com │
│ 25 │ Lucía Díaz      │ lucia@example.com         │
│ 26 │ Mario Serrano   │ mario@example.com         │
│ 28 │ Roberto Ruiz    │ roberto@example.com       │
└────┴─────────────────┴───────────────────────────┘
**/

-- Obtener los productos que tienen un precio registrado.

SELECT * from productos WHERE precio regexp '\d';
/**
┌────┬───────────────────────────────────┬────────┐
│ id │              nombre               │ precio │
├────┼───────────────────────────────────┼────────┤
│ 1  │ Laptop                            │ 1200.0 │
│ 2  │ Smartphone                        │ 699.99 │
│ 3  │ TV LED                            │ 799.5  │
│ 4  │ Tablet                            │ 299.99 │
│ 5  │ Auriculares Bluetooth             │ 79.99  │
│ 6  │ Impresora                         │ 199.99 │
│ 7  │ Cámara Digital                    │ 499.99 │
│ 8  │ Reproductor de Audio              │ 149.99 │
│ 9  │ Altavoces Inalámbricos            │ 129.99 │
│ 10 │ Reloj Inteligente                 │ 249.99 │
│ 11 │ Teclado Inalámbrico               │ 59.99  │
│ 12 │ Ratón Óptico                      │ 29.99  │
│ 13 │ Monitor LED                       │ 349.99 │
│ 14 │ Mochila para Portátil             │ 49.99  │
│ 15 │ Disco Duro Externo                │ 89.99  │
│ 16 │ Router Wi-Fi                      │ 69.99  │
│ 17 │ Lámpara LED                       │ 39.99  │
│ 18 │ Batería Externa                   │ 19.99  │
│ 19 │ Estuche para Auriculares          │ 14.99  │
│ 20 │ Tarjeta de Memoria                │ 24.99  │
│ 21 │ Cargador Inalámbrico              │ 34.99  │
│ 22 │ Kit de Limpieza para Computadoras │ 9.99   │
│ 23 │ Funda para Tablet                 │ 19.99  │
│ 24 │ Soporte para Teléfono             │ 14.99  │
│ 25 │ Hub USB                           │ 29.99  │
│ 26 │ Webcam HD                         │ 59.99  │
│ 27 │ Funda para Laptop                 │ 29.99  │
│ 28 │ Adaptador HDMI                    │ 12.99  │
└────┴───────────────────────────────────┴────────┘
**/

-- Obtener la fecha del primer pedido realizado:
SELECT MIN(fecha_pedido) as primer_pedido from pedidos;
/**
┌───────────────┐
│ primer_pedido │
├───────────────┤
│ 2024-02-01    │
└─────────────
**/

-- Obtener los productos cuyos nombres comienzan con 'A' o 'B':

SELECT * FROM productos WHERE nombre regexp '^[A|B]';
/**
┌────┬────────────────────────┬────────┐
│ id │         nombre         │ precio │
├────┼────────────────────────┼────────┤
│ 5  │ Auriculares Bluetooth  │ 79.99  │
│ 9  │ Altavoces Inalámbricos │ 129.99 │
│ 18 │ Batería Externa        │ 19.99  │
│ 28 │ Adaptador HDMI         │ 12.99  │
└────┴────────────────────────┴────────┘
**/
-- Obtener la cantidad total de productos en todos los pedidos por cliente ordenado por cliente.



-- Obtener los clientes que han realizado más de un pedido en febrero de 2024.

SELECT c.*  from pedidos as ped, clientes as c  WHERE c.id=ped.id_cliente AND ped.cantidad > 1 AND ped.fecha_pedido regexp '2024-02';
/**
┌────┬─────────────────┬───────────────────────────┐
│ id │     nombre      │           email           │
├────┼─────────────────┼───────────────────────────┤
│ 1  │ Juan Pérez      │ juan@example.com          │
│ 3  │ Carlos López    │ carlos@example.com        │
│ 5  │ Luisa Martínez  │ luisa@example.com         │
│ 7  │ Laura García    │ laura@example.com         │
│ 8  │ Miguel Martín   │ miguel@example.com        │
│ 10 │ David Torres    │ david@example.com         │
│ 12 │ Javier López    │ javier@example.com        │
│ 14 │ Daniel Muñoz    │ daniel@example.com        │
│ 16 │ Alejandro Muñoz │ alejandro@example.com     │
│ 17 │ Raquel Herrera  │ raquel@example.com        │
│ 19 │ Marina Díaz     │ marina@example.com        │
│ 21 │ Beatriz Romero  │ beatriz@example.com       │
│ 23 │ Clara Sánchez   │ clara.sanchez@example.com │
│ 25 │ Lucía Díaz      │ lucia@example.com         │
│ 26 │ Mario Serrano   │ mario@example.com         │
│ 28 │ Roberto Ruiz    │ roberto@example.com       │
└────┴─────────────────┴───────────────────────────┘
**/

-- Obtener los productos con precio entre 100 y 500.

SELECT * from productos WHERE precio BETWEEN 100 and 500;
/**
┌────┬────────────────────────┬────────┐
│ id │         nombre         │ precio │
├────┼────────────────────────┼────────┤
│ 4  │ Tablet                 │ 299.99 │
│ 6  │ Impresora              │ 199.99 │
│ 7  │ Cámara Digital         │ 499.99 │
│ 8  │ Reproductor de Audio   │ 149.99 │
│ 9  │ Altavoces Inalámbricos │ 129.99 │
│ 10 │ Reloj Inteligente      │ 249.99 │
│ 13 │ Monitor LED            │ 349.99 │
└────┴────────────────────────┴────────┘
**/
-- Obtener la cantidad total de productos en todos los pedidos por cliente ordenado por cantidad descendente.



-- Obtener los clientes que tienen una 'a' en cualquier posición de su nombre.

SELECT * from Clientes WHERE nombre regexp 'a';
/**
┌────┬─────────────────┬───────────────────────────┐
│ id │     nombre      │           email           │
├────┼─────────────────┼───────────────────────────┤
│ 1  │ Juan Pérez      │ juan@example.com          │
│ 2  │ María Gómez     │ maria@example.com         │
│ 3  │ Carlos López    │ carlos@example.com        │
│ 4  │ Ana Rodríguez   │ ana@example.com           │
│ 5  │ Luisa Martínez  │ luisa@example.com         │
│ 7  │ Laura García    │ laura@example.com         │
│ 8  │ Miguel Martín   │ miguel@example.com        │
│ 9  │ Elena González  │ elena@example.com         │
│ 10 │ David Torres    │ david@example.com         │
│ 11 │ Sofía Ruiz      │ sofia@example.com         │
│ 12 │ Javier López    │ javier@example.com        │
│ 13 │ Carmen Vargas   │ carmen@example.com        │
│ 14 │ Daniel Muñoz    │ daniel@example.com        │
│ 15 │ Isabel Serrano  │ isabel@example.com        │
│ 16 │ Alejandro Muñoz │ alejandro@example.com     │
│ 17 │ Raquel Herrera  │ raquel@example.com        │
│ 18 │ Francisco Mora  │ francisco@example.com     │
│ 19 │ Marina Díaz     │ marina@example.com        │
│ 21 │ Beatriz Romero  │ beatriz@example.com       │
│ 22 │ Carlos Gómez    │ carlos.gomez@example.com  │
│ 23 │ Clara Sánchez   │ clara.sanchez@example.com │
│ 24 │ Andrés Martínez │ andres@example.com        │
│ 25 │ Lucía Díaz      │ lucia@example.com         │
│ 26 │ Mario Serrano   │ mario@example.com         │
│ 27 │ Eva Torres      │ eva.torres@example.com    │
│ 29 │ Celia García    │ celia@example.com         │
└────┴─────────────────┴───────────────────────────┘
**/

-- Obtener el precio máximo de los productos.

select nombre,max(precio) as precio_maximo from productos;
/**
┌────────┬───────────────┐
│ nombre │ precio_maximo │
├────────┼───────────────┤
│ Laptop │ 1200.0        │
└────────┴───────────────┘
**/
-- Obtener los pedidos realizados por el cliente con ID 1 en febrero de 2024.

 SELECT ped.cantidad, ped.fecha_pedido, c.nombre, produc.nombre, produc.precio from pedidos as ped, productos as produc, clientes as c WHERE ped.id_cliente=1 AND fecha_pedido regexp '2024-02
' AND ped.id_producto=produc.id AND ped.id_cliente=c.id;
/**
┌──────────┬──────────────┬────────────┬────────┬────────┐
│ cantidad │ fecha_pedido │   nombre   │ nombre │ precio │
├──────────┼──────────────┼────────────┼────────┼────────┤
│ 2        │ 2024-02-01   │ Juan Pérez │ Laptop │ 1200.0 │
└──────────┴──────────────┴────────────┴────────┴────────┘
**/

-- Obtener la cantidad total de productos en todos los pedidos por producto ordenado por total de productos descendente.



-- Obtener los productos que no tienen un precio registrado.

SELECT * from productos WHERE precio not regexp '\d';

-- Obtener la fecha del último pedido realizado.

SELECT MAX(fecha_pedido) as ultima_fecha FROM pedidos;
/**
┌──────────────┐
│ ultima_fecha │
├──────────────┤
│ 2024-03-01   │
└──────────────┘
**/

-- Obtener los clientes cuyo nombre tiene al menos 5 caracteres.

SELECT nombre from clientes WHERE nombre regexp '.{5}';
/**
┌─────────────────┐
│     nombre      │
├─────────────────┤
│ Juan Pérez      │
│ María Gómez     │
│ Carlos López    │
│ Ana Rodríguez   │
│ Luisa Martínez  │
│ Pedro Sánchez   │
│ Laura García    │
│ Miguel Martín   │
│ Elena González  │
│ David Torres    │
│ Sofía Ruiz      │
│ Javier López    │
│ Carmen Vargas   │
│ Daniel Muñoz    │
│ Isabel Serrano  │
│ Alejandro Muñoz │
│ Raquel Herrera  │
│ Francisco Mora  │
│ Marina Díaz     │
│ Antonio Jiménez │
│ Beatriz Romero  │
│ Carlos Gómez    │
│ Clara Sánchez   │
│ Andrés Martínez │
│ Lucía Díaz      │
│ Mario Serrano   │
│ Eva Torres      │
│ Roberto Ruiz    │
│ Celia García    │
└─────────────────┘
**/

-- Obtener los productos que tienen la letra 'o' en cualquier posición del nombre.

SELECT nombre from productos WHERE nombre regexp 'o';
/**
┌───────────────────────────────────┐
│              nombre               │
├───────────────────────────────────┤
│ Laptop                            │
│ Smartphone                        │
│ Auriculares Bluetooth             │
│ Impresora                         │
│ Reproductor de Audio              │
│ Altavoces Inalámbricos            │
│ Reloj Inteligente                 │
│ Teclado Inalámbrico               │
│ Ratón Óptico                      │
│ Monitor LED                       │
│ Mochila para Portátil             │
│ Disco Duro Externo                │
│ Router Wi-Fi                      │
│ Tarjeta de Memoria                │
│ Cargador Inalámbrico              │
│ Kit de Limpieza para Computadoras │
│ Soporte para Teléfono             │
│ Funda para Laptop                 │
│ Adaptador HDMI                    │
└───────────────────────────────────┘

**/

-- Obtener la cantidad total de productos en todos los pedidos por cliente ordenado por cliente.




-- Obtener los clientes cuyos nombres no contienen la letra 'i':

SELECT nombre from clientes WHERE nombre not regexp 'i';
/**
┌─────────────────┐
│     nombre      │
├─────────────────┤
│ Juan Pérez      │
│ María Gómez     │
│ Carlos López    │
│ Ana Rodríguez   │
│ Pedro Sánchez   │
│ Laura García    │
│ Elena González  │
│ Carmen Vargas   │
│ Isabel Serrano  │
│ Alejandro Muñoz │
│ Raquel Herrera  │
│ Carlos Gómez    │
│ Clara Sánchez   │
│ Andrés Martínez │
│ Lucía Díaz      │
│ Eva Torres      │
└─────────────────┘
**/

-- Obtener los pedidos realizados por el cliente con ID 2 en febrero de 2024.


SELECT ped.cantidad, ped.fecha_pedido, c.nombre, produc.nombre, produc.precio from pedidos as ped, productos as produc, clientes as c WHERE ped.id_cliente=2 AND fecha_pedido regexp '2024-02 
' AND ped.id_producto=produc.id AND ped.id_cliente=c.id;
/**

**/

-- Obtener el precio mínimo de los productos.

SELECT nombre, min(precio) as precio_minimo FROM productos;
/**
┌───────────────────────────────────┬───────────────┐
│              nombre               │ precio_minimo │
├───────────────────────────────────┼───────────────┤
│ Kit de Limpieza para Computadoras │ 9.99          │
└───────────────────────────────────┴───────────────┘
**/

-- Obtener los clientes que han realizado al menos un pedido en febrero de 2024.
SELECT c.*  from pedidos as ped, clientes as c  WHERE c.id=ped.id_cliente AND ped.cantidad >= 1;
/**
┌────┬─────────────────┬───────────────────────────┐
│ id │     nombre      │           email           │
├────┼─────────────────┼───────────────────────────┤
│ 1  │ Juan Pérez      │ juan@example.com          │
│ 2  │ María Gómez     │ maria@example.com         │
│ 3  │ Carlos López    │ carlos@example.com        │
│ 4  │ Ana Rodríguez   │ ana@example.com           │
│ 5  │ Luisa Martínez  │ luisa@example.com         │
│ 6  │ Pedro Sánchez   │ pedro@example.com         │
│ 7  │ Laura García    │ laura@example.com         │
│ 8  │ Miguel Martín   │ miguel@example.com        │
│ 9  │ Elena González  │ elena@example.com         │
│ 10 │ David Torres    │ david@example.com         │
│ 11 │ Sofía Ruiz      │ sofia@example.com         │
│ 12 │ Javier López    │ javier@example.com        │
│ 13 │ Carmen Vargas   │ carmen@example.com        │
│ 14 │ Daniel Muñoz    │ daniel@example.com        │
│ 15 │ Isabel Serrano  │ isabel@example.com        │
│ 16 │ Alejandro Muñoz │ alejandro@example.com     │
│ 17 │ Raquel Herrera  │ raquel@example.com        │
│ 18 │ Francisco Mora  │ francisco@example.com     │
│ 19 │ Marina Díaz     │ marina@example.com        │
│ 20 │ Antonio Jiménez │ antonio@example.com       │
│ 21 │ Beatriz Romero  │ beatriz@example.com       │
│ 22 │ Carlos Gómez    │ carlos.gomez@example.com  │
│ 23 │ Clara Sánchez   │ clara.sanchez@example.com │
│ 24 │ Andrés Martínez │ andres@example.com        │
│ 25 │ Lucía Díaz      │ lucia@example.com         │
│ 26 │ Mario Serrano   │ mario@example.com         │
│ 27 │ Eva Torres      │ eva.torres@example.com    │
│ 28 │ Roberto Ruiz    │ roberto@example.com       │
│ 29 │ Celia García    │ celia@example.com         │
└────┴─────────────────┴───────────────────────────┘
**/
-- Obtener la fecha del último pedido realizado por el cliente con ID 3.

SELECT c.nombre, min(fecha_pedido), prod.nombre, prod.precio FROM productos as prod, pedidos as ped, clientes as c WHERE ped.id_cliente=3 AND ped.id_producto=prod.id;
/**
┌────────────┬───────────────────┬────────┬────────┐
│   nombre   │ min(fecha_pedido) │ nombre │ precio │
├────────────┼───────────────────┼────────┼────────┤
│ Juan Pérez │ 2024-02-03        │ TV LED │ 799.5  │
└────────────┴───────────────────┴────────┴────────┘
**/

-- Obtener los productos que tienen una 'a' al final del nombre.

SELECT nombre from productos where nombre regexp 'a$';
/**
┌────────────────────┐
│       nombre       │
├────────────────────┤
│ Impresora          │
│ Batería Externa    │
│ Tarjeta de Memoria │
└────────────────────┘
**/

-- Obtener los clientes cuyos nombres tienen al menos 4 vocales (mayúsculas|minúsculas).



-- Obtener los productos cuyo precio tenga al menos 4 números sin contrar los decimales.
-- Obtener los clientes cuyos nombres tienen al menos una 'a' seguida de una 'e'.
-- Obtener los productos cuyos nombres terminan con una consonante.
-- Obtener los productos cuyos nombres empiezan con una vocal.