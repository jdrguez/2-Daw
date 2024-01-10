
## Paso 1 y 2


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

## Paso 3

#### 1 Seleccionar todos los propietarios

```
SELECT * FROM Propietarios;

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