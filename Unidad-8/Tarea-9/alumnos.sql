DROP DATABASE IF EXISTS alumnos;

CREATE DATABASE alumnos;
USE alumnos;

CREATE TABLE alumno(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(25),
    apellido1 VARCHAR(25),
    apellido2 VARCHAR(25),
    email VARCHAR(100)
);
