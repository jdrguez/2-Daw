# Tarea 4. Vistas

## Realiza cada una de las siguientes consultas:
### Actores que tienen de primer nombre Scarlett.
```sql
SELECT * from actor WHERE first_name='Scarlett';
+----------+------------+-----------+---------------------+
| actor_id | first_name | last_name | last_update         |
+----------+------------+-----------+---------------------+
|       81 | SCARLETT   | DAMON     | 2006-02-15 04:34:33 |
|      124 | SCARLETT   | BENING    | 2006-02-15 04:34:33 |
+----------+------------+-----------+---------------------+
2 rows in set (0,01 sec)
```
### Actores que tienen de apellido Johansson.
```sql
SELECT * FROM actor WHERE last_name='Johansson';
+----------+------------+-----------+---------------------+
| actor_id | first_name | last_name | last_update         |
+----------+------------+-----------+---------------------+
|        8 | MATTHEW    | JOHANSSON | 2006-02-15 04:34:33 |
|       64 | RAY        | JOHANSSON | 2006-02-15 04:34:33 |
|      146 | ALBERT     | JOHANSSON | 2006-02-15 04:34:33 |
+----------+------------+-----------+---------------------+
3 rows in set (0,00 sec)
```
### Actores que contengan una O en su nombre.
```sql
SELECT * from actor WHERE first_name REGEXP 'O';
+----------+-------------+--------------+---------------------+
| actor_id | first_name  | last_name    | last_update         |
+----------+-------------+--------------+---------------------+
|        1 | PENELOPE    | GUINESS      | 2006-02-15 04:34:33 |
|        5 | JOHNNY      | LOLLOBRIGIDA | 2006-02-15 04:34:33 |
|        9 | JOE         | SWANK        | 2006-02-15 04:34:33 |
|       11 | ZERO        | CAGE         | 2006-02-15 04:34:33 |
|       19 | BOB         | FAWCETT      | 2006-02-15 04:34:33 |
|       24 | CAMERON     | STREEP       | 2006-02-15 04:34:33 |
|       28 | WOODY       | HOFFMAN      | 2006-02-15 04:34:33 |
|       38 | TOM         | MCKELLEN     | 2006-02-15 04:34:33 |
|       39 | GOLDIE      | BRODY        | 2006-02-15 04:34:33 |
|       40 | JOHNNY      | CAGE         | 2006-02-15 04:34:33 |
|       41 | JODIE       | DEGENERES    | 2006-02-15 04:34:33 |
|       42 | TOM         | MIRANDA      | 2006-02-15 04:34:33 |
|       54 | PENELOPE    | PINKETT      | 2006-02-15 04:34:33 |
|       63 | CAMERON     | WRAY         | 2006-02-15 04:34:33 |
|       78 | GROUCHO     | SINATRA      | 2006-02-15 04:34:33 |
|       82 | WOODY       | JOLIE        | 2006-02-15 04:34:33 |
|       91 | CHRISTOPHER | BERRY        | 2006-02-15 04:34:33 |
|      104 | PENELOPE    | CRONYN       | 2006-02-15 04:34:33 |
|      106 | GROUCHO     | DUNST        | 2006-02-15 04:34:33 |
|      111 | CAMERON     | ZELLWEGER    | 2006-02-15 04:34:33 |
|      113 | MORGAN      | HOPKINS      | 2006-02-15 04:34:33 |
|      114 | MORGAN      | MCDORMAND    | 2006-02-15 04:34:33 |
|      115 | HARRISON    | BALE         | 2006-02-15 04:34:33 |
|      120 | PENELOPE    | MONROE       | 2006-02-15 04:34:33 |
|      137 | MORGAN      | WILLIAMS     | 2006-02-15 04:34:33 |
|      140 | WHOOPI      | HURT         | 2006-02-15 04:34:33 |
|      151 | GEOFFREY    | HESTON       | 2006-02-15 04:34:33 |
|      162 | OPRAH       | KILMER       | 2006-02-15 04:34:33 |
|      163 | CHRISTOPHER | WEST         | 2006-02-15 04:34:33 |
|      171 | OLYMPIA     | PFEIFFER     | 2006-02-15 04:34:33 |
|      172 | GROUCHO     | WILLIAMS     | 2006-02-15 04:34:33 |
|      176 | JON         | CHASE        | 2006-02-15 04:34:33 |
|      188 | ROCK        | DUKAKIS      | 2006-02-15 04:34:33 |
|      191 | GREGORY     | GOODING      | 2006-02-15 04:34:33 |
|      192 | JOHN        | SUVARI       | 2006-02-15 04:34:33 |
|      200 | THORA       | TEMPLE       | 2006-02-15 04:34:33 |
+----------+-------------+--------------+---------------------+
36 rows in set (0,01 sec)
```
### Actores que contengan una O en su nombre y en una A en su apellido.



    Actores que contengan dos O en su nombre y en una A en su apellido.
    Actores donde su tercera letra sea B.
    Ciudades que empiezan por a.
    Ciudades que acaban por s.
    Ciudades del country 61.
    Ciudades del country Spain.
    Ciudades con nombres compuestos.
    Películas con una duración entre 80 y 100.
    Peliculas con un rental_rate entre 1 y 3.
    Películas con un titulo de más de 12 letras.
    Peliculas con un rating de PG o G.
    Peliculas que no tengan un rating de NC-17.
    Peliculas con un rating PG y duracion de más de 120.
    ¿Cuantos actores hay?
    ¿Cuántas ciudades tiene el country Spain?
    ¿Cuántos countries hay que empiezan por a?
    Media de duración de peliculas con PG.
    Suma de rental_rate de todas las peliculas.
    Pelicula con mayor duración.
    Película con menor duración.
    Mostrar las ciudades del country Spain (multitabla).
    Mostrar el nombre de la película y el nombre de los actores.
    Mostrar el nombre de la película y el de sus categorías.
    Mostrar el country, la ciudad y dirección de cada miembro del staff.
    Mostrar el country, la ciudad y dirección de cada customer.
    Numero de películas de cada rating
    Cuantas películas ha realizado el actor ED CHASE.
    Media de duración de las películas cada categoría.
