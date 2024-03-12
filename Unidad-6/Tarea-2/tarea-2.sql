-- Realiza la migración a MySql y realiza las siguientes consultas:

--    Consultas simples:
-- Mostrar todos los clientes.
SELECT * FROM clientes;
/**
+------------+------------+---------------+
| id_cliente | nombre     | direccion     |
+------------+------------+---------------+
|          1 | Cliente 1  | Dirección 1   |
|          2 | Cliente 2  | Dirección 2   |
|          3 | Cliente 3  | Dirección 3   |
|          4 | Cliente 4  | Dirección 4   |
|          5 | Cliente 5  | Dirección 5   |
|          6 | Cliente 6  | Dirección 6   |
|          7 | Cliente 7  | Dirección 7   |
|          8 | Cliente 8  | Dirección 8   |
|          9 | Cliente 9  | Dirección 9   |
|         10 | Cliente 10 | Dirección 10  |
|         11 | Cliente 11 | Dirección 11  |
|         12 | Cliente 12 | Dirección 12  |
|         13 | Cliente 13 | Dirección 13  |
|         14 | Cliente 14 | Dirección 14  |
|         15 | Cliente 15 | Dirección 15  |
|         16 | Cliente 16 | Dirección 16  |
|         17 | Cliente 17 | Dirección 17  |
|         18 | Cliente 18 | Dirección 18  |
|         19 | Cliente 19 | Dirección 19  |
|         20 | Cliente 20 | Dirección 20  |
+------------+------------+---------------+
20 rows in set (0,00 sec)
**/
-- Mostrar todos los productos.
SELECT * FROM productos;
/**
+-------------+-------------+--------+
| id_producto | nombre      | precio |
+-------------+-------------+--------+
|           1 | Producto 1  |     11 |
|           2 | Producto 2  |     21 |
|           3 | Producto 3  |     31 |
|           4 | Producto 4  |     41 |
|           5 | Producto 5  |     51 |
|           6 | Producto 6  |     61 |
|           7 | Producto 7  |     71 |
|           8 | Producto 8  |     81 |
|           9 | Producto 9  |     91 |
|          10 | Producto 10 |    101 |
|          11 | Producto 11 |    111 |
|          12 | Producto 12 |    121 |
|          13 | Producto 13 |    131 |
|          14 | Producto 14 |    141 |
|          15 | Producto 15 |    151 |
|          16 | Producto 16 |    161 |
|          17 | Producto 17 |    171 |
|          18 | Producto 18 |    181 |
|          19 | Producto 19 |    191 |
|          20 | Producto 20 |    201 |
+-------------+-------------+--------+
20 rows in set (0,01 sec)
**/
-- Mostrar todas las órdenes.

SELECT * FROM ordenes;
/**
+----------+------------+-------------+----------+
| id_orden | id_cliente | id_producto | cantidad |
+----------+------------+-------------+----------+
|        1 |          1 |           1 |        2 |
|        2 |          2 |           2 |        1 |
|        3 |          3 |           3 |        3 |
|        4 |          4 |           4 |        2 |
|        5 |          5 |           5 |        1 |
|        6 |          6 |           6 |        2 |
|        7 |          7 |           7 |        3 |
|        8 |          8 |           8 |        2 |
|        9 |          9 |           9 |        1 |
|       10 |         10 |          10 |        2 |
|       11 |         11 |          11 |        3 |
|       12 |         12 |          12 |        2 |
|       13 |         13 |          13 |        1 |
|       14 |         14 |          14 |        2 |
|       15 |         15 |          15 |        3 |
|       16 |         16 |          16 |        2 |
|       17 |         17 |          17 |        1 |
|       18 |         18 |          18 |        2 |
|       19 |         19 |          19 |        3 |
|       20 |         20 |          20 |        2 |
+----------+------------+-------------+----------+
20 rows in set (0,00 sec)
**/

--Mostrar los primeros 5 clientes ordenados por nombre.

SELECT nombre FROM clientes  ORDER BY nombre ASC LIMIT 5;
+------------+
| nombre     |
+------------+
| Cliente 1  |
| Cliente 10 |
| Cliente 11 |
| Cliente 12 |
| Cliente 13 |
+------------+
5 rows in set (0,01 sec)


--Mostrar los productos con un precio mayor a 50.

SELECT * FROM productos  WHERE precio > 50;
/**
+-------------+-------------+--------+
| id_producto | nombre      | precio |
+-------------+-------------+--------+
|           5 | Producto 5  |     51 |
|           6 | Producto 6  |     61 |
|           7 | Producto 7  |     71 |
|           8 | Producto 8  |     81 |
|           9 | Producto 9  |     91 |
|          10 | Producto 10 |    101 |
|          11 | Producto 11 |    111 |
|          12 | Producto 12 |    121 |
|          13 | Producto 13 |    131 |
|          14 | Producto 14 |    141 |
|          15 | Producto 15 |    151 |
|          16 | Producto 16 |    161 |
|          17 | Producto 17 |    171 |
|          18 | Producto 18 |    181 |
|          19 | Producto 19 |    191 |
|          20 | Producto 20 |    201 |
+-------------+-------------+--------+
**/
--Mostrar todas las órdenes realizadas por el cliente con ID 1.

SELECT * FROM ordenes 
    -> WHERE id_cliente = 1
    -> ;
/**
+----------+------------+-------------+----------+
| id_orden | id_cliente | id_producto | cantidad |
+----------+------------+-------------+----------+
|        1 |          1 |           1 |        2 |
+----------+------------+-------------+----------+
**/

--Mostrar los clientes cuyos nombres comienzan con la letra "M".
SELECT nombre FROM clientes
    -> WHERE nombre REGEXP '^M';
/**
Empty set (0,01 sec)
**/
--Mostrar las órdenes que contienen más de 2 productos.
 SELECT * FROM ordenes 
    -> WHERE cantidad > 2;

/**
+----------+------------+-------------+----------+
| id_orden | id_cliente | id_producto | cantidad |
+----------+------------+-------------+----------+
|        3 |          3 |           3 |        3 |
|        7 |          7 |           7 |        3 |
|       11 |         11 |          11 |        3 |
|       15 |         15 |          15 |        3 |
|       19 |         19 |          19 |        3 |
+----------+------------+-------------+----------+
5 rows in set (0,00 sec)
**/

--Mostrar los productos ordenados por precio de forma descendente.

SELECT * FROM productos 
    -> ORDER BY precio DESC;
/**
+-------------+-------------+--------+
| id_producto | nombre      | precio |
+-------------+-------------+--------+
|          20 | Producto 20 |    201 |
|          19 | Producto 19 |    191 |
|          18 | Producto 18 |    181 |
|          17 | Producto 17 |    171 |
|          16 | Producto 16 |    161 |
|          15 | Producto 15 |    151 |
|          14 | Producto 14 |    141 |
|          13 | Producto 13 |    131 |
|          12 | Producto 12 |    121 |
|          11 | Producto 11 |    111 |
|          10 | Producto 10 |    101 |
|           9 | Producto 9  |     91 |
|           8 | Producto 8  |     81 |
|           7 | Producto 7  |     71 |
|           6 | Producto 6  |     61 |
|           5 | Producto 5  |     51 |
|           4 | Producto 4  |     41 |
|           3 | Producto 3  |     31 |
|           2 | Producto 2  |     21 |
|           1 | Producto 1  |     11 |
+-------------+-------------+--------+
20 rows in set (0,00 sec)
**/
--Consultas de ejemplo para practicar join

-- Seleccionar todos los clientes y sus órdenes, incluso si no tienen órdenes


SELECT * FROM clientes as c
    -> LEFT JOIN ordenes as o on o.id_cliente=c.id_cliente;
/**
+------------+------------+---------------+----------+------------+-------------+----------+
| id_cliente | nombre     | direccion     | id_orden | id_cliente | id_producto | cantidad |
+------------+------------+---------------+----------+------------+-------------+----------+
|          1 | Cliente 1  | Dirección 1   |        1 |          1 |           1 |        2 |
|          2 | Cliente 2  | Dirección 2   |        2 |          2 |           2 |        1 |
|          3 | Cliente 3  | Dirección 3   |        3 |          3 |           3 |        3 |
|          4 | Cliente 4  | Dirección 4   |        4 |          4 |           4 |        2 |
|          5 | Cliente 5  | Dirección 5   |        5 |          5 |           5 |        1 |
|          6 | Cliente 6  | Dirección 6   |        6 |          6 |           6 |        2 |
|          7 | Cliente 7  | Dirección 7   |        7 |          7 |           7 |        3 |
|          8 | Cliente 8  | Dirección 8   |        8 |          8 |           8 |        2 |
|          9 | Cliente 9  | Dirección 9   |        9 |          9 |           9 |        1 |
|         10 | Cliente 10 | Dirección 10  |       10 |         10 |          10 |        2 |
|         11 | Cliente 11 | Dirección 11  |       11 |         11 |          11 |        3 |
|         12 | Cliente 12 | Dirección 12  |       12 |         12 |          12 |        2 |
|         13 | Cliente 13 | Dirección 13  |       13 |         13 |          13 |        1 |
|         14 | Cliente 14 | Dirección 14  |       14 |         14 |          14 |        2 |
|         15 | Cliente 15 | Dirección 15  |       15 |         15 |          15 |        3 |
|         16 | Cliente 16 | Dirección 16  |       16 |         16 |          16 |        2 |
|         17 | Cliente 17 | Dirección 17  |       17 |         17 |          17 |        1 |
|         18 | Cliente 18 | Dirección 18  |       18 |         18 |          18 |        2 |
|         19 | Cliente 19 | Dirección 19  |       19 |         19 |          19 |        3 |
|         20 | Cliente 20 | Dirección 20  |       20 |         20 |          20 |        2 |
+------------+------------+---------------+----------+------------+-------------+----------+
20 rows in set (0,00 sec)

**/
-- Seleccionar todas las órdenes junto con los productos correspondientes

SELECT * FROM ordenes as o
    -> JOIN productos as p on p.id_producto=o.id_producto;
/**
+----------+------------+-------------+----------+-------------+-------------+--------+
| id_orden | id_cliente | id_producto | cantidad | id_producto | nombre      | precio |
+----------+------------+-------------+----------+-------------+-------------+--------+
|        1 |          1 |           1 |        2 |           1 | Producto 1  |     11 |
|        2 |          2 |           2 |        1 |           2 | Producto 2  |     21 |
|        3 |          3 |           3 |        3 |           3 | Producto 3  |     31 |
|        4 |          4 |           4 |        2 |           4 | Producto 4  |     41 |
|        5 |          5 |           5 |        1 |           5 | Producto 5  |     51 |
|        6 |          6 |           6 |        2 |           6 | Producto 6  |     61 |
|        7 |          7 |           7 |        3 |           7 | Producto 7  |     71 |
|        8 |          8 |           8 |        2 |           8 | Producto 8  |     81 |
|        9 |          9 |           9 |        1 |           9 | Producto 9  |     91 |
|       10 |         10 |          10 |        2 |          10 | Producto 10 |    101 |
|       11 |         11 |          11 |        3 |          11 | Producto 11 |    111 |
|       12 |         12 |          12 |        2 |          12 | Producto 12 |    121 |
|       13 |         13 |          13 |        1 |          13 | Producto 13 |    131 |
|       14 |         14 |          14 |        2 |          14 | Producto 14 |    141 |
|       15 |         15 |          15 |        3 |          15 | Producto 15 |    151 |
|       16 |         16 |          16 |        2 |          16 | Producto 16 |    161 |
|       17 |         17 |          17 |        1 |          17 | Producto 17 |    171 |
|       18 |         18 |          18 |        2 |          18 | Producto 18 |    181 |
|       19 |         19 |          19 |        3 |          19 | Producto 19 |    191 |
|       20 |         20 |          20 |        2 |          20 | Producto 20 |    201 |
+----------+------------+-------------+----------+-------------+-------------+--------+
20 rows in set (0,00 sec)
**/

--Mostrar el nombre de los clientes que han realizado órdenes de productos que cuestan más de 50
SELECT c.nombre from clientes as c JOIN ordenes as o on o.id_cliente=c.id_cliente JOIN productos as p on p.id_producto=o.id_producto WHERE p.precio > 50;
/**
+------------+
| nombre     |
+------------+
| Cliente 5  |
| Cliente 6  |
| Cliente 7  |
| Cliente 8  |
| Cliente 9  |
| Cliente 10 |
| Cliente 11 |
| Cliente 12 |
| Cliente 13 |
| Cliente 14 |
| Cliente 15 |
| Cliente 16 |
| Cliente 17 |
| Cliente 18 |
| Cliente 19 |
| Cliente 20 |
+------------+
**/
--Obtener el nombre de los productos que no se han ordenado aún






--Mostrar el nombre del cliente, el producto y la cantidad para todas las órdenes

SELECT c.nombre, p.nombre, o.cantidad from ordenes as o JOIN productos as p on p.id_producto=o.id_producto JOIN clientes as c on c.id_cliente=o.id_cliente;
/**
+------------+-------------+----------+
| nombre     | nombre      | cantidad |
+------------+-------------+----------+
| Cliente 1  | Producto 1  |        2 |
| Cliente 2  | Producto 2  |        1 |
| Cliente 3  | Producto 3  |        3 |
| Cliente 4  | Producto 4  |        2 |
| Cliente 5  | Producto 5  |        1 |
| Cliente 6  | Producto 6  |        2 |
| Cliente 7  | Producto 7  |        3 |
| Cliente 8  | Producto 8  |        2 |
| Cliente 9  | Producto 9  |        1 |
| Cliente 10 | Producto 10 |        2 |
| Cliente 11 | Producto 11 |        3 |
| Cliente 12 | Producto 12 |        2 |
| Cliente 13 | Producto 13 |        1 |
| Cliente 14 | Producto 14 |        2 |
| Cliente 15 | Producto 15 |        3 |
| Cliente 16 | Producto 16 |        2 |
| Cliente 17 | Producto 17 |        1 |
| Cliente 18 | Producto 18 |        2 |
| Cliente 19 | Producto 19 |        3 |
| Cliente 20 | Producto 20 |        2 |
+------------+-------------+----------+
**/


--Obtener el nombre de los productos junto con los nombres de los clientes que han realizado órdenes de esos productos

SELECT p.nombre, c.nombre FROM ordenes as o JOIN clientes as c on o.id_cliente=c.id_cliente JOIN productos as p on p.id_producto=o.id_producto;
/**
+-------------+------------+
| nombre      | nombre     |
+-------------+------------+
| Producto 1  | Cliente 1  |
| Producto 2  | Cliente 2  |
| Producto 3  | Cliente 3  |
| Producto 4  | Cliente 4  |
| Producto 5  | Cliente 5  |
| Producto 6  | Cliente 6  |
| Producto 7  | Cliente 7  |
| Producto 8  | Cliente 8  |
| Producto 9  | Cliente 9  |
| Producto 10 | Cliente 10 |
| Producto 11 | Cliente 11 |
| Producto 12 | Cliente 12 |
| Producto 13 | Cliente 13 |
| Producto 14 | Cliente 14 |
| Producto 15 | Cliente 15 |
| Producto 16 | Cliente 16 |
| Producto 17 | Cliente 17 |
| Producto 18 | Cliente 18 |
| Producto 19 | Cliente 19 |
| Producto 20 | Cliente 20 |
+-------------+------------+
20 rows in set (0,00 sec)
**/

--Mostrar todas las órdenes con sus clientes y productos, incluso si no hay órdenes

SELECT p.nombre, c.nombre FROM ordenes as o LEFT JOIN clientes as c on o.id_cliente=c.id_cliente JOIN productos as p on p.id_producto=o.id_producto;
/**
+-------------+------------+
| nombre      | nombre     |
+-------------+------------+
| Producto 1  | Cliente 1  |
| Producto 2  | Cliente 2  |
| Producto 3  | Cliente 3  |
| Producto 4  | Cliente 4  |
| Producto 5  | Cliente 5  |
| Producto 6  | Cliente 6  |
| Producto 7  | Cliente 7  |
| Producto 8  | Cliente 8  |
| Producto 9  | Cliente 9  |
| Producto 10 | Cliente 10 |
| Producto 11 | Cliente 11 |
| Producto 12 | Cliente 12 |
| Producto 13 | Cliente 13 |
| Producto 14 | Cliente 14 |
| Producto 15 | Cliente 15 |
| Producto 16 | Cliente 16 |
| Producto 17 | Cliente 17 |
| Producto 18 | Cliente 18 |
| Producto 19 | Cliente 19 |
| Producto 20 | Cliente 20 |
+-------------+------------+
20 rows in set (0,00 sec)
**/

--Obtener el nombre de los clientes junto con el número total de órdenes que han realizado

SELECT p.nombre, c.nombre FROM ordenes as o JOIN clientes as c on o.id_cliente=c.id_cliente JOIN productos as p on p.id_producto=o.id_producto;
/**
+-------------+------------+
| nombre      | nombre     |
+-------------+------------+
| Producto 1  | Cliente 1  |
| Producto 2  | Cliente 2  |
| Producto 3  | Cliente 3  |
| Producto 4  | Cliente 4  |
| Producto 5  | Cliente 5  |
| Producto 6  | Cliente 6  |
| Producto 7  | Cliente 7  |
| Producto 8  | Cliente 8  |
| Producto 9  | Cliente 9  |
| Producto 10 | Cliente 10 |
| Producto 11 | Cliente 11 |
| Producto 12 | Cliente 12 |
| Producto 13 | Cliente 13 |
| Producto 14 | Cliente 14 |
| Producto 15 | Cliente 15 |
| Producto 16 | Cliente 16 |
| Producto 17 | Cliente 17 |
| Producto 18 | Cliente 18 |
| Producto 19 | Cliente 19 |
| Producto 20 | Cliente 20 |
+-------------+------------+
**/

--Mostrar todas las órdenes junto con el nombre del cliente y el nombre del producto

SELECT o.*, c.nombre, p.nombre FROM ordenes as o
    -> JOIN clientes as c on c.id_cliente=o.id_cliente
    -> JOIN productos as p on p.id_producto=o.id_producto;
/**
+----------+------------+-------------+----------+------------+-------------+
| id_orden | id_cliente | id_producto | cantidad | nombre     | nombre      |
+----------+------------+-------------+----------+------------+-------------+
|        1 |          1 |           1 |        2 | Cliente 1  | Producto 1  |
|        2 |          2 |           2 |        1 | Cliente 2  | Producto 2  |
|        3 |          3 |           3 |        3 | Cliente 3  | Producto 3  |
|        4 |          4 |           4 |        2 | Cliente 4  | Producto 4  |
|        5 |          5 |           5 |        1 | Cliente 5  | Producto 5  |
|        6 |          6 |           6 |        2 | Cliente 6  | Producto 6  |
|        7 |          7 |           7 |        3 | Cliente 7  | Producto 7  |
|        8 |          8 |           8 |        2 | Cliente 8  | Producto 8  |
|        9 |          9 |           9 |        1 | Cliente 9  | Producto 9  |
|       10 |         10 |          10 |        2 | Cliente 10 | Producto 10 |
|       11 |         11 |          11 |        3 | Cliente 11 | Producto 11 |
|       12 |         12 |          12 |        2 | Cliente 12 | Producto 12 |
|       13 |         13 |          13 |        1 | Cliente 13 | Producto 13 |
|       14 |         14 |          14 |        2 | Cliente 14 | Producto 14 |
|       15 |         15 |          15 |        3 | Cliente 15 | Producto 15 |
|       16 |         16 |          16 |        2 | Cliente 16 | Producto 16 |
|       17 |         17 |          17 |        1 | Cliente 17 | Producto 17 |
|       18 |         18 |          18 |        2 | Cliente 18 | Producto 18 |
|       19 |         19 |          19 |        3 | Cliente 19 | Producto 19 |
|       20 |         20 |          20 |        2 | Cliente 20 | Producto 20 |
+----------+------------+-------------+----------+------------+-------------+
20 rows in set (0,00 sec)
**/
--Mostrar todas las órdenes con sus productos y clientes, incluso si no hay información de cliente.

SELECT * from ordenes as o
    -> LEFT JOIN clientes as c on c.id_cliente=o.id_cliente
    -> JOIN productos as p on p.id_producto=o.id_producto;
/**
+----------+------------+-------------+----------+------------+------------+---------------+-------------+-------------+--------+
| id_orden | id_cliente | id_producto | cantidad | id_cliente | nombre     | direccion     | id_producto | nombre      | precio |
+----------+------------+-------------+----------+------------+------------+---------------+-------------+-------------+--------+
|        1 |          1 |           1 |        2 |          1 | Cliente 1  | Dirección 1   |           1 | Producto 1  |     11 |
|        2 |          2 |           2 |        1 |          2 | Cliente 2  | Dirección 2   |           2 | Producto 2  |     21 |
|        3 |          3 |           3 |        3 |          3 | Cliente 3  | Dirección 3   |           3 | Producto 3  |     31 |
|        4 |          4 |           4 |        2 |          4 | Cliente 4  | Dirección 4   |           4 | Producto 4  |     41 |
|        5 |          5 |           5 |        1 |          5 | Cliente 5  | Dirección 5   |           5 | Producto 5  |     51 |
|        6 |          6 |           6 |        2 |          6 | Cliente 6  | Dirección 6   |           6 | Producto 6  |     61 |
|        7 |          7 |           7 |        3 |          7 | Cliente 7  | Dirección 7   |           7 | Producto 7  |     71 |
|        8 |          8 |           8 |        2 |          8 | Cliente 8  | Dirección 8   |           8 | Producto 8  |     81 |
|        9 |          9 |           9 |        1 |          9 | Cliente 9  | Dirección 9   |           9 | Producto 9  |     91 |
|       10 |         10 |          10 |        2 |         10 | Cliente 10 | Dirección 10  |          10 | Producto 10 |    101 |
|       11 |         11 |          11 |        3 |         11 | Cliente 11 | Dirección 11  |          11 | Producto 11 |    111 |
|       12 |         12 |          12 |        2 |         12 | Cliente 12 | Dirección 12  |          12 | Producto 12 |    121 |
|       13 |         13 |          13 |        1 |         13 | Cliente 13 | Dirección 13  |          13 | Producto 13 |    131 |
|       14 |         14 |          14 |        2 |         14 | Cliente 14 | Dirección 14  |          14 | Producto 14 |    141 |
|       15 |         15 |          15 |        3 |         15 | Cliente 15 | Dirección 15  |          15 | Producto 15 |    151 |
|       16 |         16 |          16 |        2 |         16 | Cliente 16 | Dirección 16  |          16 | Producto 16 |    161 |
|       17 |         17 |          17 |        1 |         17 | Cliente 17 | Dirección 17  |          17 | Producto 17 |    171 |
|       18 |         18 |          18 |        2 |         18 | Cliente 18 | Dirección 18  |          18 | Producto 18 |    181 |
|       19 |         19 |          19 |        3 |         19 | Cliente 19 | Dirección 19  |          19 | Producto 19 |    191 |
|       20 |         20 |          20 |        2 |         20 | Cliente 20 | Dirección 20  |          20 | Producto 20 |    201 |
+----------+------------+-------------+----------+------------+------------+---------------+-------------+-------------+--------+
**/
-- Obtener el nombre de los productos junto con el nombre de los clientes que han realizado órdenes de esos productos, incluyendo los productos que no han sido ordenados
SELECT p.nombre, c.nombre, o.* from ordenes as o 
    -> LEFT JOIN productos as p on p.id_producto=o.id_producto
    -> JOIN clientes as c on c.id_cliente=o.id_cliente;
/**
+-------------+------------+----------+------------+-------------+----------+
| nombre      | nombre     | id_orden | id_cliente | id_producto | cantidad |
+-------------+------------+----------+------------+-------------+----------+
| Producto 1  | Cliente 1  |        1 |          1 |           1 |        2 |
| Producto 2  | Cliente 2  |        2 |          2 |           2 |        1 |
| Producto 3  | Cliente 3  |        3 |          3 |           3 |        3 |
| Producto 4  | Cliente 4  |        4 |          4 |           4 |        2 |
| Producto 5  | Cliente 5  |        5 |          5 |           5 |        1 |
| Producto 6  | Cliente 6  |        6 |          6 |           6 |        2 |
| Producto 7  | Cliente 7  |        7 |          7 |           7 |        3 |
| Producto 8  | Cliente 8  |        8 |          8 |           8 |        2 |
| Producto 9  | Cliente 9  |        9 |          9 |           9 |        1 |
| Producto 10 | Cliente 10 |       10 |         10 |          10 |        2 |
| Producto 11 | Cliente 11 |       11 |         11 |          11 |        3 |
| Producto 12 | Cliente 12 |       12 |         12 |          12 |        2 |
| Producto 13 | Cliente 13 |       13 |         13 |          13 |        1 |
| Producto 14 | Cliente 14 |       14 |         14 |          14 |        2 |
| Producto 15 | Cliente 15 |       15 |         15 |          15 |        3 |
| Producto 16 | Cliente 16 |       16 |         16 |          16 |        2 |
| Producto 17 | Cliente 17 |       17 |         17 |          17 |        1 |
| Producto 18 | Cliente 18 |       18 |         18 |          18 |        2 |
| Producto 19 | Cliente 19 |       19 |         19 |          19 |        3 |
| Producto 20 | Cliente 20 |       20 |         20 |          20 |        2 |
+-------------+------------+----------+------------+-------------+----------+
20 rows in set (0,00 sec)
**/

--Mostrar todas las órdenes junto con el nombre del cliente y el nombre del producto, incluyendo las órdenes sin productos

SELECT o.*, c.nombre, p.nombre FROM clientes as c
    -> LEFT JOIN ordenes as o on o.id_cliente=c.id_cliente
    -> JOIN productos as p on o.id_producto=p.id_producto;
/**
+----------+------------+-------------+----------+------------+-------------+
| id_orden | id_cliente | id_producto | cantidad | nombre     | nombre      |
+----------+------------+-------------+----------+------------+-------------+
|        1 |          1 |           1 |        2 | Cliente 1  | Producto 1  |
|        2 |          2 |           2 |        1 | Cliente 2  | Producto 2  |
|        3 |          3 |           3 |        3 | Cliente 3  | Producto 3  |
|        4 |          4 |           4 |        2 | Cliente 4  | Producto 4  |
|        5 |          5 |           5 |        1 | Cliente 5  | Producto 5  |
|        6 |          6 |           6 |        2 | Cliente 6  | Producto 6  |
|        7 |          7 |           7 |        3 | Cliente 7  | Producto 7  |
|        8 |          8 |           8 |        2 | Cliente 8  | Producto 8  |
|        9 |          9 |           9 |        1 | Cliente 9  | Producto 9  |
|       10 |         10 |          10 |        2 | Cliente 10 | Producto 10 |
|       11 |         11 |          11 |        3 | Cliente 11 | Producto 11 |
|       12 |         12 |          12 |        2 | Cliente 12 | Producto 12 |
|       13 |         13 |          13 |        1 | Cliente 13 | Producto 13 |
|       14 |         14 |          14 |        2 | Cliente 14 | Producto 14 |
|       15 |         15 |          15 |        3 | Cliente 15 | Producto 15 |
|       16 |         16 |          16 |        2 | Cliente 16 | Producto 16 |
|       17 |         17 |          17 |        1 | Cliente 17 | Producto 17 |
|       18 |         18 |          18 |        2 | Cliente 18 | Producto 18 |
|       19 |         19 |          19 |        3 | Cliente 19 | Producto 19 |
|       20 |         20 |          20 |        2 | Cliente 20 | Producto 20 |
+----------+------------+-------------+----------+------------+-------------+
**/
--Obtener el nombre de los clientes junto con el número total de órdenes que han realizado, incluyendo los clientes que no han realizado órdenes.
SELECT c.nombre, COUNT(o.id_orden) as total_ordenes FROM ordenes as o LEFT JOIN clientes as c on o.id_cliente=c.id_cliente GROUP BY c.nombre;
/**
+------------+---------------+
| nombre     | total_ordenes |
+------------+---------------+
| Cliente 1  |             1 |
| Cliente 2  |             1 |
| Cliente 3  |             1 |
| Cliente 4  |             1 |
| Cliente 5  |             1 |
| Cliente 6  |             1 |
| Cliente 7  |             1 |
| Cliente 8  |             1 |
| Cliente 9  |             1 |
| Cliente 10 |             1 |
| Cliente 11 |             1 |
| Cliente 12 |             1 |
| Cliente 13 |             1 |
| Cliente 14 |             1 |
| Cliente 15 |             1 |
| Cliente 16 |             1 |
| Cliente 17 |             1 |
| Cliente 18 |             1 |
| Cliente 19 |             1 |
| Cliente 20 |             1 |
+------------+---------------+
20 rows in set (0,01 sec)
**/

--Mostrar todas las órdenes con sus clientes y productos, incluyendo las órdenes y productos que no tienen información.

SELECT o.*, p.*, c.* FROM clientes as c
    -> LEFT JOIN ordenes as o on o.id_cliente=c.id_cliente
    -> LEFT JOIN productos as p on p.id_producto=o.id_producto;
/**
+----------+------------+-------------+----------+-------------+-------------+--------+------------+------------+---------------+
| id_orden | id_cliente | id_producto | cantidad | id_producto | nombre      | precio | id_cliente | nombre     | direccion     |
+----------+------------+-------------+----------+-------------+-------------+--------+------------+------------+---------------+
|        1 |          1 |           1 |        2 |           1 | Producto 1  |     11 |          1 | Cliente 1  | Dirección 1   |
|        2 |          2 |           2 |        1 |           2 | Producto 2  |     21 |          2 | Cliente 2  | Dirección 2   |
|        3 |          3 |           3 |        3 |           3 | Producto 3  |     31 |          3 | Cliente 3  | Dirección 3   |
|        4 |          4 |           4 |        2 |           4 | Producto 4  |     41 |          4 | Cliente 4  | Dirección 4   |
|        5 |          5 |           5 |        1 |           5 | Producto 5  |     51 |          5 | Cliente 5  | Dirección 5   |
|        6 |          6 |           6 |        2 |           6 | Producto 6  |     61 |          6 | Cliente 6  | Dirección 6   |
|        7 |          7 |           7 |        3 |           7 | Producto 7  |     71 |          7 | Cliente 7  | Dirección 7   |
|        8 |          8 |           8 |        2 |           8 | Producto 8  |     81 |          8 | Cliente 8  | Dirección 8   |
|        9 |          9 |           9 |        1 |           9 | Producto 9  |     91 |          9 | Cliente 9  | Dirección 9   |
|       10 |         10 |          10 |        2 |          10 | Producto 10 |    101 |         10 | Cliente 10 | Dirección 10  |
|       11 |         11 |          11 |        3 |          11 | Producto 11 |    111 |         11 | Cliente 11 | Dirección 11  |
|       12 |         12 |          12 |        2 |          12 | Producto 12 |    121 |         12 | Cliente 12 | Dirección 12  |
|       13 |         13 |          13 |        1 |          13 | Producto 13 |    131 |         13 | Cliente 13 | Dirección 13  |
|       14 |         14 |          14 |        2 |          14 | Producto 14 |    141 |         14 | Cliente 14 | Dirección 14  |
|       15 |         15 |          15 |        3 |          15 | Producto 15 |    151 |         15 | Cliente 15 | Dirección 15  |
|       16 |         16 |          16 |        2 |          16 | Producto 16 |    161 |         16 | Cliente 16 | Dirección 16  |
|       17 |         17 |          17 |        1 |          17 | Producto 17 |    171 |         17 | Cliente 17 | Dirección 17  |
|       18 |         18 |          18 |        2 |          18 | Producto 18 |    181 |         18 | Cliente 18 | Dirección 18  |
|       19 |         19 |          19 |        3 |          19 | Producto 19 |    191 |         19 | Cliente 19 | Dirección 19  |
|       20 |         20 |          20 |        2 |          20 | Producto 20 |    201 |         20 | Cliente 20 | Dirección 20  |
+----------+------------+-------------+----------+-------------+-------------+--------+------------+------------+---------------+
20 rows in set (0,00 sec)
**/
