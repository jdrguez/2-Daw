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
```sql
SELECT * FROM actor where first_name REGEXP 'O' AND LAST_NAME REGEXP 'A';
```
### Actores que contengan dos O en su nombre y en una A en su apellido.
SELECT * FROM actor where first_name REGEXP '.o*.*o' AND LAST_NAME REGEXP 'A';
### Actores donde su tercera letra sea B.
SELECT * FROM actor where first_name REGEXP '^..B';
### Ciudades que empiezan por a.
SELECT * FROM city where city REGEXP '^a';
### Ciudades que acaban por s.
SELECT * FROM city where city REGEXP 's$';
### Ciudades del country 61.
SELECT * FROM city where country_id = '61';
### Ciudades del country Spain.
SELECT * FROM city as ci join country as co on ci.country_id=co.country_id where co.country = 'Spain';
### Ciudades con nombres compuestos.
SELECT * FROM city WHERE city regexp ' ';/* 
### Películas con una duración entre 80 y 100.
SELECT * FROM film WHERE length BETWEEN 80 and 100;
### Peliculas con un rental_rate entre 1 y 3.
SELECT * FROM film WHEREwhere rental_rate BETWEEN 1 and 3;
### Películas con un titulo de más de 12 letras.
select * from film where title regexp '.{12,}';
### Peliculas con un rating de PG o G.
select * from film where rating in ('PG', 'G');

### Peliculas que no tengan un rating de NC-17.

### Peliculas con un rating PG y duracion de más de 120.
SELECT * FROM film where rating = 'PG' and length > 120;
### ¿Cuantos actores hay?
select count(actor_id) as num_actores from actor;

### ¿Cuántas ciudades tiene el country Spain?
SELECT count(city) as ciudades_Spain FROM city as ci join country as co on ci.country_id=co.country_id where co.country = 'Spain';
### ¿Cuántos countries hay que empiezan por a?
select count(country) as pais_por_a from country where country regexp '^A';
### Media de duración de peliculas con PG.
SELECT avg(length) as media_duración_pg from film where rating = 'PG';
### Suma de rental_rate de todas las peliculas.
SELECT SUM(rental_rate) as sum_rental_rate from film;
### Pelicula con mayor duración.
select * from film order by length desc limit 1;
### Película con menor duración.
select * from film order by length limit 1;
### Mostrar las ciudades del country Spain (multitabla).
SELECT * FROM city as ci join country as co on ci.country_id=co.country_id where co.country = 'Spain';
### Mostrar el nombre de la película y el nombre de los actores.
select f.title, a.first_name, a.last_name from film as f join film_actor as fa on f.film_id=fa.film_id join actor as a on fa.actor_id=a.actor_id;
### Mostrar el nombre de la película y el de sus categorías.
select f.title, c.name from film as f join film_category as fc on f.film_id=fc.film_id join category as c on fc.category_id=c.category_id;
### Mostrar el country, la ciudad y dirección de cada miembro del staff.
select c.country, ci.city, a.address, s.staff_id, s.first_name, s.last_name from country as c join city as ci on ci.country_id=c.country_id join address as a on a.city_id=ci.city_id join staff as s on a.address_id=s.address_id;
### Mostrar el country, la ciudad y dirección de cada customer.
select c.country, ci.city, a.address, cu.first_name, cu.last_name, cu.customer_id from country as c join city as ci on ci.country_id=c.country_id join address as a on a.city_id=ci.city_id join customer as cu on a.adress_id=cu.adress_id;

### Numero de películas de cada rating
select rating, count(film_id) as cantidad from film group by rating;
### Cuantas películas ha realizado el actor ED CHASE.
select count(f.film_id) as total_películas from film as f join film_actor as fa on f.film_id=fa.film_id join actor as a on fa.actor_id=a.actor_id where a.first_name = 'ED' and last_name = 'CHASE';

### Media de duración de las películas cada categoría.
select rating, avg(length) as cantidad from film as f join film_category as fc on f. group by c.category_id;
