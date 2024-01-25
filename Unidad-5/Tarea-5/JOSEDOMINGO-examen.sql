-- Actualizar el nivel de Bulbasaur.
/** Antes de actualizar
┌────┬───────────┬─────────┬───────┐
│ id │  nombre   │ id_tipo │ nivel │
├────┼───────────┼─────────┼───────┤
│ 1  │ Bulbasaur │ 3       │ 10    │
└────┴───────────┴─────────┴───────┘
**/
UPDATE Pokemon SET nivel=15  WHERE nombre='Bulbasaur';

/** Después
┌────┬───────────┬─────────┬───────┐
│ id │  nombre   │ id_tipo │ nivel │
├────┼───────────┼─────────┼───────┤
│ 1  │ Bulbasaur │ 3       │ 15    │
└────┴───────────┴─────────┴───────┘
**/

-- Cambiar el tipo de Pikachu a "Eléctrico/Rojo".

/** Antes
┌────┬─────────┬─────────┬───────┬────┬───────────┐
│ id │ nombre  │ id_tipo │ nivel │ id │  nombre   │
├────┼─────────┼─────────┼───────┼────┼───────────┤
│ 4  │ Pikachu │ 4       │ 15    │ 4  │ Eléctrico │
└────┴─────────┴─────────┴───────┴────┴───────────┘
**/

UPDATE Tipo as t SET nombre='Eléctrico/Rojo' FROM Pokemon as p WHERE p.id_tipo=T.id AND p.nombre='Pikachu';

/** Después
┌────┬─────────┬─────────┬───────┬────┬────────────────┐
│ id │ nombre  │ id_tipo │ nivel │ id │     nombre     │
├────┼─────────┼─────────┼───────┼────┼────────────────┤
│ 4  │ Pikachu │ 4       │ 15    │ 4  │ Eléctrico/Rojo │
└────┴─────────┴─────────┴───────┴────┴────────────────┘
**/


-- Incrementar el nivel de todos los Pokémon de tipo Agua.

update Pokemon as p set nivel = nivel + 1 from tipo as t where t.nombre='Agua' and p.id_tipo=t.id;
sqlite> select p.* from Pokemon as p, tipo as t where p.id_tipo=t.id and t.nombre='Agua';
/**
┌────┬───────────┬─────────┬───────┐
│ id │  nombre   │ id_tipo │ nivel │
├────┼───────────┼─────────┼───────┤
│ 3  │ Squirtle  │ 1       │ 9     │
│ 6  │ Vaporeon  │ 1       │ 26    │
│ 11 │ Gyarados  │ 1       │ 31    │
│ 18 │ Blastoise │ 1       │ 56    │
└────┴───────────┴─────────┴───────┘
**/
-- Eliminar a Jynx de la lista de Pokémon.

DELETE FROM Pokemon WHERE nombre='Jynx';  

-- Eliminar el tipo "Hielo" de la lista de tipos de Pokémon.
DELETE FROM Tipo WHERE nombre='Hielo';

-- Obtener todos los Pokémon.
SELECT * FROM Pokemon;

/** Resultado
┌────┬────────────┬─────────┬───────┐
│ id │   nombre   │ id_tipo │ nivel │
├────┼────────────┼─────────┼───────┤
│ 1  │ Bulbasaur  │ 3       │ 10    │
│ 2  │ Charmander │ 2       │ 12    │
│ 3  │ Squirtle   │ 1       │ 8     │
│ 4  │ Pikachu    │ 4       │ 15    │
│ 5  │ Geodude    │ 5       │ 11    │
│ 6  │ Vaporeon   │ 1       │ 25    │
│ 7  │ Flareon    │ 2       │ 27    │
│ 8  │ Ivysaur    │ 3       │ 18    │
│ 9  │ Jolteon    │ 4       │ 22    │
│ 10 │ Cubone     │ 5       │ 14    │
│ 11 │ Gyarados   │ 1       │ 30    │
│ 12 │ Arcanine   │ 2       │ 35    │
│ 13 │ Exeggutor  │ 3       │ 40    │
│ 14 │ Raichu     │ 4       │ 38    │
│ 15 │ Sandslash  │ 5       │ 33    │
│ 16 │ Venusaur   │ 3       │ 45    │
│ 17 │ Charizard  │ 2       │ 50    │
│ 18 │ Blastoise  │ 1       │ 55    │
│ 19 │ Electabuzz │ 4       │ 48    │
│ 20 │ Rhydon     │ 5       │ 52    │
│ 21 │ Dragonite  │ 2       │ 60    │
│ 22 │ Flareon    │ 2       │ 65    │
│ 23 │ Venusaur   │ 3       │ 70    │
│ 24 │ Zapdos     │ 4       │ 75    │
│ 25 │ Rhydon     │ 5       │ 80    │
└────┴────────────┴─────────┴───────┘
**/
-- Obtener el nombre y nivel de los Pokémon de tipo Fuego.

SELECT p.nombre, p.nivel, t.nombre FROM Pokemon as p, Tipo as t WHERE t.nombre='Fuego' AND p.id_tipo=t.id;  
┌────────────┬───────┬────────┐
│   nombre   │ nivel │ nombre │
├────────────┼───────┼────────┤
│ Charmander │ 12    │ Fuego  │
│ Flareon    │ 27    │ Fuego  │
│ Arcanine   │ 35    │ Fuego  │
│ Charizard  │ 50    │ Fuego  │
│ Dragonite  │ 60    │ Fuego  │
│ Flareon    │ 65    │ Fuego  │
└────────────┴───────┴────────┘

-- Obtener el nombre de los Pokémon que tienen un nivel superior a 30.

SELECT * FROM Pokemon WHERE nivel > 30;
/** Resultado
┌────┬────────────┬─────────┬───────┐
│ id │   nombre   │ id_tipo │ nivel │
├────┼────────────┼─────────┼───────┤
│ 12 │ Arcanine   │ 2       │ 35    │
│ 13 │ Exeggutor  │ 3       │ 40    │
│ 14 │ Raichu     │ 4       │ 38    │
│ 15 │ Sandslash  │ 5       │ 33    │
│ 16 │ Venusaur   │ 3       │ 45    │
│ 17 │ Charizard  │ 2       │ 50    │
│ 18 │ Blastoise  │ 1       │ 55    │
│ 19 │ Electabuzz │ 4       │ 48    │
│ 20 │ Rhydon     │ 5       │ 52    │
│ 21 │ Dragonite  │ 2       │ 60    │
│ 22 │ Flareon    │ 2       │ 65    │
│ 23 │ Venusaur   │ 3       │ 70    │
│ 24 │ Zapdos     │ 4       │ 75    │
│ 25 │ Rhydon     │ 5       │ 80    │
└────┴────────────┴─────────┴───────┘
**/


-- Obtener el nombre de los Pokémon ordenados por nivel de forma descendente.

SELECT nombre FROM Pokemon ORDER BY nombre;

/** Resultado
┌────────────┐
│   nombre   │
├────────────┤
│ Arcanine   │
│ Blastoise  │
│ Bulbasaur  │
│ Charizard  │
│ Charmander │
│ Cubone     │
│ Dragonite  │
│ Electabuzz │
│ Exeggutor  │
│ Flareon    │
│ Flareon    │
│ Geodude    │
│ Gyarados   │
│ Ivysaur    │
│ Jolteon    │
│ Pikachu    │
│ Raichu     │
│ Rhydon     │
│ Rhydon     │
│ Sandslash  │
│ Squirtle   │
│ Vaporeon   │
│ Venusaur   │
│ Venusaur   │
│ Zapdos     │
└────────────┘
**/

-- Obtener la cantidad de Pokémon por tipo.

SELECT t.nombre, COUNT(*) as total_pokemon FROM Pokemon as p, Tipo as t WHERE p.id_tipo=t.id GROUP BY t.nombre; 
/** Resultado
┌────────────────┬───────────────┐
│     nombre     │ total_pokemon │
├────────────────┼───────────────┤
│ Agua           │ 4             │
│ Eléctrico/Rojo │ 5             │
│ Fuego          │ 6             │
│ Planta         │ 5             │
│ Tierra         │ 5             │
└────────────────┴───────────────┘
**/

-- Obtener la información completa de un Pokémon específico. Selecciona el que desees.

SELECT * FROM Pokemon as p, Tipo as T WHERE p.nombre='Pikachu' AND p.id_tipo=t.id;  
┌────┬─────────┬─────────┬───────┬────┬───────────┐
│ id │ nombre  │ id_tipo │ nivel │ id │  nombre   │
├────┼─────────┼─────────┼───────┼────┼───────────┤
│ 4  │ Pikachu │ 4       │ 15    │ 4  │ Eléctrico │
└────┴─────────┴─────────┴───────┴────┴───────────┘
-- Obtener el promedio de niveles de todos los Pokémon.

SELECT AVG(nivel) as nivel_promedio FROM Pokemon;
/** Resultado
┌────────────────┐
│ nivel_promedio │
├────────────────┤
│ 37.52          │
└────────────────┘
**/

-- Obtener el nombre del Pokémon de mayor nivel.

SELECT nombre, MAX(nivel) FROM Pokemon;        
/**        
┌────────┬────────────┐
│ nombre │ MAX(nivel) │
├────────┼────────────┤
│ Rhydon │ 80         │
└────────┴────────────┘
**/

-- Actualizar el nombre de Bulbasaur a "Bulbasaur Nv. 15":
/** Antes
┌────┬───────────┬─────────┬───────┐
│ id │  nombre   │ id_tipo │ nivel │
├────┼───────────┼─────────┼───────┤
│ 1  │ Bulbasaur │ 3       │ 10    │
└────┴───────────┴─────────┴───────┘
**/
UPDATE Pokemon SET nombre='Bulbasaur Nv. 15' WHERE nombre='Bulbasaur'; 
/** Resultado
┌────┬──────────────────┬─────────┬───────┐
│ id │      nombre      │ id_tipo │ nivel │
├────┼──────────────────┼─────────┼───────┤
│ 1  │ Bulbasaur Nv. 15 │ 3       │ 10    │
└────┴──────────────────┴─────────┴───────┘
**/

-- Obtener los Pokémon cuyo nivel es igual a 50.

 SELECT * FROM Pokemon WHERE nivel=50;
┌────┬───────────┬─────────┬───────┐
│ id │  nombre   │ id_tipo │ nivel │
├────┼───────────┼─────────┼───────┤
│ 17 │ Charizard │ 2       │ 50    │
└────┴───────────┴─────────┴───────┘

-- Eliminar todos los Pokémon de nivel 40.

┌────────────────┐
│ total_nivel_40 │
├────────────────┤
│ 1              │
└────────────────┘
DELETE FROM Pokemon WHERE nivel=40;

┌────────────────┐
│ total_nivel_40 │
├────────────────┤
│ 0              │
└────────────────┘



-- Obtener el tipo y nivel de Pikachu.

SELECT t.nombre, p.* FROM Pokemon as p, Tipo as t WHERE t.nombre='Planta' AND p.nivel > 20 AND p.id_tipo=t.id ;  
┌────────┬────┬───────────┬─────────┬───────┐
│ nombre │ id │  nombre   │ id_tipo │ nivel │
├────────┼────┼───────────┼─────────┼───────┤
│ Planta │ 13 │ Exeggutor │ 3       │ 40    │
│ Planta │ 16 │ Venusaur  │ 3       │ 45    │
│ Planta │ 23 │ Venusaur  │ 3       │ 70    │
└────────┴────┴───────────┴─────────┴───────┘

-- Obtener los Pokémon de tipo Planta con nivel superior a 20:

SELECT t.nombre, p.* FROM Pokemon as p, Tipo as t WHERE t.nombre='Planta' AND p.nivel > 20 AND p.id_tipo=t.id ; 
┌────────┬────┬──────────┬─────────┬───────┐
│ nombre │ id │  nombre  │ id_tipo │ nivel │
├────────┼────┼──────────┼─────────┼───────┤
│ Planta │ 16 │ Venusaur │ 3       │ 45    │
│ Planta │ 23 │ Venusaur │ 3       │ 70    │
└────────┴────┴──────────┴─────────┴───────┘

-- Actualizar el tipo de Pikachu a "Eléctrico/Azul":

UPDATE Tipo as t SET nombre='Eléctrico/Azul' FROM Pokemon as p WHERE p.id_tipo=T.id AND p.nombre='Pikachu';

/** Resultado
┌────┬─────────┬─────────┬───────┬────┬────────────────┐
│ id │ nombre  │ id_tipo │ nivel │ id │     nombre     │
├────┼─────────┼─────────┼───────┼────┼────────────────┤
│ 4  │ Pikachu │ 4       │ 15    │ 4  │ Eléctrico/Azul │
└────┴─────────┴─────────┴───────┴────┴────────────────┘
**/


-- Eliminar todos los Pokémon de tipo Planta.
/** Antes
┌────────┬───────────────┐
│ nombre │ total_pokemon │
├────────┼───────────────┤
│ Planta │ 5             │
└────────┴───────────────┘
**/
DELETE FROM Pokemon where id_tipo in (select id from tipo Where nombre='Planta');

/** Despues

**/

-- Obtener los Pokémon con nombre y tipo ordenados alfabéticamente.

SELECT p.nombre, t.nombre FROM Pokemon as p, Tipo as t  WHERE p.id_tipo=t.id ORDER BY p.nombre, t.nombre;  
┌──────────────────┬───────────┐
│      nombre      │  nombre   │
├──────────────────┼───────────┤
│ Arcanine         │ Fuego     │
│ Blastoise        │ Agua      │
│ Bulbasaur Nv. 15 │ Planta    │
│ Charizard        │ Fuego     │
│ Charmander       │ Fuego     │
│ Cubone           │ Tierra    │
│ Dragonite        │ Fuego     │
│ Electabuzz       │ Eléctrico │
│ Exeggutor        │ Planta    │
│ Flareon          │ Fuego     │
│ Flareon          │ Fuego     │
│ Geodude          │ Tierra    │
│ Gyarados         │ Agua      │
│ Ivysaur          │ Planta    │
│ Jolteon          │ Eléctrico │
│ Pikachu          │ Eléctrico │
│ Raichu           │ Eléctrico │
│ Rhydon           │ Tierra    │
│ Rhydon           │ Tierra    │
│ Sandslash        │ Tierra    │
│ Squirtle         │ Agua      │
│ Vaporeon         │ Agua      │
│ Venusaur         │ Planta    │
│ Venusaur         │ Planta    │
│ Zapdos           │ Eléctrico │
└──────────────────┴───────────┘


-- Obtén todos los Pokémon cuyos nombres contienen las letras 'sa'.

SELECT * FROM Pokemon WHERE (nombre LIKE '%sa%');  
┌────┬──────────────────┬─────────┬───────┐
│ id │      nombre      │ id_tipo │ nivel │
├────┼──────────────────┼─────────┼───────┤
│ 1  │ Bulbasaur Nv. 15 │ 3       │ 10    │
│ 8  │ Ivysaur          │ 3       │ 18    │
│ 15 │ Sandslash        │ 5       │ 33    │
│ 16 │ Venusaur         │ 3       │ 45    │
│ 23 │ Venusaur         │ 3       │ 70    │
└────┴──────────────────┴─────────┴───────┘



-- Encuentra todos los Pokémon cuyo nivel es 40, 50 o 60.

SELECT * FROM Pokemon WHERE nivel=40 OR nivel=50 OR nivel=60; 
┌────┬───────────┬─────────┬───────┐
│ id │  nombre   │ id_tipo │ nivel │
├────┼───────────┼─────────┼───────┤
│ 17 │ Charizard │ 2       │ 50    │
│ 21 │ Dragonite │ 2       │ 60    │
└────┴───────────┴─────────┴───────┘

-- Obtén todos los Pokémon de tipo Fuego cuyos nombres comienzan con la letra 'C'.

SELECT p.*, t.* FROM Pokemon as p, Tipo as t WHERE (p.nombre LIKE 'C%') AND t.nombre='Fuego' AND p.id_tipo=t.id;  
┌────┬────────────┬─────────┬───────┬────┬────────┐
│ id │   nombre   │ id_tipo │ nivel │ id │ nombre │
├────┼────────────┼─────────┼───────┼────┼────────┤
│ 2  │ Charmander │ 2       │ 12    │ 2  │ Fuego  │
│ 17 │ Charizard  │ 2       │ 50    │ 2  │ Fuego  │
└────┴────────────┴─────────┴───────┴────┴────────┘

-- Encuentra los nombres y tipos de los Pokémon cuyo nivel es mayor que el promedio de todos los Pokémon en la base de datos.

SELECT p.nombre, t.nombre FROM Pokemon as p, Tipo as t  WHERE nivel > (SELECT AVG(nivel) FROM Pokemon) AND p.id_tipo=t.id; 
┌────────────┬───────────┐
│   nombre   │  nombre   │
├────────────┼───────────┤
│ Exeggutor  │ Planta    │
│ Raichu     │ Eléctrico │
│ Venusaur   │ Planta    │
│ Charizard  │ Fuego     │
│ Blastoise  │ Agua      │
│ Electabuzz │ Eléctrico │
│ Rhydon     │ Tierra    │
│ Dragonite  │ Fuego     │
│ Flareon    │ Fuego     │
│ Venusaur   │ Planta    │
│ Zapdos     │ Eléctrico │
│ Rhydon     │ Tierra    │
└────────────┴───────────┘
