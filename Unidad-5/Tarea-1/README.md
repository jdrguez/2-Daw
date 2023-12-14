## Informe Comandos Sqlite

### Ejercicio 1
Crear una tabla con un comando de cada tipo. Primero usamos el comando preestablecido para generar un fichero para contener la base de datos.

>Usamos este comando `sqlite3 tarea1.db`

Dentro de SQLite3, debemos crear una tabla llamada Ejemplo con los campos que se nos indican:

```
CREATE TABLE Ejemplo (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    texto TEXT NOT NULL,
    entero INTEGER NOT NULL,
    decimal REAL NOT NULL,
    booleano BOOLEAN NOT NULL );`
```
---
### Ejercicio 2
