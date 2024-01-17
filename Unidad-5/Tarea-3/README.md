<div text-align=justify>

# Tarea 3. Practicar la creación y manipulación de una base de datos SQLite3 desde la línea de comandos

## Paso 1 y 2: Creación de la BBDD
Crea con el siguiente contenido el fichero empleados-dump.sql

```Sql
CREATE TABLE empleados (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT,
    salario REAL,
    departamento TEXT
);

INSERT INTO empleados (nombre, salario, departamento) VALUES ('Juan', 50000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('María', 60000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Carlos', 55000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Ana', 48000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Pedro', 70000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Laura', 52000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Javier', 48000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Carmen', 65000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Miguel', 51000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Elena', 55000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Diego', 72000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Sofía', 49000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Andrés', 60000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Isabel', 53000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Raúl', 68000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Patricia', 47000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Alejandro', 71000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Natalia', 54000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Roberto', 49000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Beatriz', 63000, 'TI');

```

### Resultado:
```Sql
sqlite> .read empleados-dump.sql
sqlite> .mode box
sqlite> select * from empleados;
┌────┬───────────┬─────────┬──────────────────┐
│ id │  nombre   │ salario │   departamento   │
├────┼───────────┼─────────┼──────────────────┤
│ 1  │ Juan      │ 50000.0 │ Ventas           │
│ 2  │ María     │ 60000.0 │ TI               │
│ 3  │ Carlos    │ 55000.0 │ Ventas           │
│ 4  │ Ana       │ 48000.0 │ Recursos Humanos │
│ 5  │ Pedro     │ 70000.0 │ TI               │
│ 6  │ Laura     │ 52000.0 │ Ventas           │
│ 7  │ Javier    │ 48000.0 │ Recursos Humanos │
│ 8  │ Carmen    │ 65000.0 │ TI               │
│ 9  │ Miguel    │ 51000.0 │ Ventas           │
│ 10 │ Elena     │ 55000.0 │ Recursos Humanos │
│ 11 │ Diego     │ 72000.0 │ TI               │
│ 12 │ Sofía     │ 49000.0 │ Ventas           │
│ 13 │ Andrés    │ 60000.0 │ Recursos Humanos │
│ 14 │ Isabel    │ 53000.0 │ TI               │
│ 15 │ Raúl      │ 68000.0 │ Ventas           │
│ 16 │ Patricia  │ 47000.0 │ Recursos Humanos │
│ 17 │ Alejandro │ 71000.0 │ TI               │
│ 18 │ Natalia   │ 54000.0 │ Ventas           │
│ 19 │ Roberto   │ 49000.0 │ Recursos Humanos │
│ 20 │ Beatriz   │ 63000.0 │ TI               │
└────┴───────────┴─────────┴──────────────────┘
```
## Paso 3: Realización de consultas

### 1 Funciones UPPER y LOWER: Muestra el nombre de todos los empleados en mayúsculas.
```Sql
select UPPER(nombre) as empleados_mayuscula from empleados;
┌─────────────────────┐
│ empleados_mayuscula │
├─────────────────────┤
│ JUAN                │
│ MARíA               │
│ CARLOS              │
│ ANA                 │
│ PEDRO               │
│ LAURA               │
│ JAVIER              │
│ CARMEN              │
│ MIGUEL              │
│ ELENA               │
│ DIEGO               │
│ SOFíA               │
│ ANDRéS              │
│ ISABEL              │
│ RAúL                │
│ PATRICIA            │
│ ALEJANDRO           │
│ NATALIA             │
│ ROBERTO             │
│ BEATRIZ             │
└─────────────────────┘
```
### 2 Funciones Numéricas: Calcula el valor absoluta del salario de todos los empleados
```Sql
SELECT ABS(salario) as valor_absoluto_salario FROM empleados; 
┌────────────────────────┐
│ valor_absoluto_salario │
├────────────────────────┤
│ 50000.0                │
│ 60000.0                │
│ 55000.0                │
│ 48000.0                │
│ 70000.0                │
│ 52000.0                │
│ 48000.0                │
│ 65000.0                │
│ 51000.0                │
│ 55000.0                │
│ 72000.0                │
│ 49000.0                │
│ 60000.0                │
│ 53000.0                │
│ 68000.0                │
│ 47000.0                │
│ 71000.0                │
│ 54000.0                │
│ 49000.0                │
│ 63000.0                │
└────────────────────────┘
```

### 3 Funciones de Fecha y Hora: Muestra la fecha actual.
```Sql
SELECT CURRENT_DATE FROM empleados;
┌──────────────┐
│ CURRENT_DATE │
├──────────────┤
│ 2024-01-17   │
│ 2024-01-17   │
│ 2024-01-17   │
│ 2024-01-17   │
│ 2024-01-17   │
│ 2024-01-17   │
│ 2024-01-17   │
│ 2024-01-17   │
│ 2024-01-17   │
│ 2024-01-17   │
│ 2024-01-17   │
│ 2024-01-17   │
│ 2024-01-17   │
│ 2024-01-17   │
│ 2024-01-17   │
│ 2024-01-17   │
│ 2024-01-17   │
│ 2024-01-17   │
│ 2024-01-17   │
│ 2024-01-17   │
└──────────────┘
```

### 4 Funciones de agregación: Calcula el promedio de salarios de todos los empleados
```Sql
SELECT AVG(salario) as salario_promedio FROM empleados;
┌──────────────────┐
│ salario_promedio │
├──────────────────┤
│ 57000.0          │
└──────────────────┘
```Sql

### 5 Funciones de agregación: Convierte la cadena '123' a un valor entero
```Sql
SELECT CAST('123' AS INTEGER) AS valor_convertido;
┌──────────────────┐
│ valor_convertido │
├──────────────────┤
│ 123              │
└──────────────────┘
```

### 6 Funciones de Manipulación de Cadenas: Concatena el nombre y el departamento de cada empleado.

```Sql
SELECT CONCAT(nombre,'-',departamento) AS nombre_departamento FROM empleados; 
┌───────────────────────────┐
│    nombre_departamento    │
├───────────────────────────┤
│ Juan-Ventas               │
│ María-TI                  │
│ Carlos-Ventas             │
│ Ana-Recursos Humanos      │
│ Pedro-TI                  │
│ Laura-Ventas              │
│ Javier-Recursos Humanos   │
│ Carmen-TI                 │
│ Miguel-Ventas             │
│ Elena-Recursos Humanos    │
│ Diego-TI                  │
│ Sofía-Ventas              │
│ Andrés-Recursos Humanos   │
│ Isabel-TI                 │
│ Raúl-Ventas               │
│ Patricia-Recursos Humanos │
│ Alejandro-TI              │
│ Natalia-Ventas            │
│ Roberto-Recursos Humanos  │
│ Beatriz-TI                │
└───────────────────────────┘
```
### 7 Funciones de Control de Flujo (CASE): Categoriza la suma total de salarios de todos los empleados
```Sql
SELECT id, nombre, salario, CASE
   ...> WHEN salario < 50000 THEN 'salario-bajo' 
   ...> WHEN salario >= 50000 AND salario <= 60000 THEN 'salario-medio'
   ...> WHEN salario > 60000 THEN 'salario-alto' 
   ...> END AS salario_catagorizado FROM empleados;
┌────┬───────────┬─────────┬──────────────────────┐
│ id │  nombre   │ salario │ salario_catagorizado │
├────┼───────────┼─────────┼──────────────────────┤
│ 1  │ Juan      │ 50000.0 │ salario-medio        │
│ 2  │ María     │ 60000.0 │ salario-medio        │
│ 3  │ Carlos    │ 55000.0 │ salario-medio        │
│ 4  │ Ana       │ 48000.0 │ salario-bajo         │
│ 5  │ Pedro     │ 70000.0 │ salario-alto         │
│ 6  │ Laura     │ 52000.0 │ salario-medio        │
│ 7  │ Javier    │ 48000.0 │ salario-bajo         │
│ 8  │ Carmen    │ 65000.0 │ salario-alto         │
│ 9  │ Miguel    │ 51000.0 │ salario-medio        │
│ 10 │ Elena     │ 55000.0 │ salario-medio        │
│ 11 │ Diego     │ 72000.0 │ salario-alto         │
│ 12 │ Sofía     │ 49000.0 │ salario-bajo         │
│ 13 │ Andrés    │ 60000.0 │ salario-medio        │
│ 14 │ Isabel    │ 53000.0 │ salario-medio        │
│ 15 │ Raúl      │ 68000.0 │ salario-alto         │
│ 16 │ Patricia  │ 47000.0 │ salario-bajo         │
│ 17 │ Alejandro │ 71000.0 │ salario-alto         │
│ 18 │ Natalia   │ 54000.0 │ salario-medio        │
│ 19 │ Roberto   │ 49000.0 │ salario-bajo         │
│ 20 │ Beatriz   │ 63000.0 │ salario-alto         │
└────┴───────────┴─────────┴──────────────────────┘
```


### 8 Funciones de Agregación (SUM): Calcula la suma total de salrios de todos los empleados.

```Sql
SELECT SUM(salario) as salario_total FROM empleados;
┌───────────────┐
│ salario_total │
├───────────────┤
│ 1140000.0     │
└───────────────┘
```

### 9 Funciones de Manipulación de Cadenas (LENGTH): Muestra la longitud de casa nombre de empleado.

```Sql
SELECT nombre, LENGTH(nombre) as longitud_nombre FROM empleados;
┌───────────┬─────────────────┐
│  nombre   │ longitud_nombre │
├───────────┼─────────────────┤
│ Juan      │ 4               │
│ María     │ 5               │
│ Carlos    │ 6               │
│ Ana       │ 3               │
│ Pedro     │ 5               │
│ Laura     │ 5               │
│ Javier    │ 6               │
│ Carmen    │ 6               │
│ Miguel    │ 6               │
│ Elena     │ 5               │
│ Diego     │ 5               │
│ Sofía     │ 5               │
│ Andrés    │ 6               │
│ Isabel    │ 6               │
│ Raúl      │ 4               │
│ Patricia  │ 8               │
│ Alejandro │ 9               │
│ Natalia   │ 7               │
│ Roberto   │ 7               │
│ Beatriz   │ 7               │
└───────────┴─────────────────┘
```

### 10 Funciones de Agregación (COUNT): Cuenta el número total de empleados en cada departamento.
```Sql
SELECT departamento, COUNT(*) as cantidad_departamentos FROM empleados GROUP BY departamento;
┌──────────────────┬────────────────────────┐
│   departamento   │ cantidad_departamentos │
├──────────────────┼────────────────────────┤
│ Recursos Humanos │ 6                      │
│ TI               │ 7                      │
│ Ventas           │ 7                      │
└──────────────────┴────────────────────────┘
```

### 11 Funciones de Fecha y Hora (CURRENT_TIME)
```Sql
SELECT CURRENT_TIME AS hora_actual ;       
┌─────────────┐
│ hora_actual │
├─────────────┤
│ 11:19:26    │
└─────────────┘
```

### 12 Funciones de Conversión (CAST): Convierte el salario a un valor punto flotante
```Sql
SELECT CAST(salario as FLOAT) as salario_decimal FROM empleados;
┌─────────────────┐
│ salario_decimal │
├─────────────────┤
│ 50000.0         │
│ 60000.0         │
│ 55000.0         │
│ 48000.0         │
│ 70000.0         │
│ 52000.0         │
│ 48000.0         │
│ 65000.0         │
│ 51000.0         │
│ 55000.0         │
│ 72000.0         │
│ 49000.0         │
│ 60000.0         │
│ 53000.0         │
│ 68000.0         │
│ 47000.0         │
│ 71000.0         │
│ 54000.0         │
│ 49000.0         │
│ 63000.0         │
└─────────────────┘
```

### 13 Funciones de Manipulación de Cadenas (SUBSTR): Muestra los primeros tres caracteres de cada nombre de empleado.
```Sql
SELECT nombre, SUBSTR(nombre, 1, 3) AS primeros_tres_caracteres FROM empleados;
┌───────────┬──────────────────────────┐
│  nombre   │ primeros_tres_caracteres │
├───────────┼──────────────────────────┤
│ Juan      │ Jua                      │
│ María     │ Mar                      │
│ Carlos    │ Car                      │
│ Ana       │ Ana                      │
│ Pedro     │ Ped                      │
│ Laura     │ Lau                      │
│ Javier    │ Jav                      │
│ Carmen    │ Car                      │
│ Miguel    │ Mig                      │
│ Elena     │ Ele                      │
│ Diego     │ Die                      │
│ Sofía     │ Sof                      │
│ Andrés    │ And                      │
│ Isabel    │ Isa                      │
│ Raúl      │ Raú                      │
│ Patricia  │ Pat                      │
│ Alejandro │ Ale                      │
│ Natalia   │ Nat                      │
│ Roberto   │ Rob                      │
│ Beatriz   │ Bea                      │
└───────────┴──────────────────────────┘
```
### 15 Order By and Like

#### Empleados en el departamento de 'Ventas' con salarios superiores a 52000
```Sql
SELECT nombre, salario, departamento FROM empleados WHERE departamento LIKE 'Ventas' AND salario > 52000 ORDER BY salario DESC;  
┌─────────┬─────────┬──────────────┐
│ nombre  │ salario │ departamento │
├─────────┼─────────┼──────────────┤
│ Raúl    │ 68000.0 │ Ventas       │
│ Carlos  │ 55000.0 │ Ventas       │
│ Natalia │ 54000.0 │ Ventas       │
└─────────┴─────────┴──────────────┘
```

#### Empleados cuyos nombres contienen la letra 'a' y tienen salarios ordenados de manera ascendentes
```Sql
SELECT id, nombre, salario FROM empleados WHERE nombre LIKE '%a%' ORDER BY salario ASC;

┌────┬───────────┬─────────┐
│ id │  nombre   │ salario │
├────┼───────────┼─────────┤
│ 16 │ Patricia  │ 47000.0 │
│ 4  │ Ana       │ 48000.0 │
│ 7  │ Javier    │ 48000.0 │
│ 12 │ Sofía     │ 49000.0 │
│ 1  │ Juan      │ 50000.0 │
│ 6  │ Laura     │ 52000.0 │
│ 14 │ Isabel    │ 53000.0 │
│ 18 │ Natalia   │ 54000.0 │
│ 3  │ Carlos    │ 55000.0 │
│ 10 │ Elena     │ 55000.0 │
│ 2  │ María     │ 60000.0 │
│ 13 │ Andrés    │ 60000.0 │
│ 20 │ Beatriz   │ 63000.0 │
│ 8  │ Carmen    │ 65000.0 │
│ 15 │ Raúl      │ 68000.0 │
│ 17 │ Alejandro │ 71000.0 │
└────┴───────────┴─────────┘
```

#### Empleados en el departamento 'Recursos Humanos' con salarios entre 45000 y 55000.
```Sql
SELECT id, nombre, salario, departamento FROM empleados WHERE departamento LIKE 'Recursos Humanos' AND salario >= 45000 AND salario <= 55000 ORDER BY salario ASC; 
┌────┬──────────┬─────────┬──────────────────┐
│ id │  nombre  │ salario │   departamento   │
├────┼──────────┼─────────┼──────────────────┤
│ 16 │ Patricia │ 47000.0 │ Recursos Humanos │
│ 4  │ Ana      │ 48000.0 │ Recursos Humanos │
│ 7  │ Javier   │ 48000.0 │ Recursos Humanos │
│ 19 │ Roberto  │ 49000.0 │ Recursos Humanos │
│ 10 │ Elena    │ 55000.0 │ Recursos Humanos │
└────┴──────────┴─────────┴──────────────────┘
```

#### Empleados con salarios en orden descendente, limitado a los primeros 5 resultados.
```Sql
SELECT id, nombre, salario FROM empleados ORDER BY salario DESC LIMIT 5;
┌────┬───────────┬─────────┐
│ id │  nombre   │ salario │
├────┼───────────┼─────────┤
│ 11 │ Diego     │ 72000.0 │
│ 17 │ Alejandro │ 71000.0 │
│ 5  │ Pedro     │ 70000.0 │
│ 15 │ Raúl      │ 68000.0 │
│ 8  │ Carmen    │ 65000.0 │
└────┴───────────┴─────────┘
```

#### Empleados cuyos nombres comienzan con 'M' o 'N' y tienen salarios superiores a 50000.
```Sql
SELECT id, nombre, salario FROM empleados WHERE (nombre LIKE 'M%' or nombre LIKE 'N%')AND salario > 50000 ORDER BY salario DESC;  
┌────┬─────────┬─────────┐
│ id │ nombre  │ salario │
├────┼─────────┼─────────┤
│ 2  │ María   │ 60000.0 │
│ 18 │ Natalia │ 54000.0 │
│ 9  │ Miguel  │ 51000.0 │
└────┴─────────┴─────────┘
```
#### Empleados en el departamento 'TI' o 'Ventas' ordenados alfabéticamente por nombre
```Sql
SELECT id, nombre, salario, departamento FROM empleados WHERE departamento IN ('TI','Ventas') ORDER BY nombre ASC;
┌────┬───────────┬─────────┬──────────────┐
│ id │  nombre   │ salario │ departamento │
├────┼───────────┼─────────┼──────────────┤
│ 17 │ Alejandro │ 71000.0 │ TI           │
│ 20 │ Beatriz   │ 63000.0 │ TI           │
│ 3  │ Carlos    │ 55000.0 │ Ventas       │
│ 8  │ Carmen    │ 65000.0 │ TI           │
│ 11 │ Diego     │ 72000.0 │ TI           │
│ 14 │ Isabel    │ 53000.0 │ TI           │
│ 1  │ Juan      │ 50000.0 │ Ventas       │
│ 6  │ Laura     │ 52000.0 │ Ventas       │
│ 2  │ María     │ 60000.0 │ TI           │
│ 9  │ Miguel    │ 51000.0 │ Ventas       │
│ 18 │ Natalia   │ 54000.0 │ Ventas       │
│ 5  │ Pedro     │ 70000.0 │ TI           │
│ 15 │ Raúl      │ 68000.0 │ Ventas       │
│ 12 │ Sofía     │ 49000.0 │ Ventas       │
└────┴───────────┴─────────┴──────────────┘
```

#### Empleados con salarios únicos (eliminando duplicados) en orden ascendente.
```Sql
SELECT DISTINCT id, nombre, salario FROM empleados GROUP BY salario ORDER BY salario AS;
┌────┬───────────┬─────────┐
│ id │  nombre   │ salario │
├────┼───────────┼─────────┤
│ 16 │ Patricia  │ 47000.0 │
│ 4  │ Ana       │ 48000.0 │
│ 12 │ Sofía     │ 49000.0 │
│ 1  │ Juan      │ 50000.0 │
│ 9  │ Miguel    │ 51000.0 │
│ 6  │ Laura     │ 52000.0 │
│ 14 │ Isabel    │ 53000.0 │
│ 18 │ Natalia   │ 54000.0 │
│ 3  │ Carlos    │ 55000.0 │
│ 2  │ María     │ 60000.0 │
│ 20 │ Beatriz   │ 63000.0 │
│ 8  │ Carmen    │ 65000.0 │
│ 15 │ Raúl      │ 68000.0 │
│ 5  │ Pedro     │ 70000.0 │
│ 17 │ Alejandro │ 71000.0 │
│ 11 │ Diego     │ 72000.0 │
└────┴───────────┴─────────┘
```

#### Empleados cuyos nombres terminan con 'o' o 'a' y están en el departamento 'Ventas'
```Sql
SELECT id, nombre, salario, departamento FROM empleados WHERE (nombre LIKE '%o' or nomb
re LIKE '%a') AND departamento = 'Ventas';
┌────┬─────────┬─────────┬──────────────┐
│ id │ nombre  │ salario │ departamento │
├────┼─────────┼─────────┼──────────────┤
│ 6  │ Laura   │ 52000.0 │ Ventas       │
│ 12 │ Sofía   │ 49000.0 │ Ventas       │
│ 18 │ Natalia │ 54000.0 │ Ventas       │
└────┴─────────┴─────────┴──────────────┘
```

#### Empleados con salarios fuera del rango de 55000 a 70000, ordenados por departamento.
```Sql
SELECT id, nombre, salario, departamento FROM empleados WHERE salario NOT BETWEEN 55000 AND 70000 ORDER BY departamento;  
┌────┬───────────┬─────────┬──────────────────┐
│ id │  nombre   │ salario │   departamento   │
├────┼───────────┼─────────┼──────────────────┤
│ 4  │ Ana       │ 48000.0 │ Recursos Humanos │
│ 7  │ Javier    │ 48000.0 │ Recursos Humanos │
│ 16 │ Patricia  │ 47000.0 │ Recursos Humanos │
│ 19 │ Roberto   │ 49000.0 │ Recursos Humanos │
│ 11 │ Diego     │ 72000.0 │ TI               │
│ 14 │ Isabel    │ 53000.0 │ TI               │
│ 17 │ Alejandro │ 71000.0 │ TI               │
│ 1  │ Juan      │ 50000.0 │ Ventas           │
│ 6  │ Laura     │ 52000.0 │ Ventas           │
│ 9  │ Miguel    │ 51000.0 │ Ventas           │
│ 12 │ Sofía     │ 49000.0 │ Ventas           │
│ 18 │ Natalia   │ 54000.0 │ Ventas           │
└────┴───────────┴─────────┴──────────────────┘
```

#### Empleados en el departamento 'Recursos Humanos' con nombres que no contienen la letra 'e'
```Sql
SELECT id, nombre, salario, departamento FROM empleados WHERE departamento = 'Recursos 
Humanos' AND nombre NOT LIKE '%e%';
┌────┬──────────┬─────────┬──────────────────┐
│ id │  nombre  │ salario │   departamento   │
├────┼──────────┼─────────┼──────────────────┤
│ 4  │ Ana      │ 48000.0 │ Recursos Humanos │
│ 13 │ Andrés   │ 60000.0 │ Recursos Humanos │
│ 16 │ Patricia │ 47000.0 │ Recursos Humanos │
└────┴──────────┴─────────┴──────────────────┘
```
</div>