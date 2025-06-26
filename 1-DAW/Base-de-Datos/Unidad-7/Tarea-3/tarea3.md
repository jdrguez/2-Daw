# Tarea 3 sobre índices.
## Crea una base de datos que tendrá por nombre Base_Indices.
```sql
DROP DATABASE if exists Base_indices;
CREATE DATABASE Base_indices;
Query OK, 0 rows affected, 1 warning (0,00 sec)
USE Base_indices;
Database changed
```

### Crea una tabla en la BD crea una tabla de nombre MOVIMIENTO con la siguiente estructura:
Nombre del campo 	Tipo de dato 	Propiedades
Identificador 	int 	AUTO_INCREMENT, Clave primaria (PK_MOVIMIENTO)
Articulo 	varchar(50) 	Obligatorio
Fecha 	date 	Obligatorio
Cantidad 	int 	Obligatorio

Aplica la sentencia adecuada para visualizar los índices que hay en la tabla.

```sql

DROP TABLE if exists MOVIMIENTO;

CREATE TABLE MOVIMIENTO(
    Identificador INT AUTO_INCREMENT PRIMARY KEY,
    Articulo VARCHAR(50) NOT NULL,
    Fecha DATE NOT NULL,
    Cantidad INT NOT NULL);

describe MOVIMIENTO;
+---------------+-------------+------+-----+---------+----------------+
| Field         | Type        | Null | Key | Default | Extra          |
+---------------+-------------+------+-----+---------+----------------+
| Identificador | int         | NO   | PRI | NULL    | auto_increment |
| Articulo      | varchar(50) | NO   |     | NULL    |                |
| Fecha         | date        | NO   |     | NULL    |                |
| Cantidad      | int         | NO   |     | NULL    |                |
+---------------+-------------+------+-----+---------+----------------+
4 rows in set (0,01 sec)

```

## Scrip de Automatización
```sql
CREATE TABLE NumerosUnicos (
Numero INT AUTO_INCREMENT PRIMARY KEY
);

INSERT INTO NumerosUnicos (Numero)
SELECT NULL FROM INFORMATION_SCHEMA.COLUMNS LIMIT 5000;

INSERT INTO MOVIMIENTO (Identificador, Articulo, Fecha, Cantidad)
SELECT 
    n.Numero,
    CONCAT('Producto', n.Numero),
    DATE_ADD('2012-01-01', INTERVAL FLOOR(RAND() * 120) DAY),
    FLOOR(RAND() * 1000000) + 1
FROM 
    NumerosUnicos n;

    DROP TABLE NumerosUnicos;
```
> Nota: Muestra el resultado y razona la respueta. Ejecuta un count sobre la tabla.
```sql
SELECT COUNT(Identificador) as total from MOVIMIENTO;
+-------+
| total |
+-------+
|  3561 |
+-------+
1 row in set (0,01 sec)
```

## Crea con la sentencia CREATE TABLE…SELECT… un duplicado de la tabla MOVIMIENTO a la que llamaremos MOVIMIENTO_BIS.
```sql
create table MOVIMIENTO_BIS select * from MOVIMIENTO;
Query OK, 3561 rows affected (0,28 sec)
Records: 3561  Duplicates: 0  Warnings: 0
```


## Con la cláusula DESCRIBE observa cuál es la situación de la tabla clonada, ¿Qué le pasa al índice y a la propiedad AUTO_INCREMENT?
```sql
describe MOVIMIENTO_BIS;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| Identificador | int         | NO   |     | 0       |       |
| Articulo      | varchar(50) | NO   |     | NULL    |       |
| Fecha         | date        | NO   |     | NULL    |       |
| Cantidad      | int         | NO   |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
4 rows in set (0,00 sec)
```

## Utilizando EXPLAIN observa el plan de ejecución de la consulta que devuelve toda la información de los movimientos con identificador=3. Tanto en la tabla MOVIMIENTOS como en la tabla MOVIMIENTOS_bis. Escribe tus conclusiones al respecto.
```sql
EXPLAIN SELECT * from MOVIMIENTO where Identificador=3;
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
| id | select_type | table      | partitions | type  | possible_keys | key     | key_len | ref   | rows | filtered | Extra |
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | MOVIMIENTO | NULL       | const | PRIMARY       | PRIMARY | 4       | const |    1 |   100.00 | NULL  |
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
1 row in set, 1 warning (0,00 sec)
```
```sql
EXPLAIN SELECT * from MOVIMIENTO_BIS where Identificador=3;
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table          | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO_BIS | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 3561 |    10.00 | Using where |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
1 row in set, 1 warning (0,01 sec)
```

## Analiza el plan de ejecución de las siguientes consultas y observa la diferencia: Consulta1
```sql
select * from MOVIMIENTO_BIS where identificador=3;
--resultado
+---------------+-----------+------------+----------+
| Identificador | Articulo  | Fecha      | Cantidad |
+---------------+-----------+------------+----------+
|             3 | Producto3 | 2012-04-20 |   776144 |
+---------------+-----------+------------+----------+
1 row in set (0,02 sec)
```
Consulta 2:

```sql
select identificador from MOVIMIENTO_BIS where identificador=3;
--resultado
+---------------+
| identificador |
+---------------+
|             3 |
+---------------+
1 row in set (0,02 sec)
```

### Fíjata en que en la consulta 1 pedimos todos los campos. ¿A través de que indice se busca? ¿Por qué crees que lo hace así? En la consulta 2 solo pedimos el identificador. ¿A través de que índice busca? ¿Por qué crees que lo hace así? Analiza la ejecución.

#### ¿A través de que indice se busca?
Realmento ninguno, pues no tiene. Se encarga de buscar uno por uno hasta que case con la petición del SELECT.
#### ¿Por qué crees que lo hace así?
Al no disponer de un índice el motor no sabe hasta donde tiene que parar por lo que tendrá que analizar toda la base de datos para buscar la solución al problema.



## Cuestión 2

### Analiza el plan de ejecución de las siguientes consultas y observa la diferencia:

Consulta 1:
```sql
EXPLAIN SELECT fecha FROM MOVIMIENTO WHERE fecha BETWEEN '01/01/2012' and '01/03/2012';
--resultado
+----+-------------+------------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table      | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+------------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 3561 |    11.11 | Using where |
+----+-------------+------------+------------+------+---------------+------+---------+------+------+----------+-------------+
1 row in set, 1 warning (0,00 sec)
```
Consulta 2
```sql
EXPLAIN SELECT * FROM MOVIMIENTO_BIS WHERE fecha BETWEEN '01/01/2012' and '01/03/2012';
--resultado
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table          | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO_BIS | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 3561 |    11.11 | Using where |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
1 row in set, 1 warning (0,00 sec)

```
#### Vamos a crear un índice por fecha (IX_FECHA) en la tabla MOVIMIENTO, puesto que no lo tenía, en este caso la tabla ya tenía un indice, la clave primaria.

```sql
CREATE INDEX ifecha on MOVIMIENTO(Fecha);
Query OK, 0 rows affected (0,14 sec)
Records: 0  Duplicates: 0  Warnings: 0
```
> Veamos los índices de las tablas MOVIMIENTO Y MOVIMIENTO_BIS
```sql
SHOW INDEX FROM MOVIMIENTO;
--RESULTADO
+------------+------------+----------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table      | Non_unique | Key_name | Seq_in_index | Column_name   | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+------------+------------+----------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| MOVIMIENTO |          0 | PRIMARY  |            1 | Identificador | A         |        3561 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| MOVIMIENTO |          1 | ifecha   |            1 | Fecha         | A         |         120 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+------------+------------+----------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
2 rows in set (0,02 sec)
```
```sql
SHOW INDEX FROM MOVIMIENTO_BIS;
--RESULTADO
Empty set (0,01 sec)
```
## Ver la siguiente consulta 3

```sql
EXPLAIN SELECT * FROM MOVIMIENTO WHERE fecha BETWEEN '01/01/2012' AND '01/03/2012';
--RESULTADO
+----+-------------+------------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table      | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+------------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO | NULL       | ALL  | ifecha        | NULL | NULL    | NULL | 3561 |    11.11 | Using where |
+----+-------------+------------+------------+------+---------------+------+---------+------+------+----------+-------------+
1 row in set, 2 warnings (0,00 sec)
```

```sql
EXPLAIN SELECT fecha FROM MOVIMIENTO WHERE fecha BETWEEN '01/01/2012' AND '01/03/2012';
--RESULTADO
+----+-------------+------------+------------+-------+---------------+--------+---------+------+------+----------+--------------------------+
| id | select_type | table      | partitions | type  | possible_keys | key    | key_len | ref  | rows | filtered | Extra                    |
+----+-------------+------------+------------+-------+---------------+--------+---------+------+------+----------+--------------------------+
|  1 | SIMPLE      | MOVIMIENTO | NULL       | index | ifecha        | ifecha | 3       | NULL | 3561 |    11.11 | Using where; Using index |
+----+-------------+------------+------------+-------+---------------+--------+---------+------+------+----------+--------------------------+
1 row in set, 2 warnings (0,00 sec)
```

>Segunda Tabla

```sql

EXPLAIN SELECT * FROM MOVIMIENTO_BIS WHERE fecha BETWEEN '01/01/2012' AND '01/03/2012';
--RESULTADO
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table          | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO_BIS | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 3561 |    11.11 | Using where |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
1 row in set, 1 warning (0,00 sec)

```

```sql
EXPLAIN SELECT fecha FROM MOVIMIENTO_BIS WHERE fecha BETWEEN '01/01/2012' AND '01/03/2012';
--RESULTADO
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table          | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO_BIS | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 3561 |    11.11 | Using where |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
1 row in set, 1 warning (0,01 sec)

```

>Segunda Tabla
```sql
EXPLAIN SELECT fecha FROM MOVIMIENTO_BIS WHERE fecha BETWEEN '01/01/2012' AND '01/03/2012';
--RESULTADO
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table          | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO_BIS | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 3561 |    11.11 | Using where |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
1 row in set, 1 warning (0,00 sec)
```
# Conclusión

Podemos observar la importancia de los índices, vemos que solo se centra en las 3 que cazan con los BETWEEN en la consulta con el SELECT de Fecha en la Tabla Movimiento.

Al ver la siguiente consulta sobre la tabla MOVIMIENTO_BIS no tiene índices a los que atacar y tiene que recorrer toda la tabla para buscar la información pues
no tiene el límite necesario.

Además podemos observar que cuando usamos el * recorre todas las entradas por el simple hecho de que pides todo, cuando justificas la columnas está va más rápido al casar antes con los índices.
