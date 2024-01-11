
## Paso 1 y 2
Primero debemos de crear las tablas con el siguiente comando:

```
CREATE TABLE Vehiculos (
id INTEGER PRIMARY KEY AUTOINCREMENT,
marca TEXT NOT NULL,
modelo TEXT NOT NULL,
anio INTEGER NOT NULL,
id_propietario INTEGER references Propietarios(id));
```
```
CREATE TABLE Vehiculos (
id INTEGER PRIMARY KEY AUTOINCREMENT,
marca TEXT NOT NULL,
modelo TEXT NOT NULL,
anio INTEGER NOT NULL,
id_propietario INTEGER references Propietarios(id));
```
Después insertamos la información correspondiente en cada tabla

```
INSERT INTO Propietarios (nombre, apellido, dni)
   ...> VALUES ('Juan', 'Perez', '12345678A');
sqlite> INSERT INTO Propietarios (nombre, apellido, dni)
   ...> VALUES ('Maria', 'Lopez', '87654321B');
sqlite> INSERT INTO Propietarios (nombre, apellido, dni)
   ...> VALUES ('Carlos', 'Ruíz', '11111111C');
sqlite> INSERT INTO Propietarios (nombre, apellido, dni)
   ...> VALUES ('Laura', 'Gomez', '22222222D');
sqlite> INSERT INTO Propietarios (nombre, apellido, dni)
   ...> VALUES ('Pedro', 'Martinez', '33333333E');
sqlite> INSERT INTO Propietarios (nombre, apellido, dni)
   ...> VALUES ('Ana', 'Fernandez', '44444444F');
sqlite> INSERT INTO Propietarios (nombre, apellido, dni)
   ...> VALUES ('Diego', 'Sanchez', '55555555G');
sqlite> INSERT INTO Propietarios (nombre, apellido, dni)
   ...> VALUES ('Sofia', 'Torres', '66666666H');
sqlite>INSERT INTO Propietarios (nombre, apellido, dni)
   ...> VALUES ('Javier', 'Leon', '77777777I');

```
```Sqlite
sqlite> INSERT INTO Vehiculos VALUES(1,'Ford','Fiesta',2019,1);
sqlite> INSERT INTO Vehiculos VALUES(2,'Toyota','Corolla',2018,2);
sqlite> INSERT INTO Vehiculos VALUES(3,'Nissan','Sentra',2020,3);
sqlite> INSERT INTO Vehiculos VALUES(4,'Chevrolet','Spark',2017,4);
sqlite> INSERT INTO Vehiculos VALUES(5,'Honda','Civic',2016,5);
sqlite> INSERT INTO Vehiculos VALUES(6,'Ford','Mustang',2021,6);
sqlite> INSERT INTO Vehiculos VALUES(7,'Toyota','RAV4',2019,7);
sqlite> INSERT INTO Vehiculos VALUES(8,'Volkswagen','Golf',2020,8);
sqlite> INSERT INTO Vehiculos VALUES(9,'Honda','CR-V',2018,9);
sqlite> INSERT INTO Vehiculos VALUES(10,'Nissan','Altima',2017,10);
sqlite> INSERT INTO Vehiculos VALUES(11,'Chevrolet','Malibu',2019,11);
sqlite> INSERT INTO Vehiculos VALUES(12,'Toyota','Camry',2020,12);
sqlite> INSERT INTO Vehiculos VALUES(13,'Honda','Accord',2018,13);
sqlite> INSERT INTO Vehiculos VALUES(14,'Ford','Explorer',2021,14);
sqlite> INSERT INTO Vehiculos VALUES(15,'Nissan','Rogue',2017,15);
sqlite> INSERT INTO Vehiculos VALUES(16,'Volkswagen','Jetta',2019,17);
sqlite> INSERT INTO Vehiculos VALUES(17,'Chevrolet','Equinox',2018,18);
sqlite> INSERT INTO Vehiculos VALUES(18,'Toyota','Highlander',2020,19);
sqlite> INSERT INTO Vehiculos VALUES(19,'Honda','Odyssey',2016,20);
sqlite> INSERT INTO Vehiculos VALUES(20,'Nissan','Murano',2019,21);
sqlite> INSERT INTO Vehiculos VALUES(20,'Nissan','Murano',2019,21);
```

## Paso 3 Realizar los siguientes 10 consultas de datos

#### 1 Seleccionar todos los propietarios

```
SELECT * FROM Propietarios;

```
```
+----+----------+-----------+-----------+
| id |  nombre  | apellido  |    dni    |
+----+----------+-----------+-----------+
| 1  | Juan     | Perez     | 12345678A |
| 2  | Maria    | Lopez     | 87654321B |
| 3  | Carlos   | Ruíz      | 11111111C |
| 4  | Laura    | Gomez     | 22222222D |
| 5  | Pedro    | Martinez  | 33333333E |
| 6  | Ana      | Fernandez | 44444444F |
| 7  | Diego    | Sanchez   | 55555555G |
| 8  | Sofia    | Torres    | 66666666H |
| 9  | Javier   | Leon      | 77777777I |
| 10 | Lucia    | Castillo  | 88888888J |
| 11 | Luis     | Gonzalez  | 99999999K |
| 12 | Marta    | Diaz      | 10101010L |
| 13 | Victor   | Vargas    | 11111112M |
| 14 | Elena    | Castro    | 12121212N |
| 15 | Roberto  | Blanco    | 13131313O |
| 17 | Natalia  | Paredes   | 14141414P |
| 18 | Fernando | Herrera   | 15151515Q |
| 19 | Clara    | Soto      | 16161616R |
| 20 | Sergio   | Mendoza   | 17171717S |
| 21 | Patricia | Navarro   | 18181818T |
+----+----------+-----------+-----------+
```
#### 2 Listar todos los vehículos
```
SELECT * FROM Vehiculos;
```
```
+----+------------+------------+------+----------------+
| id |   marca    |   modelo   | anio | id_propietario |
+----+------------+------------+------+----------------+
| 1  | Ford       | Fiesta     | 2019 | 1              |
| 2  | Toyota     | Corolla    | 2018 | 2              |
| 3  | Nissan     | Sentra     | 2020 | 3              |
| 4  | Chevrolet  | Spark      | 2017 | 4              |
| 5  | Honda      | Civic      | 2016 | 5              |
| 6  | Ford       | Mustang    | 2021 | 6              |
| 7  | Toyota     | RAV4       | 2019 | 7              |
| 8  | Volkswagen | Golf       | 2020 | 8              |
| 9  | Honda      | CR-V       | 2018 | 9              |
| 10 | Nissan     | Altima     | 2017 | 10             |
| 11 | Chevrolet  | Malibu     | 2019 | 11             |
| 12 | Toyota     | Camry      | 2020 | 12             |
| 13 | Honda      | Accord     | 2018 | 13             |
| 14 | Ford       | Explorer   | 2021 | 14             |
| 15 | Nissan     | Rogue      | 2017 | 15             |
| 16 | Volkswagen | Jetta      | 2019 | 17             |
| 17 | Chevrolet  | Equinox    | 2018 | 18             |
| 18 | Toyota     | Highlander | 2020 | 19             |
| 19 | Honda      | Odyssey    | 2016 | 20             |
| 20 | Nissan     | Murano     | 2019 | 21             |
+----+------------+------------+------+----------------+
```

#### 3 Seleccionar solo los nombres y apellidos de los propietarios
```
SELECT nombre, apellido FROM Propietarios; 
```
```
+----------+-----------+
|  nombre  | apellido  |
+----------+-----------+
| Juan     | Perez     |
| Maria    | Lopez     |
| Carlos   | Ruíz      |
| Laura    | Gomez     |
| Pedro    | Martinez  |
| Ana      | Fernandez |
| Diego    | Sanchez   |
| Sofia    | Torres    |
| Javier   | Leon      |
| Lucia    | Castillo  |
| Luis     | Gonzalez  |
| Marta    | Diaz      |
| Victor   | Vargas    |
| Elena    | Castro    |
| Roberto  | Blanco    |
| Natalia  | Paredes   |
| Fernando | Herrera   |
| Clara    | Soto      |
| Sergio   | Mendoza   |
| Patricia | Navarro   |
+----------+-----------+
```

#### 4 Listar todas las marcas y modelos de vehiculos
```
SELECT marca, modelo FROM Vehiculos;
```
```
+------------+------------+
|   marca    |   modelo   |
+------------+------------+
| Ford       | Fiesta     |
| Toyota     | Corolla    |
| Nissan     | Sentra     |
| Chevrolet  | Spark      |
| Honda      | Civic      |
| Ford       | Mustang    |
| Toyota     | RAV4       |
| Volkswagen | Golf       |
| Honda      | CR-V       |
| Nissan     | Altima     |
| Chevrolet  | Malibu     |
| Toyota     | Camry      |
| Honda      | Accord     |
| Ford       | Explorer   |
| Nissan     | Rogue      |
| Volkswagen | Jetta      |
| Chevrolet  | Equinox    |
| Toyota     | Highlander |
| Honda      | Odyssey    |
| Nissan     | Murano     |
+------------+------------+
```

#### 5 Seleccionar solo los propietarios con apellido "Perez"
```
SELECT * FROM Propietarios WHERE apellido='Perez';
```
```
+----+--------+----------+-----------+
| id | nombre | apellido |    dni    |
+----+--------+----------+-----------+
| 1  | Juan   | Perez    | 12345678A |
+----+--------+----------+-----------+
```

#### 6 Listar todos los vehículos con año 2019
```
SELECT * FROM Vehiculos WHERE anio=2019;
```
```
+----+------------+--------+------+----------------+
| id |   marca    | modelo | anio | id_propietario |
+----+------------+--------+------+----------------+
| 1  | Ford       | Fiesta | 2019 | 1              |
| 7  | Toyota     | RAV4   | 2019 | 7              |
| 11 | Chevrolet  | Malibu | 2019 | 11             |
| 16 | Volkswagen | Jetta  | 2019 | 17             |
| 20 | Nissan     | Murano | 2019 | 21             |
+----+------------+--------+------+----------------+
```

#### 7 Seleccionar propietarios que tienen vehículos de la marca "Toyota"

```
SELECT * FROM Vehiculos WHERE marca='Toyota';
```

```
+----+--------+------------+------+----------------+
| id | marca  |   modelo   | anio | id_propietario |
+----+--------+------------+------+----------------+
| 2  | Toyota | Corolla    | 2018 | 2              |
| 7  | Toyota | RAV4       | 2019 | 7              |
| 12 | Toyota | Camry      | 2020 | 12             |
| 18 | Toyota | Highlander | 2020 | 19             |
+----+--------+------------+------+----------------+
```

#### 8 Listar vehículos con marca "Ford" y modelo "Fiesta"
```
SELECT * FROM Vehiculos WHERE marca='Ford' and modelo='Fiesta';
```
```
+----+-------+--------+------+----------------+
| id | marca | modelo | anio | id_propietario |
+----+-------+--------+------+----------------+
| 1  | Ford  | Fiesta | 2019 | 1              |
+----+-------+--------+------+----------------+
```

#### 9 Seleccionar propietarios con DNI '12345678A'
```
SELECT * FROM Propietarios WHERE dni='12345678A';
```
```
+----+--------+----------+-----------+
| id | nombre | apellido |    dni    |
+----+--------+----------+-----------+
| 1  | Juan   | Perez    | 12345678A |
+----+--------+----------+-----------+
```

#### 10 Listar Vehículos que pertenecen al propietario con ID 5.
```
SELECT * FROM Vehiculos WHERE id_propietario=5;
```
```
+----+-------+--------+------+----------------+
| id | marca | modelo | anio | id_propietario |
+----+-------+--------+------+----------------+
| 5  | Honda | Civic  | 2016 | 5              |
+----+-------+--------+------+----------------+
```


## Paso 4 Realizar los siguientes updates

#### 1 Actualizar el nombre de un propietario con DNI "12345678A"
```
SELECT nombre FROM Propietarios;
UPDATE Propietarios SET nombre='Jose' WHERE dni='12345678A';
```
Antes:
```
+----+--------+----------+-----------+
| id | nombre | apellido |    dni    |
+----+--------+----------+-----------+
| 1  | Juan   | Perez    | 12345678A |
+----+--------+----------+-----------+
```
Despues:
```
Select * FROM Propietarios Where dni='12345678A';
+----+--------+----------+-----------+
| id | nombre | apellido |    dni    |
+----+--------+----------+-----------+
| 1  | Jose   | Perez    | 12345678A |
+----+--------+----------+-----------+
```

#### 2 Modificar el año de un vehículo con ID 3 a 2022.
```
SELECT anio FROM Vehiculos; 
UPDATE Vehiculos SET anio=2022 WHERE id=3;
sqlite> SELECT * FROM Vehiculos WHERE id=3;

```
Antes:
```
SELECT * FROM Vehiculos WHERE id=3;
+----+--------+--------+------+----------------+
| id | marca  | modelo | anio | id_propietario |
+----+--------+--------+------+----------------+
| 3  | Nissan | Sentra | 2020 | 3              |
+----+--------+--------+------+----------------+
```
Después:
```    
+----+--------+--------+------+----------------+
| id | marca  | modelo | anio | id_propietario |
+----+--------+--------+------+----------------+
| 3  | Nissan | Sentra | 2022 | 3              |
+----+--------+--------+------+----------------+
```

#### 3 Cambiar el modelo de todos los vehiculos Nissan a Micra
```
UPDATE Vehiculos SET modelo='Micra' Where marca='Nissan';
sqlite> SELECT * FROM Vehiculos WHERE marca='Nissan';
```
Antes:
```
SELECT * FROM Vehiculos WHERE marca='Nissan';
+----+--------+--------+------+----------------+
| id | marca  | modelo | anio | id_propietario |
+----+--------+--------+------+----------------+
| 3  | Nissan | Sentra | 2022 | 3              |
| 10 | Nissan | Altima | 2017 | 10             |
| 15 | Nissan | Rogue  | 2017 | 15             |
| 20 | Nissan | Murano | 2019 | 21             |
+----+--------+--------+------+----------------+
```

Despues:
```
+----+--------+--------+------+----------------+
| id | marca  | modelo | anio | id_propietario |
+----+--------+--------+------+----------------+
| 3  | Nissan | Micra  | 2022 | 3              |
| 10 | Nissan | Micra  | 2017 | 10             |
| 15 | Nissan | Micra  | 2017 | 15             |
| 20 | Nissan | Micra  | 2019 | 21             |
+----+--------+--------+------+----------------+
```

#### 4 Actualizar el apellido de un propietario con ID 7 a "Gomez"
```
UPDATE Propietarios SET apellido='Gomez' WHERE id=7;
sqlite> SELECT * FROM Propietarios WHERE id=7;
```
Antes:
```
SELECT * FROM Propietarios WHERE id=7;
+----+--------+----------+-----------+
| id | nombre | apellido |    dni    |
+----+--------+----------+-----------+
| 7  | Diego  | Sanchez  | 55555555G |
+----+--------+----------+-----------+
```

Despues:
```
+----+--------+----------+-----------+
| id | nombre | apellido |    dni    |
+----+--------+----------+-----------+
| 7  | Diego  | Gomez    | 55555555G |
+----+--------+----------+-----------+
```

#### 5 Modificar la marca de un vehículo con modelo "Fiesta" a "Renault"
```
UPDATE Vehiculos SET modelo='Reanult' WHERE modelo='Fiesta';
SELECT * FROM Vehiculos WHERE modelo='Renault';
```
Antes:
```
SELECT * FROM Vehiculos WHERE modelo='Fiesta';
+----+-------+--------+------+----------------+
| id | marca | modelo | anio | id_propietario |
+----+-------+--------+------+----------------+
| 1  | Ford  | Fiesta | 2019 | 1              |
+----+-------+--------+------+----------------+
```
Despues:
```
+----+-------+--------+------+----------------+
| id | marca | modelo | anio | id_propietario |
+----+-------+--------+------+----------------+
| 1  | Ford  | Renault | 2019 | 1              |
+----+-------+--------+------+----------------+
```
