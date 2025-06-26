# Tarea 1 sobre los procedimientos.

## Crea la bbdd. Utilizaremos comandos SQL para crear una base de datos llamada "SimpleDB" que contendrá dos tablas: "Users" para almacenar información de usuarios y "Products" para almacenar información de productos.

```sql

CREATE DATABASE IF NOT EXISTS SimpleDB;

USE SimpleDB;

CREATE TABLE IF NOT EXISTS Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    UserName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL
);


--Resultados:
show tables;
+--------------------+
| Tables_in_SimpleDB |
+--------------------+
| Products           |
| Users              |
+--------------------+
2 rows in set (0,01 sec)

```

## Realiza la inserción de algunos datos de prueba.
```sql
-- Casos de prueba
INSERT INTO Users (UserName, Email) VALUES ('Juan', 'juan@example.com');
INSERT INTO Users (UserName, Email) VALUES ('María', 'maria@example.com');
INSERT INTO Users (UserName, Email) VALUES ('Pedro', 'pedro@example.com');

INSERT INTO Products (ProductName, Price) VALUES ('Producto 1', 10.99);
INSERT INTO Products (ProductName, Price) VALUES ('Producto 2', 20.50);
INSERT INTO Products (ProductName, Price) VALUES ('Producto 3', 15.75);

SELECT * FROM Users;
+--------+----------+-------------------+
| UserID | UserName | Email             |
+--------+----------+-------------------+
|      1 | Juan     | juan@example.com  |
|      2 | María    | maria@example.com |
|      3 | Pedro    | pedro@example.com |
+--------+----------+-------------------+
3 rows in set (0,00 sec)

SELECT * FROM Products;
+-----------+-------------+-------+
| ProductID | ProductName | Price |
+-----------+-------------+-------+
|         1 | Producto 1  | 10.99 |
|         2 | Producto 2  | 20.50 |
|         3 | Producto 3  | 15.75 |
+-----------+-------------+-------+
3 rows in set (0,01 sec)


-- Casos propuestos:

INSERT INTO Users (UserName, Email) VALUES ('Francisco', 'francisco@example.com');
INSERT INTO Users (UserName, Email) VALUES ('Felipe', 'felipe@example.com');
INSERT INTO Users (UserName, Email) VALUES ('Johanna', 'johanna@example.com');

INSERT INTO Products (ProductName, Price) VALUES ('Producto 4', 30.96);
INSERT INTO Products (ProductName, Price) VALUES ('Producto 5', 27.58);
INSERT INTO Products (ProductName, Price) VALUES ('Producto 6', 75.05);

SELECT * FROM Users;
+--------+-----------+-----------------------+
| UserID | UserName  | Email                 |
+--------+-----------+-----------------------+
|      1 | Juan      | juan@example.com      |
|      2 | María     | maria@example.com     |
|      3 | Pedro     | pedro@example.com     |
|      4 | Francisco | francisco@example.com |
|      5 | Felipe    | felipe@example.com    |
|      6 | Johanna   | johanna@example.com   |
+--------+-----------+-----------------------+
6 rows in set (0,00 sec)

SELECT * FROM Products;
+-----------+-------------+-------+
| ProductID | ProductName | Price |
+-----------+-------------+-------+
|         1 | Producto 1  | 10.99 |
|         2 | Producto 2  | 20.50 |
|         3 | Producto 3  | 15.75 |
|         4 | Producto 4  | 30.96 |
|         5 | Producto 5  | 27.58 |
|         6 | Producto 6  | 75.00 |
+-----------+-------------+-------+
6 rows in set (0,00 sec)


```
## Crea procedimientos almacenados para realizar operaciones como insertar un nuevo usuario, actualizar el nombre de un usuario, etc.
### Procedimiento para insertar un nuevo usuario.

```sql

DROP procedure if exists insert_user;


DELIMITER //
CREATE procedure insert_user(in user_name VARCHAR(25), in email VARCHAR(50))
BEGIN 
INSERT INTO Users (UserName, Email) VALUES (user_name, email);
END //

DELIMITER ;

CALL insert_user('Manuel', 'manuel@example.com');
Query OK, 1 row affected (0,02 sec)
-- Resultado:
SELECT * FROM Users;
+--------+-----------+-----------------------+
| UserID | UserName  | Email                 |
+--------+-----------+-----------------------+
|      1 | Juan      | juan@example.com      |
|      2 | María     | maria@example.com     |
|      3 | Pedro     | pedro@example.com     |
|      4 | Francisco | francisco@example.com |
|      5 | Felipe    | felipe@example.com    |
|      6 | Johanna   | johanna@example.com   |
|      7 | Manuel    | manuel@example.com    |
+--------+-----------+-----------------------+
7 rows in set (0,00 sec)

```


### Procedimiento para actualizar el nombre de un usuario.

```sql

DROP procedure if exists update_user;


DELIMITER //
CREATE procedure update_user(in actual_name VARCHAR(25), in new_user_name VARCHAR(25))
BEGIN 
UPDATE Users SET UserName = new_user_name
WHERE UserName = actual_name;
END //

DELIMITER ;

--Resultado:
CALL update_user('Manuel', 'NewManuel');
Query OK, 1 row affected (0,02 sec)

SELECT * FROM Users;
+--------+-----------+-----------------------+
| UserID | UserName  | Email                 |
+--------+-----------+-----------------------+
|      1 | Juan      | juan@example.com      |
|      2 | María     | maria@example.com     |
|      3 | Pedro     | pedro@example.com     |
|      4 | Francisco | francisco@example.com |
|      5 | Felipe    | felipe@example.com    |
|      6 | Johanna   | johanna@example.com   |
|      7 | NewManuel | manuel@example.com    |
+--------+-----------+-----------------------+
7 rows in set (0,00 sec)

```
## Implementa funciones para realizar cálculos o consultas:
### Función para calcular el precio total de un conjunto de productos.

```sql

DROP FUNCTION IF EXISTS total_producto;

DELIMITER $$
CREATE FUNCTION total_producto(
    limit_product INT
)
RETURNS FLOAT
DETERMINISTIC
BEGIN
    DECLARE total FLOAT;
    SELECT SUM(Price) INTO total FROM (
        SELECT Price FROM Products ORDER BY ProductID LIMIT limit_product
    ) AS limited_products;

    RETURN total;
END$$
DELIMITER ;
exit
-- Resultado:

SELECT total_producto(4);
+-------------------+
| total_producto(4) |
+-------------------+
|              78.2 |
+-------------------+
1 row in set (0.00 sec)


```


### Función para contar el número de usuarios.


```sql

DROP FUNCTION IF EXISTS count_users;

DELIMITER $$
CREATE FUNCTION count_users() RETURNS INT
DETERMINISTIC
BEGIN 
    DECLARE total INT;
    SELECT COUNT(UserID) as total_usuarios FROM Users into total;
    RETURN total;
END$$
DELIMITER ;


-- Resultado:
SELECT count_users();
+---------------+
| count_users() |
+---------------+
|             7 |
+---------------+
1 row in set (0.00 sec)

```
