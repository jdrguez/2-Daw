## Informe Comandos Sqlite

### Ejercicio 1
Crear una tabla con un comando de cada tipo. Primero usamos el comando preestablecido para generar un fichero para contener la base de datos.

>Usamos este comando  `sqlite3 tarea1.db`

Dentro de SQLite3, debemos crear una tabla llamada Ejemplo con los campos que se nos indican:

```
CREATE TABLE Ejemplo (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    texto TEXT NOT NULL,
    entero INTEGER NOT NULL,
    decimal REAL NOT NULL,
    booleano BOOLEAN NOT NULL );
```
---
### Ejercicio 2

Aquí deberemos insertar la tabla con los 50 datos proporcionados. Para ello se utilizó los siguientes comandos:

##### Primeras entradas
```
INSERT INTO Ejemplo ( texto, entero, decimal, booleano )
VALUES ( 'Ejemplo1', 25, 10.5, "2022-05-15", 0);
```
```
INSERT INTO Ejemplo ( texto, entero, decimal, booleano )
VALUES ( 'Ejemplo2', 63, 45.7, "2022-06-22", 1);
```
...
##### Últimas entradas

```
INSERT INTO Ejemplo ( texto, entero, decimal, booleano )
VALUES ( 'Ejemplo49', 28, 50.0, "2026-05-25", 0);
```
```
INSERT INTO Ejemplo ( texto, entero, decimal, booleano )
VALUES ( 'Ejemplo50', 75, 85.3, "2022-06-11", 1);
```
---
### Ejercicio 3

Se nos manda a realizar 5 consultas de datos. Dos de ellas son las siguientes:

#### Obtener todas las entradas de la tabla ejemplo:
```
SELECT * FROM Ejemplo;
```

#### Obtener las entradas con el campo entero mayor a 50:
Aquí lo podemos hacer de dos formas, solo consiguiendo los número enteros como valores mediante este código:
```
SELECT entero 
FROM Ejemplo
WHERE entero > 50;
```
Sin embargo, solo nos devolverá los valores que superen ese filtro.

Mediante el siguiente código se nos devolverá todos las entradas que superen ese filtro:
```
SELECT *
FROM Ejemplo
WHERE entero > 50;
```
#### Seleccionar solo por texto
```
SELECT texto
FROM Ejemplo;
```
#### Seleccionar texto y su decimal
```
SELECT texto, decimal
FROM Ejemplo;
```
#### Seleccionar la fecha y su id
```
SELECT id, fecha
FROM Ejemplo;
```
---
### Ejercicio 4
Realizar 3 eliminaciones y 3 modificaciones
#### Eliminaciones
##### Elimina las entradas donde el campo booleano es igual a True:
```
DELETE FROM Ejemplo 
WHERE booleano=1;
```
##### Elimina las entradas donde el campo entero sea igual a 50:
```
DELETE FROM Ejemplo 
WHERE entero=50;
```
##### Elimina las entradas donde el campo decial es menor a 50:
```
DELETE FROM Ejemplo 
WHERE decimal < 50.0;
```
#### Modificaciones
##### Modifica el campo texto de las entradas donde el campo entero es menor a 30 y establece el texto como "Modificado":
```
UPDATE Ejemplo
SET texto = 'Modificado' 
WHERE entero < 30;
```
##### Incrementa en 10 el valor del campo entero para las entradas donde el campo booleano es igual a False:
```
UPDATE Ejemplo
SET entero = entero + 10 
WHERE booleano= 0;
```
##### Actualiza el campo fecha de todas las entradas a la fecha actual:
```
UPDATE Ejemplo
SET fecha = date(now);
```