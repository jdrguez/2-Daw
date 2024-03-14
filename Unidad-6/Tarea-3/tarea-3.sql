-- Realiza las siguientes consultas:

--    Mostrar todos los clientes.
SELECT * FROM clientes;
/**
+------------+----------------+----------------+
| id_cliente | nombre_cliente | ciudad_cliente |
+------------+----------------+----------------+
|          1 | Juan           | Ciudad A       |
|          2 | María          | Ciudad B       |
|          3 | Pedro          | Ciudad C       |
+------------+----------------+----------------+
**/
--    Mostrar todas las órdenes.

SELECT * FROM ordenes;
/**
+----------+------------+-------------+
| id_orden | id_cliente | fecha_orden |
+----------+------------+-------------+
|        1 |          1 | 2024-03-01  |
|        2 |          2 | 2024-03-02  |
|        3 |          3 | 2024-03-03  |
+----------+------------+-------------+
3 rows in set (0,00 sec)
**/
--    Mostrar todos los productos.

SELECT * FROM productos;
/**
+-------------+-----------------+-----------------+
| id_producto | nombre_producto | precio_producto |
+-------------+-----------------+-----------------+
|           1 | Producto A      |           50.00 |
|           2 | Producto B      |           75.00 |
|           3 | Producto C      |          100.00 |
+-------------+-----------------+-----------------+
3 rows in set (0,00 sec)
**/

--    Mostrar todos los detalles de las órdenes.

SELECT * FROM detalles_ordenes;
/**
+------------+----------+-------------+----------+
| id_detalle | id_orden | id_producto | cantidad |
+------------+----------+-------------+----------+
|          1 |        1 |           1 |        2 |
|          2 |        2 |           2 |        1 |
|          3 |        3 |           3 |        3 |
+------------+----------+-------------+----------+
3 rows in set (0,01 sec)
**/

--    Mostrar los primeros 5 clientes ordenados por nombre.

 SELECT * FROM clientes ORDER BY nombre_cliente LIMIT 5;
/**
+------------+----------------+----------------+
| id_cliente | nombre_cliente | ciudad_cliente |
+------------+----------------+----------------+
|          1 | Juan           | Ciudad A       |
|          2 | María          | Ciudad B       |
|          3 | Pedro          | Ciudad C       |
+------------+----------------+----------------+
3 rows in set (0,00 sec)
**/
--    Mostrar los productos con un precio mayor a 50.

SELECT * FROM productos WHERE precio_producto > 50;
/**
+-------------+-----------------+-----------------+
| id_producto | nombre_producto | precio_producto |
+-------------+-----------------+-----------------+
|           2 | Producto B      |           75.00 |
|           3 | Producto C      |          100.00 |
+-------------+-----------------+-----------------+
2 rows in set (0,00 sec)
**/

--    Mostrar todas las órdenes realizadas por el cliente con ID 1.

SELECT * FROM ordenes 
    -> WHERE id_cliente = 1;
/**
+----------+------------+-------------+
| id_orden | id_cliente | fecha_orden |
+----------+------------+-------------+
|        1 |          1 | 2024-03-01  |
+----------+------------+-------------+
1 row in set (0,00 sec)
**/

--    Mostrar los clientes cuyos nombres comienzan con la letra "A".
SELECT * FROM clientes  WHERE nombre_cliente REGEXP '^A';
/**
Empty set (0,02 sec)
**/


--    Mostrar las órdenes que contienen más de 2 productos.

SELECT * FROM ordenes as o
    -> JOIN detalles_ordenes as do on do.id_orden=o.id_orden
    -> WHERE cantidad > 2;
/**
+----------+------------+-------------+------------+----------+-------------+----------+
| id_orden | id_cliente | fecha_orden | id_detalle | id_orden | id_producto | cantidad |
+----------+------------+-------------+------------+----------+-------------+----------+
|        3 |          3 | 2024-03-03  |          3 |        3 |           3 |        3 |
+----------+------------+-------------+------------+----------+-------------+----------+
1 row in set (0,01 sec)
**/

--    Mostrar los productos ordenados por precio de forma descendente.

SELECT * FROM productos 
    -> ORDER BY precio_producto DESC;
/**
+-------------+-----------------+-----------------+
| id_producto | nombre_producto | precio_producto |
+-------------+-----------------+-----------------+
|           3 | Producto C      |          100.00 |
|           2 | Producto B      |           75.00 |
|           1 | Producto A      |           50.00 |
+-------------+-----------------+-----------------+
3 rows in set (0,00 sec)
**/

--    Seleccionar todos los clientes y sus órdenes, incluso si no tienen órdenes.
SELECT * FROM clientes as c
    -> LEFT JOIN ordenes as o on o.id_cliente=c.id_cliente;
/**
+------------+----------------+----------------+----------+------------+-------------+
| id_cliente | nombre_cliente | ciudad_cliente | id_orden | id_cliente | fecha_orden |
+------------+----------------+----------------+----------+------------+-------------+
|          1 | Juan           | Ciudad A       |        1 |          1 | 2024-03-01  |
|          2 | María          | Ciudad B       |        2 |          2 | 2024-03-02  |
|          3 | Pedro          | Ciudad C       |        3 |          3 | 2024-03-03  |
+------------+----------------+----------------+----------+------------+-------------+
3 rows in set (0,00 sec)
**/
--    Seleccionar todas las órdenes junto con los productos correspondientes.

SELECT * FROM ordenes as o
    -> JOIN detalles_ordenes as do on do.id_orden=o.id_orden
    -> JOIN productos as p on do.id_producto=p.id_producto;
/**
+----------+------------+-------------+------------+----------+-------------+----------+-------------+-----------------+-----------------+
| id_orden | id_cliente | fecha_orden | id_detalle | id_orden | id_producto | cantidad | id_producto | nombre_producto | precio_producto |
+----------+------------+-------------+------------+----------+-------------+----------+-------------+-----------------+-----------------+
|        1 |          1 | 2024-03-01  |          1 |        1 |           1 |        2 |           1 | Producto A      |           50.00 |
|        2 |          2 | 2024-03-02  |          2 |        2 |           2 |        1 |           2 | Producto B      |           75.00 |
|        3 |          3 | 2024-03-03  |          3 |        3 |           3 |        3 |           3 | Producto C      |          100.00 |
+----------+------------+-------------+------------+----------+-------------+----------+-------------+-----------------+-----------------+
**/

--    Mostrar el nombre de los clientes que han realizado órdenes de productos que cuestan más de 50.

SELECT c.nombre_cliente FROM clientes as c JOIN ordenes as o on o.id_cliente=c.id_cliente JOIN detalles_ordenes as do on do.id_orden=o.id_orden JOIN productos as p on p.id_producto=do.id_producto WHERE p.precio_producto >
50;
/**
+----------------+
| nombre_cliente |
+----------------+
| María          |
| Pedro          |
+----------------+
2 rows in set (0,00 sec)
**/

--    Obtener el nombre de los productos que no se han ordenado aún.

 SELECT p.nombre_producto FROM detalles_ordenes as do JOIN productos as p on p.id_producto=do.id_producto WHERE do.id_producto not in (SELECT id_producto from detalles_ordenes);
/**
Empty set (0,00 sec)
**/
--    Mostrar el nombre del cliente, el producto y la cantidad para todas las órdenes.

SELECT c.nombre_cliente, p.nombre_producto, do.cantidad FROM ordenes as o
    -> JOIN clientes as c on c.id_cliente=o.id_cliente
    -> JOIN detalles_ordenes as do on do.id_orden=o.id_orden
    -> JOIN productos as p on p.id_producto=do.id_producto;
/**
+----------------+-----------------+----------+
| nombre_cliente | nombre_producto | cantidad |
+----------------+-----------------+----------+
| Juan           | Producto A      |        2 |
| María          | Producto B      |        1 |
| Pedro          | Producto C      |        3 |
+----------------+-----------------+----------+
**/

--    Obtener el nombre de los productos junto con los nombres de los clientes que han realizado órdenes de esos productos.
SELECT p.nombre_producto, c.nombre_cliente FROM ordenes as o
    -> JOIN clientes as c on c.id_cliente=o.id_cliente
    -> JOIN detalles_ordenes as do on do.id_orden=o.id_orden
    -> JOIN productos as p on p.id_producto=do.id_producto;
/**
+-----------------+----------------+
| nombre_producto | nombre_cliente |
+-----------------+----------------+
| Producto A      | Juan           |
| Producto B      | María          |
| Producto C      | Pedro          |
+-----------------+----------------+
**/

--    Mostrar todas las órdenes con sus clientes y productos, incluso si no hay órdenes.


SELECT * FROM ordenes as o  LEFT JOIN clientes as c on c.id_cliente=o.id_cliente
    -> JOIN detalles_ordenes as do on do.id_orden=o.id_orden
    -> JOIN productos as p on p.id_producto=do.id_producto;
/**
+----------+------------+-------------+------------+----------------+----------------+------------+----------+-------------+----------+-------------+-----------------+-----------------+
| id_orden | id_cliente | fecha_orden | id_cliente | nombre_cliente | ciudad_cliente | id_detalle | id_orden | id_producto | cantidad | id_producto | nombre_producto | precio_producto |
+----------+------------+-------------+------------+----------------+----------------+------------+----------+-------------+----------+-------------+-----------------+-----------------+
|        1 |          1 | 2024-03-01  |          1 | Juan           | Ciudad A       |          1 |        1 |           1 |        2 |           1 | Producto A      |           50.00 |
|        2 |          2 | 2024-03-02  |          2 | María          | Ciudad B       |          2 |        2 |           2 |        1 |           2 | Producto B      |           75.00 |
|        3 |          3 | 2024-03-03  |          3 | Pedro          | Ciudad C       |          3 |        3 |           3 |        3 |           3 | Producto C      |          100.00 |
+----------+------------+-------------+------------+----------------+----------------+------------+----------+-------------+----------+-------------+-----------------+-----------------+
**/
--    Obtener el nombre de los clientes junto con el número total de órdenes que han realizado.

SELECT c.nombre_cliente, COUNT(o.id_orden) as total FROM ordenes as o JOIN clientes as c on c.id_cliente=o.id_cliente GROUP BY c.nombre_cliente;
/**
+----------------+-------+
| nombre_cliente | total |
+----------------+-------+
| Juan           |     1 |
| María          |     1 |
| Pedro          |     1 |
+----------------+-------+
3 rows in set (0,01 sec)
**/

--    Mostrar todas las órdenes junto con el nombre del cliente y el nombre del producto.

SELECT do.*, c.nombre_cliente, p.nombre_producto FROM ordenes as o
    -> JOIN clientes as c on c.id_cliente=o.id_cliente
    -> JOIN detalles_ordenes as do on do.id_orden=o.id_orden
    -> JOIN productos as p on p.id_producto=do.id_producto;
/**
+------------+----------+-------------+----------+----------------+-----------------+
| id_detalle | id_orden | id_producto | cantidad | nombre_cliente | nombre_producto |
+------------+----------+-------------+----------+----------------+-----------------+
|          1 |        1 |           1 |        2 | Juan           | Producto A      |
|          2 |        2 |           2 |        1 | María          | Producto B      |
|          3 |        3 |           3 |        3 | Pedro          | Producto C      |
+------------+----------+-------------+----------+----------------+-----------------+
3 rows in set (0,00 sec)
**/

--    Mostrar todas las órdenes con sus productos y clientes, incluso si no hay información de cliente.
SELECT do.*, c.nombre_cliente, p.nombre_producto FROM ordenes as o  
RIGHT JOIN clientes as c on c.id_cliente=o.id_cliente 
JOIN detalles_ordenes as do on do.id_orden=o.id_orden 
JOIN productos as p on p.id_producto=do.id_producto;
/**
+------------+----------+-------------+----------+----------------+-----------------+
| id_detalle | id_orden | id_producto | cantidad | nombre_cliente | nombre_producto |
+------------+----------+-------------+----------+----------------+-----------------+
|          1 |        1 |           1 |        2 | Juan           | Producto A      |
|          2 |        2 |           2 |        1 | María          | Producto B      |
|          3 |        3 |           3 |        3 | Pedro          | Producto C      |
+------------+----------+-------------+----------+----------------+-----------------+
3 rows in set (0,00 sec)
**/

--    Obtener el nombre de los productos junto con los nombres de los clientes que han realizado órdenes de esos productos, incluyendo los productos que no han sido ordenados.

SELECT do.*, c.nombre_cliente, p.nombre_producto FROM ordenes as o  
    -> JOIN clientes as c on c.id_cliente=o.id_cliente 
    -> JOIN detalles_ordenes as do on do.id_orden=o.id_orden 
    -> RIGHT JOIN productos as p on p.id_producto=do.id_producto;
/**
+------------+----------+-------------+----------+----------------+-----------------+
| id_detalle | id_orden | id_producto | cantidad | nombre_cliente | nombre_producto |
+------------+----------+-------------+----------+----------------+-----------------+
|          1 |        1 |           1 |        2 | Juan           | Producto A      |
|          2 |        2 |           2 |        1 | María          | Producto B      |
|          3 |        3 |           3 |        3 | Pedro          | Producto C      |
+------------+----------+-------------+----------+----------------+-----------------+
**/
--    Mostrar todas las órdenes junto con el nombre del cliente y el nombre del producto, incluyendo las órdenes sin productos.

SELECT do.*, c.nombre_cliente, p.nombre_producto FROM ordenes as o  
    ->     JOIN clientes as c on c.id_cliente=o.id_cliente 
    ->     LEFT JOIN detalles_ordenes as do on do.id_orden=o.id_orden 
    ->     JOIN productos as p on p.id_producto=do.id_producto;
/**
+------------+----------+-------------+----------+----------------+-----------------+
| id_detalle | id_orden | id_producto | cantidad | nombre_cliente | nombre_producto |
+------------+----------+-------------+----------+----------------+-----------------+
|          1 |        1 |           1 |        2 | Juan           | Producto A      |
|          2 |        2 |           2 |        1 | María          | Producto B      |
|          3 |        3 |           3 |        3 | Pedro          | Producto C      |
+------------+----------+-------------+----------+----------------+-----------------+
3 rows in set (0,00 sec)
**/

--    Obtener el nombre de los clientes junto con el número total de órdenes que han realizado, incluyendo los clientes que no han realizado órdenes.

SELECT c.nombre_cliente, COUNT(o.id_orden) as total FROM ordenes as o 
    -> LEFT JOIN clientes as c on c.id_cliente=o.id_cliente GROUP BY c.nombre_cliente;
/**
+----------------+-------+
| nombre_cliente | total |
+----------------+-------+
| Juan           |     1 |
| María          |     1 |
| Pedro          |     1 |
+----------------+-------+
3 rows in set (0,00 sec)
**/

--    Mostrar todas las órdenes con sus clientes y productos, incluyendo las órdenes y productos que no tienen información.




--    Realizar un inner join entre clientes y órdenes.

SELECT * FROM clientes as c
    -> JOIN ordenes as o on o.id_cliente=c.id_cliente;
+------------+----------------+----------------+----------+------------+-------------+
| id_cliente | nombre_cliente | ciudad_cliente | id_orden | id_cliente | fecha_orden |
+------------+----------------+----------------+----------+------------+-------------+
|          1 | Juan           | Ciudad A       |        1 |          1 | 2024-03-01  |
|          2 | María          | Ciudad B       |        2 |          2 | 2024-03-02  |
|          3 | Pedro          | Ciudad C       |        3 |          3 | 2024-03-03  |
+------------+----------------+----------------+----------+------------+-------------+
3 rows in set (0,00 sec)

--    Realizar un left join entre órdenes y detalles de órdenes.

SELECT * FROM detalles_ordenes as do
    -> LEFT JOIN ordenes as o on do.id_orden=o.id_orden;
+------------+----------+-------------+----------+----------+------------+-------------+
| id_detalle | id_orden | id_producto | cantidad | id_orden | id_cliente | fecha_orden |
+------------+----------+-------------+----------+----------+------------+-------------+
|          1 |        1 |           1 |        2 |        1 |          1 | 2024-03-01  |
|          2 |        2 |           2 |        1 |        2 |          2 | 2024-03-02  |
|          3 |        3 |           3 |        3 |        3 |          3 | 2024-03-03  |
+------------+----------+-------------+----------+----------+------------+-------------+

--    Realizar un right join entre productos y detalles de órdenes.


SELECT * FROM detalles_ordenes as do
    -> RIGHT JOIN productos as p on do.id_producto=p.id_producto;
+------------+----------+-------------+----------+-------------+-----------------+-----------------+
| id_detalle | id_orden | id_producto | cantidad | id_producto | nombre_producto | precio_producto |
+------------+----------+-------------+----------+-------------+-----------------+-----------------+
|          1 |        1 |           1 |        2 |           1 | Producto A      |           50.00 |
|          2 |        2 |           2 |        1 |           2 | Producto B      |           75.00 |
|          3 |        3 |           3 |        3 |           3 | Producto C      |          100.00 |
+------------+----------+-------------+----------+-------------+-----------------+-----------------+
3 rows in set (0,00 sec)


--    Realizar un full join entre clientes y órdenes.

SELECT * FROM clientes as c
FULL JOIN ordenes as o;


--    Realizar un full join entre órdenes y detalles de órdenes.
--    Realizar un full join entre productos y detalles de órdenes.
