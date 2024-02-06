-- Consulta para obtener el nombre y la edad de los clientes que han comprado coches de la marca Toyota.

SELECT cli.nombre, cli.edad FROM clientes as cli, ventas as v, coches as c WHERE v.id_cliente=cli.id_cliente AND v.id_coche=c.id_coche AND c.marca='Toyota';
/**
┌────────────┬──────┐
│   nombre   │ edad │
├────────────┼──────┤
│ Juan Pérez │ 30   │
└────────────┴──────┘
**/
-- Consulta para calcular el precio promedio de los coches vendidos.

SELECT AVG(c.precio) as promedio FROM coches as c, ventas as v 
   ...> WHERE v.id_coche=c.id_coche;
/**
┌──────────────────┐
│     promedio     │
├──────────────────┤
│ 28777.7777777778 │
└──────────────────┘
**/

-- Consulta para obtener el modelo y la marca de los coches vendidos a clientes menores de 30 años.

SELECT c.modelo, c.marca FROM clientes as cli, ventas as v, coches as c
   ...> WHERE v.id_cliente=cli.id_cliente AND v.id_coche=c.id_coche
   ...> AND cli.edad < 30;
/**
┌────────────────┬───────────┐
│     modelo     │   marca   │
├────────────────┼───────────┤
│ Hatchback 2021 │ Honda     │
│ Coupé 2022     │ Chevrolet │
│ Híbrido 2022   │ Hyundai   │
│ Eléctrico 2021 │ Tesla     │
└────────────────┴───────────┘
**/


-- Consulta para contar el número de coches vendidos de cada marca.

 SELECT c.marca, COUNT(c.marca) FROM clientes as cli, ventas as v, coches as c
   ...> WHERE v.id_cliente=cli.id_cliente AND v.id_coche=c.id_coche
   ...> GROUP BY c.marca;
/**
┌────────────┬────────────────┐
│   marca    │ COUNT(c.marca) │
├────────────┼────────────────┤
│ Chevrolet  │ 1              │
│ Ford       │ 1              │
│ Honda      │ 1              │
│ Hyundai    │ 1              │
│ Mazda      │ 1              │
│ Nissan     │ 1              │
│ Tesla      │ 1              │
│ Toyota     │ 1              │
│ Volkswagen │ 1              │
└────────────┴────────────────┘
**/

-- Consulta para obtener el nombre y la dirección de los clientes que han llevado a reparar sus coches en 2024.

SELECT cli.nombre, cli.direccion FROM clientes as cli, reparacion  as r, coches as c
   ...> WHERE r.id_cliente=cli.id_cliente AND r.id_coche=c.id_coche
   ...> AND r.fecha_reparación REGEXP '2024';
/**
┌─────────────────┬────────────────┐
│     nombre      │   direccion    │
├─────────────────┼────────────────┤
│ Francisco Ruiz  │ Calle I #222   │
│ Elena Torres    │ Avenida J #333 │
│ Juan Pérez      │ Calle A #123   │
│ María Gómez     │ Avenida B #456 │
│ Carlos López    │ Calle C #789   │
│ Ana Martínez    │ Avenida D #101 │
│ Pedro Rodríguez │ Calle E #234   │
│ Laura Sánchez   │ Avenida F #567 │
│ Miguel González │ Calle G #890   │
│ Isabel Díaz     │ Avenida H #111 │
│ Francisco Ruiz  │ Calle I #222   │
│ Elena Torres    │ Avenida J #333 │
└─────────────────┴────────────────┘
**/

-- Consulta para calcular el total gastado en reparaciones por cada cliente.

???

-- Consulta para obtener el nombre y la edad de los clientes que han comprado coches de más de 30000 euros.

SELECT cli.nombre, cli.edad FROM clientes as cli, ventas as v, coches as c
   ...> WHERE v.id_cliente=cli.id_cliente AND v.id_coche=c.id_coche
   ...> AND c.precio > 30000;
/**
┌─────────────────┬──────┐
│     nombre      │ edad │
├─────────────────┼──────┤
│ Pedro Rodríguez │ 40   │
│ Isabel Díaz     │ 38   │
│ Elena Torres    │ 29   │
└─────────────────┴──────┘
**/

-- Consulta para calcular el precio medio de los coches vendidos en 2023.


SELECT AVG(c.precio) as promedio_2023 FROM clientes as cli, ventas as v, coches as c
   ...> WHERE v.id_cliente=cli.id_cliente AND v.id_coche=c.id_coche
   ...> AND v.fecha_venta REGEXP '2023';
/**
┌──────────────────┐
│  promedio_2023   │
├──────────────────┤
│ 28777.7777777778 │
└──────────────────┘
**/

-- Consulta para obtener el nombre y la dirección de los clientes que han comprado coches de la marca Ford.

SELECT cli.nombre, cli.direccion FROM clientes as cli, ventas as v, coches as c
   ...> WHERE v.id_cliente=cli.id_cliente AND v.id_coche=c.id_coche
   ...> AND c.marca = 'Ford';
/**
┌──────────────┬──────────────┐
│    nombre    │  direccion   │
├──────────────┼──────────────┤
│ Carlos López │ Calle C #789 │
└──────────────┴──────────────┘
**/

-- Consulta para contar el número de coches vendidos por año.




-- Consulta para obtener el nombre y la edad de los clientes que han comprado coches de más de 30000 euros y llevado a reparar sus coches.

SELECT cli.nombre, cli.edad FROM clientes as cli, ventas as v, coches as c, reparacion as r
   ...> WHERE v.id_cliente=cli.id_cliente AND v.id_coche=c.id_coche AND r.id_cliente=cli.id_cliente AND r.id_coche=c.id_coche
   ...> AND c.precio > 30000;

/**
┌──────────────┬──────┐
│    nombre    │ edad │
├──────────────┼──────┤
│ Isabel Díaz  │ 38   │
│ Elena Torres │ 29   │
└──────────────┴──────┘
**/

-- Consulta para calcular el precio total de los coches vendidos a clientes menores de 30 años.


SELECT SUM(c.precio) as precio_total FROM clientes as cli, ventas as v, coches as c
   ...> WHERE v.id_cliente=cli.id_cliente AND v.id_coche=c.id_coche
   ...> AND cli.edad < 30;
/**
┌──────────────┐
│ precio_total │
├──────────────┤
│ 117000.0     │
└──────────────
**/

-- Consulta para obtener el modelo y el año de los coches vendidos en 2023 y llevados a reparar.



-- Consulta para contar el número de coches vendidos por cliente.

-- Consulta para obtener el nombre y el precio de los coches vendidos a clientes mayores de 35 años.

-- Consulta para calcular el precio total de los coches vendidos a clientes que viven en una calle (en la dirección).

-- Consulta para obtener el nombre y la dirección de los clientes que han comprado coches de más de 30000 euros y llevado a reparar sus coches en 2024.

-- Consulta para calcular el precio medio de los coches vendidos en 2023 y llevados a reparar por clientes menores de 30 años.

-- Consulta para obtener el modelo y el año de los coches vendidos por clientes que tienen una dirección que contiene la palabra "Avenida".

-- Consulta para contar el número de reparaciones realizadas en 2024 por cada cliente.
