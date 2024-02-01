-- Selección de libros cuyo título comienza con "H".
SELECT * FROM libro WHERE titulo regexp '^H';
-- Libros escritos por autores cuyos nombres terminan con "ing".
SELECT * FROM libro as l, autor as a WHERE a.nombre regexp 'ing$' AND l.autor_id=a.id;
-- Libros con títulos que contienen la palabra "and" en cualquier posición.
SELECT * FROM libro WHERE titulo regexp 'and'

/** Obtenido
┌────────┬──────────────────────────────────┬──────────┬─────────────────────────┬────────┐
│ codigo │              titulo              │ autor_id │        editorial        │ precio │
├────────┼──────────────────────────────────┼──────────┼─────────────────────────┼────────┤
│ 15     │ The Old Man and the Sea          │ 17       │ Charles Scribner's Sons │ 18.95  │
│ 20     │ Alice's Adventures in Wonderland │ 22       │ Macmillan               │ 11.5   │
│ 28     │ War and Peace                    │ 26       │ The Russian Messenger   │ 33.25  │
│ 29     │ Crime and Punishment             │ 30       │ The Russian Messenger   │ 19.99  │
└────────┴──────────────────────────────────┴──────────┴─────────────────────────┴────────┘
**/

-- Libros cuyo título comienza con una vocal.
SELECT * FROM libro WHERE titulo regexp '^[aeiouAEIOU]';


/** Obtenido
┌────────┬──────────────────────────────────┬──────────┬───────────────────────┬────────┐
│ codigo │              titulo              │ autor_id │       editorial       │ precio │
├────────┼──────────────────────────────────┼──────────┼───────────────────────┼────────┤
│ 4      │ One Hundred Years of Solitude    │ 9        │ Harper & Row          │ 22.5   │
│ 20     │ Alice's Adventures in Wonderland │ 22       │ Macmillan             │ 11.5   │
│ 24     │ Anna Karenina                    │ 26       │ The Russian Messenger │ 23.99  │
└────────┴──────────────────────────────────┴──────────┴───────────────────────┴────────┘
**/
-- Libros cuyo autor tiene al menos una vocal repetida.
SELECT * FROM libro as l, autor as a WHERE a.nombre regexp '[aeiouAEIOU]+' AND l.autor_id=a.id;


/** Obtenido
┌────────┬─────────────────┬──────────┬─────────────────┬────────┬────┬───────────────┐
│ codigo │     titulo      │ autor_id │    editorial    │ precio │ id │    nombre     │
├────────┼─────────────────┼──────────┼─────────────────┼────────┼────┼───────────────┤
│ 5      │ Brave New World │ 3        │ Chatto & Windus │ 17.99  │ 3  │ George Orwell │
└────────┴─────────────────┴──────────┴─────────────────┴────────┴────┴───────────────┘
**/
-- Libros con precios que tienen dos dígitos decimales exactos.


SELECT * FROM libro WHERE precio regexp '\d+\.\d{2}$';
/** Obtenido
┌────────┬───────────────────────────────────┬──────────┬─────────────────────────────────────────────┬────────┐
│ codigo │              titulo               │ autor_id │                  editorial                  │ precio │
├────────┼───────────────────────────────────┼──────────┼─────────────────────────────────────────────┼────────┤
│ 1      │ The Great Gatsby                  │ 6        │ Charles Scribner's Sons                     │ 20.99  │
│ 2      │ To Kill a Mockingbird             │ 7        │ J.B. Lippincott & Co.                       │ 15.95  │
│ 3      │ The Catcher in the Rye            │ 8        │ Little, Brown and Company                   │ 18.75  │
│ 5      │ Brave New World                   │ 3        │ Chatto & Windus                             │ 17.99  │
│ 6      │ The Hobbit                        │ 10       │ George Allen & Unwin                        │ 24.99  │
│ 8      │ The Chronicles of Narnia          │ 11       │ Geoffrey Bles                               │ 28.99  │
│ 9      │ The Odyssey                       │ 12       │ Homer                                       │ 14.95  │
│ 10     │ The Iliad                         │ 12       │ Homer                                       │ 14.95  │
│ 11     │ Moby-Dick                         │ 13       │ Harper & Brothers                           │ 19.99  │
│ 12     │ The Road                          │ 14       │ Alfred A. Knopf                             │ 16.75  │
│ 14     │ Wuthering Heights                 │ 16       │ Emily Brontë                                │ 12.99  │
│ 15     │ The Old Man and the Sea           │ 17       │ Charles Scribner's Sons                     │ 18.95  │
│ 16     │ The Count of Monte Cristo         │ 18       │ Pétion                                      │ 27.99  │
│ 18     │ The Adventures of Sherlock Holmes │ 20       │ George Newnes                               │ 16.99  │
│ 19     │ Frankenstein                      │ 21       │ Lackington, Hughes, Harding, Mavor, & Jones │ 13.25  │
│ 21     │ The Prince                        │ 23       │ Niccolò Machiavelli                         │ 10.99  │
│ 22     │ Don Quixote                       │ 24       │ Francisco de Robles                         │ 26.75  │
│ 24     │ Anna Karenina                     │ 26       │ The Russian Messenger                       │ 23.99  │
│ 25     │ Les Misérables                    │ 27       │ A. Lacroix, Verboeckhoven & Cie.            │ 29.75  │
│ 26     │ The Jungle Book                   │ 28       │ Macmillan Publishers                        │ 14.99  │
│ 28     │ War and Peace                     │ 26       │ The Russian Messenger                       │ 33.25  │
│ 29     │ Crime and Punishment              │ 30       │ The Russian Messenger                       │ 19.99  │
└────────┴───────────────────────────────────┴──────────┴─────────────────────────────────────────────┴────────┘
**/


-- Libros cuyos títulos tienen al menos tres palabras.
SELECT * FROM libro WHERE titulo like '% % %';
/**
┌────────┬───────────────────────────────────┬──────────┬───────────────────────────┬────────┐
│ codigo │              titulo               │ autor_id │         editorial         │ precio │
├────────┼───────────────────────────────────┼──────────┼───────────────────────────┼────────┤
│ 1      │ The Great Gatsby                  │ 6        │ Charles Scribner's Sons   │ 20.99  │
│ 2      │ To Kill a Mockingbird             │ 7        │ J.B. Lippincott & Co.     │ 15.95  │
│ 3      │ The Catcher in the Rye            │ 8        │ Little, Brown and Company │ 18.75  │
│ 4      │ One Hundred Years of Solitude     │ 9        │ Harper & Row              │ 22.5   │
│ 5      │ Brave New World                   │ 3        │ Chatto & Windus           │ 17.99  │
│ 7      │ The Lord of the Rings             │ 10       │ George Allen & Unwin      │ 35.5   │
│ 8      │ The Chronicles of Narnia          │ 11       │ Geoffrey Bles             │ 28.99  │
│ 13     │ The Grapes of Wrath               │ 15       │ The Viking Press          │ 21.5   │
│ 15     │ The Old Man and the Sea           │ 17       │ Charles Scribner's Sons   │ 18.95  │
│ 16     │ The Count of Monte Cristo         │ 18       │ Pétion                    │ 27.99  │
│ 17     │ The Picture of Dorian Gray        │ 19       │ Ward, Lock, and Company   │ 14.5   │
│ 18     │ The Adventures of Sherlock Holmes │ 20       │ George Newnes             │ 16.99  │
│ 20     │ Alice's Adventures in Wonderland  │ 22       │ Macmillan                 │ 11.5   │
│ 23     │ The Divine Comedy                 │ 25       │ Dante Alighieri           │ 20.5   │
│ 26     │ The Jungle Book                   │ 28       │ Macmillan Publishers      │ 14.99  │
│ 27     │ The Wind in the Willows           │ 29       │ Methuen & Co.             │ 17.5   │
│ 28     │ War and Peace                     │ 26       │ The Russian Messenger     │ 33.25  │
│ 29     │ Crime and Punishment              │ 30       │ The Russian Messenger     │ 19.99  │
└────────┴───────────────────────────────────┴──────────┴───────────────────────────┴────────┘
**/


-- Obtener todos los autores cuyo nombre empieza con la letra "A":


SELECT * FROM autor WHERE nombre regexp '^A';
/**
┌────┬─────────────────┐
│ id │     nombre      │
├────┼─────────────────┤
│ 5  │ Agatha Christie │
└────┴─────────────────┘
**/


-- Seleccionar los libros cuyo título contiene la palabra "SQL":
SELECT * FROM libro WHERE titulo regexp 'SQL';


-- Obtener todos los autores cuyo nombre termina con "ez":


SELECT * FROM autor WHERE nombre regexp 'ez$';


-- Obtener todos los autores cuyo nombre tiene al menos 5 caracteres:
SELECT * FROM autor WHERE nombre regexp '.{5}';
/**
┌────┬─────────────────┐
│ id │     nombre      │
├────┼─────────────────┤
│ 1  │ J.K. Rowling    │
│ 2  │ Stephen King    │
│ 3  │ George Orwell   │
│ 4  │ Jane Austen     │
│ 5  │ Agatha Christie │
└────┴─────────────────┘
**/


-- Seleccionar los libros cuya editorial es diferente de "EditorialX":
SELECT * FROM libro WHERE editorial not regexp 'EditorialX';
/**
┌────────┬───────────────────────────────────┬──────────┬─────────────────────────────────────────────┬────────┐
│ codigo │              titulo               │ autor_id │                  editorial                  │ precio │
├────────┼───────────────────────────────────┼──────────┼─────────────────────────────────────────────┼────────┤
│ 1      │ The Great Gatsby                  │ 6        │ Charles Scribner's Sons                     │ 20.99  │
│ 2      │ To Kill a Mockingbird             │ 7        │ J.B. Lippincott & Co.                       │ 15.95  │
│ 3      │ The Catcher in the Rye            │ 8        │ Little, Brown and Company                   │ 18.75  │
│ 4      │ One Hundred Years of Solitude     │ 9        │ Harper & Row                                │ 22.5   │
│ 5      │ Brave New World                   │ 3        │ Chatto & Windus                             │ 17.99  │
│ 6      │ The Hobbit                        │ 10       │ George Allen & Unwin                        │ 24.99  │
│ 7      │ The Lord of the Rings             │ 10       │ George Allen & Unwin                        │ 35.5   │
│ 8      │ The Chronicles of Narnia          │ 11       │ Geoffrey Bles                               │ 28.99  │
│ 9      │ The Odyssey                       │ 12       │ Homer                                       │ 14.95  │
│ 10     │ The Iliad                         │ 12       │ Homer                                       │ 14.95  │
│ 11     │ Moby-Dick                         │ 13       │ Harper & Brothers                           │ 19.99  │
│ 12     │ The Road                          │ 14       │ Alfred A. Knopf                             │ 16.75  │
│ 13     │ The Grapes of Wrath               │ 15       │ The Viking Press                            │ 21.5   │
│ 14     │ Wuthering Heights                 │ 16       │ Emily Brontë                                │ 12.99  │
│ 15     │ The Old Man and the Sea           │ 17       │ Charles Scribner's Sons                     │ 18.95  │
│ 16     │ The Count of Monte Cristo         │ 18       │ Pétion                                      │ 27.99  │
│ 17     │ The Picture of Dorian Gray        │ 19       │ Ward, Lock, and Company                     │ 14.5   │
│ 18     │ The Adventures of Sherlock Holmes │ 20       │ George Newnes                               │ 16.99  │
│ 19     │ Frankenstein                      │ 21       │ Lackington, Hughes, Harding, Mavor, & Jones │ 13.25  │
│ 20     │ Alice's Adventures in Wonderland  │ 22       │ Macmillan                                   │ 11.5   │
│ 21     │ The Prince                        │ 23       │ Niccolò Machiavelli                         │ 10.99  │
│ 22     │ Don Quixote                       │ 24       │ Francisco de Robles                         │ 26.75  │
│ 23     │ The Divine Comedy                 │ 25       │ Dante Alighieri                             │ 20.5   │
│ 24     │ Anna Karenina                     │ 26       │ The Russian Messenger                       │ 23.99  │
│ 25     │ Les Misérables                    │ 27       │ A. Lacroix, Verboeckhoven & Cie.            │ 29.75  │
│ 26     │ The Jungle Book                   │ 28       │ Macmillan Publishers                        │ 14.99  │
│ 27     │ The Wind in the Willows           │ 29       │ Methuen & Co.                               │ 17.5   │
│ 28     │ War and Peace                     │ 26       │ The Russian Messenger                       │ 33.25  │
│ 29     │ Crime and Punishment              │ 30       │ The Russian Messenger                       │ 19.99  │
└────────┴───────────────────────────────────┴──────────┴─────────────────────────────────────────────┴────────┘
**/


-- Obtener todos los autores cuyo nombre contiene al menos una vocal:


SELECT * FROM autor  WHERE nombre regexp '[aeiouAEIOU]+';
/**
┌────┬─────────────────┐
│ id │     nombre      │
├────┼─────────────────┤
│ 1  │ J.K. Rowling    │
│ 2  │ Stephen King    │
│ 3  │ George Orwell   │
│ 4  │ Jane Austen     │
│ 5  │ Agatha Christie │
└────┴─────────────────┘
**/


-- Seleccionar los libros cuyo título comienza con una letra mayúscula:
SELECT * FROM libro WHERE titulo regexp '^[A-Z]';
/**
┌────────┬───────────────────────────────────┬──────────┬─────────────────────────────────────────────┬────────┐
│ codigo │              titulo               │ autor_id │                  editorial                  │ precio │
├────────┼───────────────────────────────────┼──────────┼─────────────────────────────────────────────┼────────┤
│ 1      │ The Great Gatsby                  │ 6        │ Charles Scribner's Sons                     │ 20.99  │
│ 2      │ To Kill a Mockingbird             │ 7        │ J.B. Lippincott & Co.                       │ 15.95  │
│ 3      │ The Catcher in the Rye            │ 8        │ Little, Brown and Company                   │ 18.75  │
│ 4      │ One Hundred Years of Solitude     │ 9        │ Harper & Row                                │ 22.5   │
│ 5      │ Brave New World                   │ 3        │ Chatto & Windus                             │ 17.99  │
│ 6      │ The Hobbit                        │ 10       │ George Allen & Unwin                        │ 24.99  │
│ 7      │ The Lord of the Rings             │ 10       │ George Allen & Unwin                        │ 35.5   │
│ 8      │ The Chronicles of Narnia          │ 11       │ Geoffrey Bles                               │ 28.99  │
│ 9      │ The Odyssey                       │ 12       │ Homer                                       │ 14.95  │
│ 10     │ The Iliad                         │ 12       │ Homer                                       │ 14.95  │
│ 11     │ Moby-Dick                         │ 13       │ Harper & Brothers                           │ 19.99  │
│ 12     │ The Road                          │ 14       │ Alfred A. Knopf                             │ 16.75  │
│ 13     │ The Grapes of Wrath               │ 15       │ The Viking Press                            │ 21.5   │
│ 14     │ Wuthering Heights                 │ 16       │ Emily Brontë                                │ 12.99  │
│ 15     │ The Old Man and the Sea           │ 17       │ Charles Scribner's Sons                     │ 18.95  │
│ 16     │ The Count of Monte Cristo         │ 18       │ Pétion                                      │ 27.99  │
│ 17     │ The Picture of Dorian Gray        │ 19       │ Ward, Lock, and Company                     │ 14.5   │
│ 18     │ The Adventures of Sherlock Holmes │ 20       │ George Newnes                               │ 16.99  │
│ 19     │ Frankenstein                      │ 21       │ Lackington, Hughes, Harding, Mavor, & Jones │ 13.25  │
│ 20     │ Alice's Adventures in Wonderland  │ 22       │ Macmillan                                   │ 11.5   │
│ 21     │ The Prince                        │ 23       │ Niccolò Machiavelli                         │ 10.99  │
│ 22     │ Don Quixote                       │ 24       │ Francisco de Robles                         │ 26.75  │
│ 23     │ The Divine Comedy                 │ 25       │ Dante Alighieri                             │ 20.5   │
│ 24     │ Anna Karenina                     │ 26       │ The Russian Messenger                       │ 23.99  │
│ 25     │ Les Misérables                    │ 27       │ A. Lacroix, Verboeckhoven & Cie.            │ 29.75  │
│ 26     │ The Jungle Book                   │ 28       │ Macmillan Publishers                        │ 14.99  │
│ 27     │ The Wind in the Willows           │ 29       │ Methuen & Co.                               │ 17.5   │
│ 28     │ War and Peace                     │ 26       │ The Russian Messenger                       │ 33.25  │
│ 29     │ Crime and Punishment              │ 30       │ The Russian Messenger                       │ 19.99  │
└────────┴───────────────────────────────────┴──────────┴─────────────────────────────────────────────┴────────┘
**/
-- Obtener todos los autores cuyo nombre no contiene la letra "r":
SELECT * FROM autor  WHERE nombre not regexp 'r';
/**
┌────┬──────────────┐
│ id │    nombre    │
├────┼──────────────┤
│ 1  │ J.K. Rowling │
│ 2  │ Stephen King │
│ 4  │ Jane Austen  │
└────┴──────────────
**/
-- Seleccionar los libros cuya editorial empieza con la letra "P":
SELECT * FROM libro WHERE editorial  regexp '^P';
/**
┌────────┬───────────────────────────┬──────────┬───────────┬────────┐
│ codigo │          titulo           │ autor_id │ editorial │ precio │
├────────┼───────────────────────────┼──────────┼───────────┼────────┤
│ 16     │ The Count of Monte Cristo │ 18       │ Pétion    │ 27.99  │
└────────┴───────────────────────────┴──────────┴───────────┴────────┘
**/
-- Obtener todos los autores cuyo nombre tiene exactamente 6 caracteres:
SELECT * FROM autor  WHERE nombre  regexp '^.{6}$';


-- Seleccionar los libros cuyo título contiene al menos un número:
SELECT * FROM libro WHERE titulo  regexp '\d+';

-- Obtener todos los autores cuyo nombre inicia con una vocal:

SELECT * FROM autor  WHERE nombre  regexp '^[AEIOU]';
/**
┌────┬─────────────────┐
│ id │     nombre      │
├────┼─────────────────┤
│ 5  │ Agatha Christie │
└────┴─────────────────┘
**/

-- Obtener todos los autores cuyo nombre no contiene espacios en blanco:
SELECT * FROM autor  WHERE nombre not regexp '\s';

-- Seleccionar los libros cuyo título termina con una vocal:
SELECT * FROM libro WHERE titulo  regexp '[aeiou]$';
/**
┌────────┬───────────────────────────────┬──────────┬───────────────────────────┬────────┐
│ codigo │            titulo             │ autor_id │         editorial         │ precio │
├────────┼───────────────────────────────┼──────────┼───────────────────────────┼────────┤
│ 3      │ The Catcher in the Rye        │ 8        │ Little, Brown and Company │ 18.75  │
│ 4      │ One Hundred Years of Solitude │ 9        │ Harper & Row              │ 22.5   │
│ 8      │ The Chronicles of Narnia      │ 11       │ Geoffrey Bles             │ 28.99  │
│ 15     │ The Old Man and the Sea       │ 17       │ Charles Scribner's Sons   │ 18.95  │
│ 16     │ The Count of Monte Cristo     │ 18       │ Pétion                    │ 27.99  │
│ 21     │ The Prince                    │ 23       │ Niccolò Machiavelli       │ 10.99  │
│ 22     │ Don Quixote                   │ 24       │ Francisco de Robles       │ 26.75  │
│ 24     │ Anna Karenina                 │ 26       │ The Russian Messenger     │ 23.99  │
│ 28     │ War and Peace                 │ 26       │ The Russian Messenger     │ 33.25  │
└────────┴───────────────────────────────┴──────────┴───────────────────────────┴────────┘
**/

-- Obtener todos los autores cuyo nombre contiene la secuencia "er":

SELECT * FROM autor  WHERE nombre  regexp 'er';

-- Seleccionar los libros cuyo título empieza con la palabra "The":
SELECT * FROM libro WHERE titulo  regexp '^The';
/**
┌────────┬───────────────────────────────────┬──────────┬───────────────────────────┬────────┐
│ codigo │              titulo               │ autor_id │         editorial         │ precio │
├────────┼───────────────────────────────────┼──────────┼───────────────────────────┼────────┤
│ 1      │ The Great Gatsby                  │ 6        │ Charles Scribner's Sons   │ 20.99  │
│ 3      │ The Catcher in the Rye            │ 8        │ Little, Brown and Company │ 18.75  │
│ 6      │ The Hobbit                        │ 10       │ George Allen & Unwin      │ 24.99  │
│ 7      │ The Lord of the Rings             │ 10       │ George Allen & Unwin      │ 35.5   │
│ 8      │ The Chronicles of Narnia          │ 11       │ Geoffrey Bles             │ 28.99  │
│ 9      │ The Odyssey                       │ 12       │ Homer                     │ 14.95  │
│ 10     │ The Iliad                         │ 12       │ Homer                     │ 14.95  │
│ 12     │ The Road                          │ 14       │ Alfred A. Knopf           │ 16.75  │
│ 13     │ The Grapes of Wrath               │ 15       │ The Viking Press          │ 21.5   │
│ 15     │ The Old Man and the Sea           │ 17       │ Charles Scribner's Sons   │ 18.95  │
│ 16     │ The Count of Monte Cristo         │ 18       │ Pétion                    │ 27.99  │
│ 17     │ The Picture of Dorian Gray        │ 19       │ Ward, Lock, and Company   │ 14.5   │
│ 18     │ The Adventures of Sherlock Holmes │ 20       │ George Newnes             │ 16.99  │
│ 21     │ The Prince                        │ 23       │ Niccolò Machiavelli       │ 10.99  │
│ 23     │ The Divine Comedy                 │ 25       │ Dante Alighieri           │ 20.5   │
│ 26     │ The Jungle Book                   │ 28       │ Macmillan Publishers      │ 14.99  │
│ 27     │ The Wind in the Willows           │ 29       │ Methuen & Co.             │ 17.5   │
└────────┴───────────────────────────────────┴──────────┴───────────────────────────┴────────┘
**/
-- Obtener todos los autores cuyo nombre tiene al menos una letra mayúscula:
SELECT * FROM autor  WHERE nombre  regexp '[A-Z]+';
/**
┌────┬─────────────────┐
│ id │     nombre      │
├────┼─────────────────┤
│ 1  │ J.K. Rowling    │
│ 2  │ Stephen King    │
│ 3  │ George Orwell   │
│ 4  │ Jane Austen     │
│ 5  │ Agatha Christie │
└────┴─────────────────┘
**/
-- Seleccionar los libros cuyo precio es un número decimal con exactamente dos decimales:

SELECT * FROM libro WHERE precio regexp '\d+\.\d{2}$';
/**
┌────────┬───────────────────────────────────┬──────────┬─────────────────────────────────────────────┬────────┐
│ codigo │              titulo               │ autor_id │                  editorial                  │ precio │
├────────┼───────────────────────────────────┼──────────┼─────────────────────────────────────────────┼────────┤
│ 1      │ The Great Gatsby                  │ 6        │ Charles Scribner's Sons                     │ 20.99  │
│ 2      │ To Kill a Mockingbird             │ 7        │ J.B. Lippincott & Co.                       │ 15.95  │
│ 3      │ The Catcher in the Rye            │ 8        │ Little, Brown and Company                   │ 18.75  │
│ 5      │ Brave New World                   │ 3        │ Chatto & Windus                             │ 17.99  │
│ 6      │ The Hobbit                        │ 10       │ George Allen & Unwin                        │ 24.99  │
│ 8      │ The Chronicles of Narnia          │ 11       │ Geoffrey Bles                               │ 28.99  │
│ 9      │ The Odyssey                       │ 12       │ Homer                                       │ 14.95  │
│ 10     │ The Iliad                         │ 12       │ Homer                                       │ 14.95  │
│ 11     │ Moby-Dick                         │ 13       │ Harper & Brothers                           │ 19.99  │
│ 12     │ The Road                          │ 14       │ Alfred A. Knopf                             │ 16.75  │
│ 14     │ Wuthering Heights                 │ 16       │ Emily Brontë                                │ 12.99  │
│ 15     │ The Old Man and the Sea           │ 17       │ Charles Scribner's Sons                     │ 18.95  │
│ 16     │ The Count of Monte Cristo         │ 18       │ Pétion                                      │ 27.99  │
│ 18     │ The Adventures of Sherlock Holmes │ 20       │ George Newnes                               │ 16.99  │
│ 19     │ Frankenstein                      │ 21       │ Lackington, Hughes, Harding, Mavor, & Jones │ 13.25  │
│ 21     │ The Prince                        │ 23       │ Niccolò Machiavelli                         │ 10.99  │
│ 22     │ Don Quixote                       │ 24       │ Francisco de Robles                         │ 26.75  │
│ 24     │ Anna Karenina                     │ 26       │ The Russian Messenger                       │ 23.99  │
│ 25     │ Les Misérables                    │ 27       │ A. Lacroix, Verboeckhoven & Cie.            │ 29.75  │
│ 26     │ The Jungle Book                   │ 28       │ Macmillan Publishers                        │ 14.99  │
│ 28     │ War and Peace                     │ 26       │ The Russian Messenger                       │ 33.25  │
│ 29     │ Crime and Punishment              │ 30       │ The Russian Messenger                       │ 19.99  │
└────────┴───────────────────────────────────┴──────────┴─────────────────────────────────────────────┴────────┘
**/
-- Obtener todos los autores cuyo nombre no contiene números:

SELECT * FROM autor  WHERE nombre not regexp '\d';
/**
┌────┬─────────────────┐
│ id │     nombre      │
├────┼─────────────────┤
│ 1  │ J.K. Rowling    │
│ 2  │ Stephen King    │
│ 3  │ George Orwell   │
│ 4  │ Jane Austen     │
│ 5  │ Agatha Christie │
└────┴─────────────────┘
**/
-- Seleccionar los libros cuyo título contiene al menos tres vocales:

SELECT * FROM libro WHERE titulo  regexp '[aeiou]{3,}';

-- Obtener todos los autores cuyo nombre inicia con una consonante:

SELECT * FROM autor  WHERE nombre  not regexp '^[aeiou-AEIOU]';
/**
┌────┬─────────────────┐
│ id │     nombre      │
├────┼─────────────────┤
│ 1  │ J.K. Rowling    │
│ 2  │ Stephen King    │
│ 3  │ George Orwell   │
│ 4  │ Jane Austen     │
│ 5  │ Agatha Christie │
└────┴─────────────────┘
**/
-- Seleccionar los libros cuyo título no contiene la palabra "Science":

SELECT * FROM libro WHERE titulo not regexp 'Science';
/**
┌────────┬───────────────────────────────────┬──────────┬─────────────────────────────────────────────┬────────┐
│ codigo │              titulo               │ autor_id │                  editorial                  │ precio │
├────────┼───────────────────────────────────┼──────────┼─────────────────────────────────────────────┼────────┤
│ 1      │ The Great Gatsby                  │ 6        │ Charles Scribner's Sons                     │ 20.99  │
│ 2      │ To Kill a Mockingbird             │ 7        │ J.B. Lippincott & Co.                       │ 15.95  │
│ 3      │ The Catcher in the Rye            │ 8        │ Little, Brown and Company                   │ 18.75  │
│ 4      │ One Hundred Years of Solitude     │ 9        │ Harper & Row                                │ 22.5   │
│ 5      │ Brave New World                   │ 3        │ Chatto & Windus                             │ 17.99  │
│ 6      │ The Hobbit                        │ 10       │ George Allen & Unwin                        │ 24.99  │
│ 7      │ The Lord of the Rings             │ 10       │ George Allen & Unwin                        │ 35.5   │
│ 8      │ The Chronicles of Narnia          │ 11       │ Geoffrey Bles                               │ 28.99  │
│ 9      │ The Odyssey                       │ 12       │ Homer                                       │ 14.95  │
│ 10     │ The Iliad                         │ 12       │ Homer                                       │ 14.95  │
│ 11     │ Moby-Dick                         │ 13       │ Harper & Brothers                           │ 19.99  │
│ 12     │ The Road                          │ 14       │ Alfred A. Knopf                             │ 16.75  │
│ 13     │ The Grapes of Wrath               │ 15       │ The Viking Press                            │ 21.5   │
│ 14     │ Wuthering Heights                 │ 16       │ Emily Brontë                                │ 12.99  │
│ 15     │ The Old Man and the Sea           │ 17       │ Charles Scribner's Sons                     │ 18.95  │
│ 16     │ The Count of Monte Cristo         │ 18       │ Pétion                                      │ 27.99  │
│ 17     │ The Picture of Dorian Gray        │ 19       │ Ward, Lock, and Company                     │ 14.5   │
│ 18     │ The Adventures of Sherlock Holmes │ 20       │ George Newnes                               │ 16.99  │
│ 19     │ Frankenstein                      │ 21       │ Lackington, Hughes, Harding, Mavor, & Jones │ 13.25  │
│ 20     │ Alice's Adventures in Wonderland  │ 22       │ Macmillan                                   │ 11.5   │
│ 21     │ The Prince                        │ 23       │ Niccolò Machiavelli                         │ 10.99  │
│ 22     │ Don Quixote                       │ 24       │ Francisco de Robles                         │ 26.75  │
│ 23     │ The Divine Comedy                 │ 25       │ Dante Alighieri                             │ 20.5   │
│ 24     │ Anna Karenina                     │ 26       │ The Russian Messenger                       │ 23.99  │
│ 25     │ Les Misérables                    │ 27       │ A. Lacroix, Verboeckhoven & Cie.            │ 29.75  │
│ 26     │ The Jungle Book                   │ 28       │ Macmillan Publishers                        │ 14.99  │
│ 27     │ The Wind in the Willows           │ 29       │ Methuen & Co.                               │ 17.5   │
│ 28     │ War and Peace                     │ 26       │ The Russian Messenger                       │ 33.25  │
│ 29     │ Crime and Punishment              │ 30       │ The Russian Messenger                       │ 19.99  │
└────────┴───────────────────────────────────┴──────────┴─────────────────────────────────────────────┴────────┘
**/
-- Obtener todos los autores cuyo nombre tiene al menos una letra repetida consecutivamente:

SELECT * FROM autor WHERE nombre regexp '[a-zA-Z]{2}';
/**
┌────┬─────────────────┐
│ id │     nombre      │
├────┼─────────────────┤
│ 1  │ J.K. Rowling    │
│ 2  │ Stephen King    │
│ 3  │ George Orwell   │
│ 4  │ Jane Austen     │
│ 5  │ Agatha Christie │
└────┴─────────────────┘
**/

-- Obtener todos los autores cuyo nombre empieza con "M" o termina con "n":

SELECT * FROM autor WHERE nombre regexp '^M|n$';

-- Obtener todos los autores cuyo nombre no contiene caracteres especiales:

SELECT * FROM autor WHERE nombre regexp '^[-a-zA-Z0-9]*$';




