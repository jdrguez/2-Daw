## Paso 3: Responde a las siguientes cuestiones
Realiza el diagrama ER de la BBDD supermercado.
Realiza el diagrama MR de la BBDD supermercado.
Indica si la BBDD esta normalizada hasta la 3ª forma normal, justificando la respuesta.

## Paso 4: Responde a las siguientes cuestiones

Realiza las siguientes consultas, y muestra el resultado obtenido:
### 1 Mostrar todos los productos de la categoría "Bebidas".
```Sql
select nombre, categoria from productos where categoria='Bebidas';
┌──────────────────┬───────────┐
│      nombre      │ categoria │
├──────────────────┼───────────┤
│ Café             │ Bebidas   │
│ Botellas de Agua │ Bebidas   │
│ Cerveza          │ Bebidas   │
└──────────────────┴───────────┘
```

### 2 Listar los productos ordenados por precio de forma descendente.
```sql
SELECT id, nombre, categoria, precio FROM productos GROUP BY precio;
┌────┬─────────────────┬───────────┬────────┐
│ id │     nombre      │ categoria │ precio │
├────┼─────────────────┼───────────┼────────┤
│ 6  │ Huevos          │ Lácteos   │ 1.0    │
│ 3  │ Pan             │ Panadería │ 1.2    │
│ 11 │ Papel Higiénico │ Hogar     │ 1.5    │
│ 14 │ Galletas        │ Snacks    │ 1.7    │
│ 2  │ Leche           │ Lácteos   │ 1.8    │
│ 7  │ Yogurt          │ Lácteos   │ 2.0    │
│ 8  │ Tomates         │ Verduras  │ 2.2    │
│ 17 │ Sopa enlatada   │ Conservas │ 2.3    │
│ 1  │ Arroz           │ Alimentos │ 2.5    │
│ 13 │ Detergente      │ Limpieza  │ 2.8    │
│ 4  │ Manzanas        │ Frutas    │ 3.0    │
│ 10 │ Cereal          │ Desayuno  │ 3.5    │
│ 20 │ Cerveza         │ Bebidas   │ 3.8    │
│ 9  │ Queso           │ Lácteos   │ 4.0    │
│ 15 │ Aceite de Oliva │ Cocina    │ 4.5    │
│ 16 │ Café            │ Bebidas   │ 5.0    │
│ 5  │ Pollo           │ Carnes    │ 5.5    │
└────┴─────────────────┴───────────┴────────┘
```

### 3 Calcular el precio total de todos los productos en la tabla "productos".
```sql
SELECT SUM(precio) AS precio_total FROM productos;
┌──────────────┐
│ precio_total │
├──────────────┤
│ 52.5         │
└──────────────┘
```

### 4 Encontrar los productos con un nombre que contenga la letra 'a'.
```sql
SELECT id, nombre FROM productos WHERE (nombre LIKE '%a%');
┌────┬──────────────────┐
│ id │      nombre      │
├────┼──────────────────┤
│ 1  │ Arroz            │
│ 3  │ Pan              │
│ 4  │ Manzanas         │
│ 8  │ Tomates          │
│ 10 │ Cereal           │
│ 11 │ Papel Higiénico  │
│ 14 │ Galletas         │
│ 15 │ Aceite de Oliva  │
│ 16 │ Café             │
│ 17 │ Sopa enlatada    │
│ 18 │ Jabón de Baño    │
│ 19 │ Botellas de Agua │
│ 20 │ Cerveza          │
└────┴──────────────────┘
```
### 5 Obtener la cantidad total de productos vendidos en todas las fechas.
SELECT fecha, COUNT(id_producto) as total_ventas FROM ventas GROUP BY fecha ;
┌────────────┬──────────────┐
│   fecha    │ total_ventas │
├────────────┼──────────────┤
│ 2024-01-17 │ 4            │
│ 2024-01-18 │ 3            │
│ 2024-01-19 │ 2            │
│ 2024-01-20 │ 1            │
└────────────┴──────────────┘
### 6 Encontrar el producto más caro en cada categoría.
SELECT DISTINCT id, nombre, precio, categoria FROM productos GROUP BY categoria;
┌────┬────────────────────┬────────┬───────────┐
│ id │       nombre       │ precio │ categoria │
├────┼────────────────────┼────────┼───────────┤
│ 1  │ Arroz              │ 2.5    │ Alimentos │
│ 16 │ Café               │ 5.0    │ Bebidas   │
│ 5  │ Pollo              │ 5.5    │ Carnes    │
│ 15 │ Aceite de Oliva    │ 4.5    │ Cocina    │
│ 17 │ Sopa enlatada      │ 2.3    │ Conservas │
│ 10 │ Cereal             │ 3.5    │ Desayuno  │
│ 4  │ Manzanas           │ 3.0    │ Frutas    │
│ 12 │ Cepillo de Dientes │ 2.0    │ Higiene   │
│ 11 │ Papel Higiénico    │ 1.5    │ Hogar     │
│ 13 │ Detergente         │ 2.8    │ Limpieza  │
│ 2  │ Leche              │ 1.8    │ Lácteos   │
│ 3  │ Pan                │ 1.2    │ Panadería │
│ 14 │ Galletas           │ 1.7    │ Snacks    │
│ 8  │ Tomates            │ 2.2    │ Verduras  │
└────┴────────────────────┴────────┴───────────┘
### 7 Listar los productos que no han sido vendidos.



### 8 Calcular el precio promedio de los productos en la categoría "Snacks".

SELECT AVG(precio) FROM productos WHERE categoria='Snacks';
┌─────────────┐
│ AVG(precio) │
├─────────────┤
│ 1.7         │
└─────────────┘

### 9 Encontrar los productos que han sido vendidos más de 5 veces.

SELECT p.nombre, v.cantidad FROM productos as p, ventas as v WHERE p.id=v.id_producto AND v.cantidad >=5;
┌───────────────┬──────────┐
│    nombre     │ cantidad │
├───────────────┼──────────┤
│ Arroz         │ 5        │
│ Huevos        │ 10       │
│ Galletas      │ 7        │
│ Jabón de Baño │ 6        │
└───────────────┴──────────┘


### 10 Mostrar la fecha y la cantidad de ventas para cada producto.
SELECT p.nombre, v.cantidad, v.fecha FROM productos as p, ventas as v WHERE p.id = v.id_producto;
┌───────────────┬──────────┬────────────┐
│    nombre     │ cantidad │   fecha    │
├───────────────┼──────────┼────────────┤
│ Arroz         │ 5        │ 2024-01-17 │
│ Leche         │ 3        │ 2024-01-17 │
│ Manzanas      │ 2        │ 2024-01-17 │
│ Pollo         │ 1        │ 2024-01-17 │
│ Huevos        │ 10       │ 2024-01-18 │
│ Tomates       │ 4        │ 2024-01-18 │
│ Cereal        │ 2        │ 2024-01-18 │
│ Galletas      │ 7        │ 2024-01-19 │
│ Café          │ 3        │ 2024-01-19 │
│ Jabón de Baño │ 6        │ 2024-01-20 │
└───────────────┴──────────┴────────────┘

### 11 Encontrar los productos que tienen un precio menor o igual a 2.
SELECT id, nombre, precio FROM productos WHERE precio <= 2;
┌────┬────────────────────┬────────┐
│ id │       nombre       │ precio │
├────┼────────────────────┼────────┤
│ 2  │ Leche              │ 1.8    │
│ 3  │ Pan                │ 1.2    │
│ 6  │ Huevos             │ 1.0    │
│ 7  │ Yogurt             │ 2.0    │
│ 11 │ Papel Higiénico    │ 1.5    │
│ 12 │ Cepillo de Dientes │ 2.0    │
│ 14 │ Galletas           │ 1.7    │
│ 18 │ Jabón de Baño      │ 1.2    │
│ 19 │ Botellas de Agua   │ 1.0    │
└────┴────────────────────┴────────┘
### 12 Calcular la cantidad total de ventas para cada fecha.

SELECT DISTINCT fecha, SUM(cantidad) as total_ventas FROM ventas GROUP BY fecha; 
┌────────────┬──────────────┐
│   fecha    │ total_ventas │
├────────────┼──────────────┤
│ 2024-01-17 │ 11           │
│ 2024-01-18 │ 16           │
│ 2024-01-19 │ 10           │
│ 2024-01-20 │ 6            │
└────────────┴──────────────┘
sqlite> 
### 13 Listar los productos cuyo nombre comienza con la letra 'P'.
SELECT id, nombre FROM productos WHERE (nombre LIKE 'P%');
┌────┬─────────────────┐
│ id │     nombre      │
├────┼─────────────────┤
│ 3  │ Pan             │
│ 5  │ Pollo           │
│ 11 │ Papel Higiénico │
└────┴─────────────────┘
### 14 Obtener el producto más vendido en términos de cantidad.

SELECT p.nombre, MAX(v.cantidad) as producto_mas_vendido FROM productos as p, ventas as v WHERE p.id = v.id_producto; 
┌────────┬──────────────────────┐
│ nombre │ producto_mas_vendido │
├────────┼──────────────────────┤
│ Huevos │ 10                   │
└────────┴──────────────────────┘

### 15 Mostrar los productos que fueron vendidos en la fecha '2024-01-18'.
SELECT p.id, p.nombre, v.fecha FROM productos as p, ventas as v WHERE v.fecha = '2024-01-18' AND p.id = v.id_producto;
┌────┬─────────┬────────────┐
│ id │ nombre  │   fecha    │
├────┼─────────┼────────────┤
│ 6  │ Huevos  │ 2024-01-18 │
│ 8  │ Tomates │ 2024-01-18 │
│ 10 │ Cereal  │ 2024-01-18 │
└────┴─────────┴────────────┘

### 16 Calcular el total de ventas para cada producto.
SELECT p.id, nombre, v.cantidad from productos as p, ventas as v WHERE p.id = v.id_producto;
┌────┬───────────────┬──────────┐
│ id │    nombre     │ cantidad │
├────┼───────────────┼──────────┤
│ 1  │ Arroz         │ 5        │
│ 2  │ Leche         │ 3        │
│ 4  │ Manzanas      │ 2        │
│ 5  │ Pollo         │ 1        │
│ 6  │ Huevos        │ 10       │
│ 8  │ Tomates       │ 4        │
│ 10 │ Cereal        │ 2        │
│ 14 │ Galletas      │ 7        │
│ 16 │ Café          │ 3        │
│ 18 │ Jabón de Baño │ 6        │
└────┴───────────────┴──────────┘

### 17 Encontrar los productos con un precio entre 3 y 4.

SELECT * from productos WHERE precio BETWEEN 3 and 4;
┌────┬──────────┬───────────┬────────┐
│ id │  nombre  │ categoria │ precio │
├────┼──────────┼───────────┼────────┤
│ 4  │ Manzanas │ Frutas    │ 3.0    │
│ 9  │ Queso    │ Lácteos   │ 4.0    │
│ 10 │ Cereal   │ Desayuno  │ 3.5    │
│ 20 │ Cerveza  │ Bebidas   │ 3.8    │
└────┴──────────┴───────────┴────────┘
### 18 Listar los productos y sus categorías ordenados alfabéticamente por categoría.
SELECT * FROM productos GROUP BY categoria;
┌────┬────────────────────┬───────────┬────────┐
│ id │       nombre       │ categoria │ precio │
├────┼────────────────────┼───────────┼────────┤
│ 1  │ Arroz              │ Alimentos │ 2.5    │
│ 16 │ Café               │ Bebidas   │ 5.0    │
│ 5  │ Pollo              │ Carnes    │ 5.5    │
│ 15 │ Aceite de Oliva    │ Cocina    │ 4.5    │
│ 17 │ Sopa enlatada      │ Conservas │ 2.3    │
│ 10 │ Cereal             │ Desayuno  │ 3.5    │
│ 4  │ Manzanas           │ Frutas    │ 3.0    │
│ 12 │ Cepillo de Dientes │ Higiene   │ 2.0    │
│ 11 │ Papel Higiénico    │ Hogar     │ 1.5    │
│ 13 │ Detergente         │ Limpieza  │ 2.8    │
│ 2  │ Leche              │ Lácteos   │ 1.8    │
│ 3  │ Pan                │ Panadería │ 1.2    │
│ 14 │ Galletas           │ Snacks    │ 1.7    │
│ 8  │ Tomates            │ Verduras  │ 2.2    │
└────┴────────────────────┴───────────┴────────┘

### 19 Calcular el precio total de los productos vendidos en la fecha '2024-01-19'.
SELECT v.fecha, SUM(p.precio) as precio_total FROM productos as p, ventas as v WHERE v.fecha='2024-01-19' AND p.id = v.id_producto;
┌────────────┬──────────────┐
│   fecha    │ precio_total │
├────────────┼──────────────┤
│ 2024-01-19 │ 6.7          │
└────────────┴──────────────┘

### 20 Mostrar los productos que no pertenecen a la categoría "Higiene".

SELECT * FROM productos WHERE categoria != 'Higiene';
┌────┬──────────────────┬───────────┬────────┐
│ id │      nombre      │ categoria │ precio │
├────┼──────────────────┼───────────┼────────┤
│ 1  │ Arroz            │ Alimentos │ 2.5    │
│ 2  │ Leche            │ Lácteos   │ 1.8    │
│ 3  │ Pan              │ Panadería │ 1.2    │
│ 4  │ Manzanas         │ Frutas    │ 3.0    │
│ 5  │ Pollo            │ Carnes    │ 5.5    │
│ 6  │ Huevos           │ Lácteos   │ 1.0    │
│ 7  │ Yogurt           │ Lácteos   │ 2.0    │
│ 8  │ Tomates          │ Verduras  │ 2.2    │
│ 9  │ Queso            │ Lácteos   │ 4.0    │
│ 10 │ Cereal           │ Desayuno  │ 3.5    │
│ 11 │ Papel Higiénico  │ Hogar     │ 1.5    │
│ 13 │ Detergente       │ Limpieza  │ 2.8    │
│ 14 │ Galletas         │ Snacks    │ 1.7    │
│ 15 │ Aceite de Oliva  │ Cocina    │ 4.5    │
│ 16 │ Café             │ Bebidas   │ 5.0    │
│ 17 │ Sopa enlatada    │ Conservas │ 2.3    │
│ 19 │ Botellas de Agua │ Bebidas   │ 1.0    │
│ 20 │ Cerveza          │ Bebidas   │ 3.8    │
└────┴──────────────────┴───────────┴────────┘


### 21 Encontrar la cantidad total de productos en cada categoría.



### 22 Listar los productos que tienen un precio igual a la media de precios.


### 23 Calcular el precio total de los productos vendidos en cada fecha.
### 24 Mostrar los productos con un nombre que termina con la letra 'o'.

SELECT * FROM productos WHERE (nombre LIKE '%o');
┌────┬─────────────────┬───────────┬────────┐
│ id │     nombre      │ categoria │ precio │
├────┼─────────────────┼───────────┼────────┤
│ 5  │ Pollo           │ Carnes    │ 5.5    │
│ 9  │ Queso           │ Lácteos   │ 4.0    │
│ 11 │ Papel Higiénico │ Hogar     │ 1.5    │
│ 18 │ Jabón de Baño   │ Higiene   │ 1.2    │
└────┴─────────────────┴───────────┴────────┘
### 25 Encontrar los productos que han sido vendidos en más de una fecha.

### 26 Listar los productos cuya categoría comienza con la letra 'L'.
SELECT * FROM productos WHERE (categoria LIKE 'L%');
┌────┬────────────┬───────────┬────────┐
│ id │   nombre   │ categoria │ precio │
├────┼────────────┼───────────┼────────┤
│ 2  │ Leche      │ Lácteos   │ 1.8    │
│ 6  │ Huevos     │ Lácteos   │ 1.0    │
│ 7  │ Yogurt     │ Lácteos   │ 2.0    │
│ 9  │ Queso      │ Lácteos   │ 4.0    │
│ 13 │ Detergente │ Limpieza  │ 2.8    │
└────┴────────────┴───────────┴────────┘

### 27 Calcular el total de ventas para cada producto en la fecha '2024-01-17'.


### 28 Mostrar los productos cuyo nombre tiene al menos 5 caracteres.
SELECT * FROM productos WHERE LENGTH(nombre) >= 5;
┌────┬────────────────────┬───────────┬────────┐
│ id │       nombre       │ categoria │ precio │
├────┼────────────────────┼───────────┼────────┤
│ 1  │ Arroz              │ Alimentos │ 2.5    │
│ 2  │ Leche              │ Lácteos   │ 1.8    │
│ 4  │ Manzanas           │ Frutas    │ 3.0    │
│ 5  │ Pollo              │ Carnes    │ 5.5    │
│ 6  │ Huevos             │ Lácteos   │ 1.0    │
│ 7  │ Yogurt             │ Lácteos   │ 2.0    │
│ 8  │ Tomates            │ Verduras  │ 2.2    │
│ 9  │ Queso              │ Lácteos   │ 4.0    │
│ 10 │ Cereal             │ Desayuno  │ 3.5    │
│ 11 │ Papel Higiénico    │ Hogar     │ 1.5    │
│ 12 │ Cepillo de Dientes │ Higiene   │ 2.0    │
│ 13 │ Detergente         │ Limpieza  │ 2.8    │
│ 14 │ Galletas           │ Snacks    │ 1.7    │
│ 15 │ Aceite de Oliva    │ Cocina    │ 4.5    │
│ 17 │ Sopa enlatada      │ Conservas │ 2.3    │
│ 18 │ Jabón de Baño      │ Higiene   │ 1.2    │
│ 19 │ Botellas de Agua   │ Bebidas   │ 1.0    │
│ 20 │ Cerveza            │ Bebidas   │ 3.8    │
└────┴────────────────────┴───────────┴────────┘
### 29 Encontrar los productos que tienen un precio superior a la media en la tabla "productos".
SELECT * from productos as p  WHERE p.precio > (SELECT AVG(precio) as precio_media FROM productos);
┌────┬─────────────────┬───────────┬────────┐
│ id │     nombre      │ categoria │ precio │
├────┼─────────────────┼───────────┼────────┤
│ 4  │ Manzanas        │ Frutas    │ 3.0    │
│ 5  │ Pollo           │ Carnes    │ 5.5    │
│ 9  │ Queso           │ Lácteos   │ 4.0    │
│ 10 │ Cereal          │ Desayuno  │ 3.5    │
│ 13 │ Detergente      │ Limpieza  │ 2.8    │
│ 15 │ Aceite de Oliva │ Cocina    │ 4.5    │
│ 16 │ Café            │ Bebidas   │ 5.0    │
│ 20 │ Cerveza         │ Bebidas   │ 3.8    │
└────┴─────────────────┴───────────┴────────┘