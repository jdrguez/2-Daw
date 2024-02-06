-- Listar los coches vendidos con sus modelos y precios, junto con los nombres de los clientes que los compraron.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. ¿Qué es lo que no me han pedido?

SELECT c.marca, c.precio, cli.nombre FROM coches as c, clientes as cli, ventas as v WHERE v.id_coche=c.id_coche AND v.id_cliente=cli.id_cliente;
/** Obtenido
┌────────────┬─────────┬─────────────────┐
│   marca    │ precio  │     nombre      │
├────────────┼─────────┼─────────────────┤
│ Toyota     │ 25000.0 │ Juan Pérez      │
│ Honda      │ 22000.0 │ María Gómez     │
│ Ford       │ 30000.0 │ Carlos López    │
│ Chevrolet  │ 28000.0 │ Ana Martínez    │
│ Nissan     │ 32000.0 │ Pedro Rodríguez │
│ Volkswagen │ 20000.0 │ Laura Sánchez   │
│ Hyundai    │ 27000.0 │ Miguel González │
│ Mazda      │ 35000.0 │ Isabel Díaz     │
│ Tesla      │ 40000.0 │ Elena Torres    │
└────────────┴─────────┴─────────────────┘
**/

-- Encontrar los clientes que han comprado coches con precios superiores al promedio de todos los coches vendidos.
  -- Cosas que debo de tener en cuenta:
    -- Precios superiores.
    -- Obtener la media. AVG(precio)
-- Consulta:
SELECT nombre,c.modelo, c.precio from clientes as cli, coches as c, ventas as v WHERE c.precio >(SELECT AVG(precio) from coches) AND v.id_coche=c.id_coche AND v.id_cliente=cli.id
_cliente; 
/** Obtenido
┌─────────────────┬────────────────┬─────────┐
│     nombre      │     modelo     │ precio  │
├─────────────────┼────────────────┼─────────┤
│ Carlos López    │ SUV 2023       │ 30000.0 │
│ Pedro Rodríguez │ Camioneta 2023 │ 32000.0 │
│ Isabel Díaz     │ Deportivo 2023 │ 35000.0 │
│ Elena Torres    │ Eléctrico 2021 │ 40000.0 │
└─────────────────┴────────────────┴─────────┘
**/

-- Mostrar los modelos de coches y sus precios que no han sido vendidos aún:
  -- Cosas que debo de tener en cuenta:
    -- Coches que han sido vendidos.
    -- Quiero los coches que no han sido vendidos. NOT id_coche IN ventas


SELECT c.modelo, c.precio FROM coches as c WHERE c.id_coche not in (SELECT v.id_coche FROM ventas as v, coches as c WHERE v.id_coche=c.id_coche);
/** Obtenido
┌─────────────┬─────────┐
│   modelo    │ precio  │
├─────────────┼─────────┤
│ Pickup 2022 │ 31000.0 │
└─────────────┴─────────┘
**/



-- Calcular el total gastado por todos los clientes en coches:
  -- Cosas que debo de tener en cuenta:
    -- Me estan pidiendo la suma total de todos los coches vendidos, NO de aquellos que aún no se han vendido.

SELECT SUM(c.precio) as total_comprado FROM coches as c, ventas as v, clientes as cli WHERE v.id_coche=c.id_coche AND v.id_cliente=cli.id_cliente;  
/** Obtenido
┌────────────────┐
│ total_comprado │
├────────────────┤
│ 259000.0       │
└────────────────┘
**/

-- Listar los coches vendidos junto con la fecha de venta y el nombre del cliente, ordenados por fecha de venta de forma descendente:
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. ¿Por qué campo tengo que ordenadar. Es uno o más campos?


SELECT c.marca, c.precio, cli.nombre, v.fecha_venta FROM coches as c, clientes as cli, ventas as v WHERE v.id_coche=c.id_coche AND v.id_cliente=cli.id_cliente ORDER BY v.fecha_ve
nta;
/** Obtenido
┌────────────┬─────────┬─────────────────┬─────────────┐
│   marca    │ precio  │     nombre      │ fecha_venta │
├────────────┼─────────┼─────────────────┼─────────────┤
│ Toyota     │ 25000.0 │ Juan Pérez      │ 2023-01-15  │
│ Honda      │ 22000.0 │ María Gómez     │ 2023-02-20  │
│ Ford       │ 30000.0 │ Carlos López    │ 2023-03-25  │
│ Chevrolet  │ 28000.0 │ Ana Martínez    │ 2023-04-10  │
│ Nissan     │ 32000.0 │ Pedro Rodríguez │ 2023-05-05  │
│ Volkswagen │ 20000.0 │ Laura Sánchez   │ 2023-06-15  │
│ Hyundai    │ 27000.0 │ Miguel González │ 2023-07-20  │
│ Mazda      │ 35000.0 │ Isabel Díaz     │ 2023-08-25  │
│ Tesla      │ 40000.0 │ Elena Torres    │ 2023-10-05  │
└────────────┴─────────┴─────────────────┴─────────────┘
**/

-- Encontrar el modelo de coche más caro.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. MAX
  
SELECT modelo, max(precio) as coche_mas_caro FROM coches;
/**
┌────────────────┬────────────────┐
│     modelo     │ coche_mas_caro │
├────────────────┼────────────────┤
│ Eléctrico 2021 │ 40000.0        │
└────────────────┴────────────────┘
**/


-- Mostrar los clientes que han comprado al menos un coche (un coche o más) y la cantidad de coches comprados.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. COUNT

SELECT  c.nombre,COUNT(v.id_coche) as cantidad_comprada from clientes as c, ventas as v WHERE c.id_cliente=v.id_cliente GROUP BY c.id_cliente, c.nombre HAVING COUNT(v.id_coche) >=1;
/**
┌─────────────────┬───────────────────┐
│     nombre      │ cantidad_comprada │
├─────────────────┼───────────────────┤
│ Juan Pérez      │ 1                 │
│ María Gómez     │ 1                 │
│ Carlos López    │ 1                 │
│ Ana Martínez    │ 1                 │
│ Pedro Rodríguez │ 1                 │
│ Laura Sánchez   │ 1                 │
│ Miguel González │ 1                 │
│ Isabel Díaz     │ 1                 │
│ Elena Torres    │ 1                 │
└─────────────────┴───────────────────┘
**/

-- Encontrar los clientes que han comprado coches de la marca 'Toyota':
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. Like | regexp | =. Tabla normalizada ?.
SELECT cli.nombre, c.modelo FROM clientes as cli, coches as c, ventas as v WHERE v.id_coche=c.id_coche AND v.id_cliente=cli.id_cliente AND c.modelo REGEXP 'Toyota';
-- No se obtuvo resultado

-- Calcular el promedio de edad de los clientes que han comprado coches de más de 25,000.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. 


SELECT AVG(cli.edad) as promedio_edad FROM clientes as cli, coches as c, ventas as v WHERE v.id_coche=c.id_coche AND v.id_cliente=cli.id_cliente AND c.precio > (SELECT precio from coches where precio >= 25000);
/**
┌──────────────────┐
│  promedio_edad   │
├──────────────────┤
│ 32.8333333333333 │
└──────────────────┘
**/

-- Mostrar los modelos de coches y sus precios que fueron comprados por clientes mayores de 30 años.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?.

select c.modelo, c.precio FROM coches as c, clientes as cli, ventas as v WHERE v.id_cliente=cli.id_cliente AND v.id_coche=c.id_coche AND cli.edad >30;
/**
┌────────────────┬─────────┐
│     modelo     │ precio  │
├────────────────┼─────────┤
│ SUV 2023       │ 30000.0 │
│ Camioneta 2023 │ 32000.0 │
│ Compacto 2021  │ 20000.0 │
│ Deportivo 2023 │ 35000.0 │
└────────────────┴─────────┘
**/

-- Encontrar los coches vendidos en el año 2022 junto con la cantidad total de ventas en ese año.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?.

select c.modelo, c.precio, COUNT(v.id_coche) as cantidad_ventas FROM coches as c, ventas as v WHERE v.id_coche=c.id_coche AND v.fecha_venta regexp '2022' GROUP BY c.id_coche ;

--No se obtuvo resultado

-- Listar los coches cuyos precios son mayores que el precio promedio de coches vendidos a clientes menores de 30 años.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. AVG

select c.modelo FROM coches as c, clientes as cli, ventas as v WHERE v.id_coche=c.id_coche AND v.id_cliente=cli.id_cliente AND c.precio > (SELECT AVG(precio) from coches as c, clientes as cli, ventas as v WHERE v.id_coche=c.id_coche AND v.id_cliente=cli.id_cliente AND cli.edad <=30);

/**
┌────────────────┐
│     modelo     │
├────────────────┤
│ SUV 2023       │
│ Camioneta 2023 │
│ Deportivo 2023 │
│ Eléctrico 2021 │
└────────────────┘
**/

-- Calcular el total de ventas por marca de coche, ordenado de forma descendente por el total de ventas:
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. COUNT| DESC|ASC precio
SELECT c.modelo, COUNT(c.id_coche) as total_ventas FROM coches as c, ventas as v WHERE v.id_coche=c.id_coche GROUP BY c.modelo ORDER BY total_ventas DESC;
/**
┌────────────────┬──────────────┐
│     modelo     │ total_ventas │
├────────────────┼──────────────┤
│ Sedán 2022     │ 1            │
│ SUV 2023       │ 1            │
│ Híbrido 2022   │ 1            │
│ Hatchback 2021 │ 1            │
│ Eléctrico 2021 │ 1            │
│ Deportivo 2023 │ 1            │
│ Coupé 2022     │ 1            │
│ Compacto 2021  │ 1            │
│ Camioneta 2023 │ 1            │
└────────────────┴──────────────┘
**/