
# Tarea 2 Índices 


Una empresa guarda los siguientes datos de sus clientes, con los siguientes campos:

    documento char (8) not null,
    nombre varchar(30) not null,
    domicilio varchar(30),
    ciudad varchar(20),
    provincia varchar (20),
    telefono varchar(11)

## Se pide:

## Elimine la tabla "cliente" si existe.

- Nota:Muestra el comando y la salida.

 ```sql
 DROP TABLE IF EXISTS cliente;
 Query OK, 0 rows affected, 1 warning (0,00 sec)
```
## Cree la tabla si clave primaria y incluye a posteriori esta.

- Nota:Muestra el comando y la salida.
```sql
CREATE TABLE cliente (
	documento CHAR(8) NOT NULL,
	nombre VARCHAR(30) NOT NULL,
	domicilio VARCHAR(30),
	ciudad VARCHAR(20),
	telefono VARCHAR(11), 
	provincia VARCHAR(20));

	ALTER TABLE cliente  MODIFY documento VARCHAR(8) NOT NULL, ADD PRIMARY KEY(documento);

	describe cliente;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| documento | varchar(8)  | NO   | PRI | NULL    |       |
| nombre    | varchar(30) | NO   |     | NULL    |       |
| domicilio | varchar(30) | YES  |     | NULL    |       |
| ciudad    | varchar(20) | YES  |     | NULL    |       |
| telefono  | varchar(11) | YES  |     | NULL    |       |
| provincia | varchar(20) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
6 rows in set (0,01 sec)
```

## Define los siguientes indices:
### Un índice único por el campo "documento" y un índice común por ciudad y provincia.

-Nota:Muestra el comando y la salida. Justifica el tipo de indice en un comentario.

```sql
CREATE INDEX index_location ON cliente (ciudad, provincia);


CREATE UNIQUE INDEX idoc on cliente(documento);
Query OK, 0 rows affected (0,07 sec)
Records: 0  Duplicates: 0  Warnings: 0
```

## Vea los índices de la tabla.
- Nota:Muestra el comando y la salida "show index".
```sql
SHOW INDEX FROM cliente;
+---------+------------+----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table   | Non_unique | Key_name       | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+---------+------------+----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| cliente |          0 | PRIMARY        |            1 | documento   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| cliente |          0 | idoc           |            1 | documento   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| cliente |          1 | index_location |            1 | ciudad      | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| cliente |          1 | index_location |            2 | provincia   | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+---------+------------+----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
4 rows in set (0,01 sec)
```
## Agregue un índice único por el campo "telefono".
- Nota:Muestra el comando y la salida.
```sql
CREATE UNIQUE INDEX itelefono on cliente(telefono);
Query OK, 0 rows affected (0,04 sec)
```
## Elimina los índices.
- Nota:Muestra el comando y la salida.
```sql
ALTER TABLE cliente DROP INDEX index_location, DROP INDEX idoc;

SHOW INDEX FROM cliente;
Empty set (0,00 sec)
```