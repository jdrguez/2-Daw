DROP DATABASE IF EXISTS salario;

CREATE DATABASE salario;
USE salario;

CREATE TABLE persona(
    id VARCHAR(100) PRIMARY KEY,
    nombre VARCHAR(250),
    salario_base INT,
    subsidio DECIMAL,
    salud DECIMAL,
    pension DECIMAL,
    bono DECIMAL,
    integral DECIMAL
);

