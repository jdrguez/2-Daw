# Examen Javascript


## FUNDAMENTOS DE JAVASCRIPT

```JAVASCRIPT
// Declaración de variables y tipos de datos
var primerNombre = 'Grover';    // String - Cadena de texto
var edad = 34;                  // Number - Número
var sueldo = 1800.99;          // Number - Número decimal
var tieneTrabajo = false;      // Boolean - Valor lógico
var puestoDeTrabajo;           // Undefined - Variable sin valor asignado
var valorNulo = null;          // Null - Valor nulo explícito

// Conversión de tipos
console.log('El nombre es: ' + primerNombre + ', y su edad es: ' + edad);
// La concatenación con + convierte automáticamente los números a strings

// Operadores matemáticos
var ageDavid = 34;
var ageAna = 28;
var differenceAge = ageDavid - ageAna;  // Resta: 6
var sumAges = ageDavid + ageAna;        // Suma: 62
var multiply = ageDavid * 2;            // Multiplicación: 68
var divide = ageDavid / 2;              // División: 17

// Operadores de comparación
var mayorDavid = ageDavid > ageAna;     // true
var menorDavid = ageDavid < ageAna;     // false
var igualDavid = ageDavid == ageAna;    // false

```

## CONTROL DE FLUJO

```JAVASCRIPT
// Estructura if-else
var nombre = 'Pablo';
var edad = 16;

if (edad < 12) {
    console.log(nombre + ' es un niño.');
} else if (edad >= 12 && edad < 18) {
    console.log(nombre + ' es un adolescente.');
} else if (edad >= 18 && edad < 60) {
    console.log(nombre + ' es un adulto.');
} else {
    console.log(nombre + ' es un anciano.');
}

// Operador ternario - Forma abreviada de if-else
var mensaje = edad >= 18 ? 'Es mayor de edad' : 'Es menor de edad';

// Switch - Alternativa a múltiples if-else
var mes = 3;
switch(mes) {
    case 1:
        console.log('Enero');
        break;
    case 2:
        console.log('Febrero');
        break;
    case 3:
        console.log('Marzo');
        break;
    default:
        console.log('Mes no válido');
}

// Bucles
// For - Cuando sabemos el número de iteraciones
for (var i = 1; i <= 5; i++) {
    console.log('Iteración ' + i);
}

// While - Cuando no sabemos el número de iteraciones
var contador = 1;
while (contador <= 5) {
    console.log('Contador: ' + contador);
    contador++;
}

// Do-While - Ejecuta al menos una vez
var num = 1;
do {
    console.log('Número: ' + num);
    num++;
} while (num <= 5);

```

## FUNCIONES

```JAVASCRIPT
// Función básica
function saludar() {
    console.log('¡Hola!');
}

// Función con parámetros
function saludarPersona(nombre) {
    return '¡Hola ' + nombre + '!';
}

// Función con múltiples parámetros y valor de retorno
function calcularIMC(peso, altura) {
    return peso / (altura * altura);
}

// Función con parámetros por defecto
function saludarConIdioma(nombre, idioma = 'es') {
    if (idioma === 'es') {
        return '¡Hola ' + nombre + '!';
    } else if (idioma === 'en') {
        return 'Hello ' + nombre + '!';
    }
}

// Función flecha (Arrow Function)
const sumar = (a, b) => a + b;

// Función con callback
function procesarUsuario(nombre, callback) {
    const nombreProcesado = nombre.toUpperCase();
    callback(nombreProcesado);
}

```

## MANIPULACIÓN DEL DOM

```JAVASCRIPT
// Selección de elementos
const elemento = document.getElementById('miId');                  // Por ID
const elementos = document.getElementsByClassName('miClase');      // Por clase
const elementosTag = document.getElementsByTagName('div');        // Por etiqueta
const elementoQuery = document.querySelector('.miClase');         // Primer elemento
const todosElementos = document.querySelectorAll('.miClase');     // Todos los elementos

// Modificación de elementos
elemento.textContent = 'Nuevo texto';              // Modificar texto
elemento.innerHTML = '<span>HTML nuevo</span>';    // Modificar HTML
elemento.style.color = 'red';                      // Modificar estilo
elemento.classList.add('nuevaClase');              // Añadir clase
elemento.classList.remove('viejaClase');           // Eliminar clase

// Eventos
elemento.addEventListener('click', function(e) {
    console.log('Elemento clickeado');
    e.preventDefault();  // Prevenir comportamiento por defecto
});

// Creación de elementos
const nuevoElemento = document.createElement('div');
nuevoElemento.textContent = 'Nuevo elemento';
document.body.appendChild(nuevoElemento);

```

## OBJETOS Y CLASES

```JAVASCRIPT
// Objeto literal
const persona = {
    nombre: 'David',
    edad: 30,
    saludar() {
        return `Hola, soy ${this.nombre}`;
    }
};

// Clase
class Persona {
    constructor(nombre, edad) {
        this.nombre = nombre;
        this.edad = edad;
    }

    saludar() {
        return `Hola, soy ${this.nombre}`;
    }

    // Getter
    get nombreCompleto() {
        return this.nombre;
    }

    // Setter
    set nombreCompleto(nuevoNombre) {
        this.nombre = nuevoNombre;
    }
}

// Herencia
class Empleado extends Persona {
    constructor(nombre, edad, salario) {
        super(nombre, edad);
        this.salario = salario;
    }

    obtenerSalario() {
        return this.salario;
    }
}

```

## ASINCRONISMO

```JAVASCRIPT
// Promesas
const miPromesa = new Promise((resolve, reject) => {
    setTimeout(() => {
        const exito = true;
        if (exito) {
            resolve('Operación exitosa');
        } else {
            reject('Error en la operación');
        }
    }, 2000);
});

miPromesa
    .then(resultado => console.log(resultado))
    .catch(error => console.error(error));

// Async/Await
async function obtenerDatos() {
    try {
        const respuesta = await fetch('https://api.ejemplo.com/datos');
        const datos = await respuesta.json();
        return datos;
    } catch (error) {
        console.error('Error:', error);
    }
}

// Fetch API
fetch('https://api.ejemplo.com/datos')
    .then(response => {
        if (!response.ok) {
            throw new Error('Error en la red');
        }
        return response.json();
    })
    .then(data => console.log(data))
    .catch(error => console.error('Error:', error));

```

## ALMACENAMIENTO LOCAL

```JAVASCRIPT
// Guardar datos
localStorage.setItem('usuario', 'David');

// Guardar objeto
const usuario = {
    nombre: 'David',
    edad: 30
};
localStorage.setItem('usuarioObj', JSON.stringify(usuario));

// Recuperar datos
const nombreUsu ``javascript //Aqui van tres comillas pero por el markdown se rompia.
ario = localStorage.getItem('usuario'); // Recupera el nombre
const usuarioObj = JSON.parse(localStorage.getItem('usuarioObj')); // Recupera el objeto y lo convierte de JSON a objeto

console.log(nombreUsuario); // Muestra 'David'
console.log(usuarioObj); // Muestra { nombre: 'David', edad: 30 }

// Eliminar datos
localStorage.removeItem('usuario'); // Elimina el nombre
localStorage.clear(); // Elimina todos los datos del localStorage

```

## MÓDULOS

```JAVASCRIPT
// Definición de un módulo en Persona.js
export default class Persona {
    constructor(nombre, edad) {
        this.nombre = nombre;
        this.edad = edad;
    }

    getBiografia() {
        return `${this.nombre}, tiene ${this.edad} años.`;
    }
}

// Importación del módulo en app.js
import Persona from './Persona.js';

const persona1 = new Persona('Pablo', 30);
console.log(persona1.getBiografia()); // Muestra 'Pablo, tiene 30 años.'
## EVENTOS

// Manejo de eventos
const boton = document.querySelector('button');

boton.addEventListener('click', function() {
    alert('Botón clickeado!');
});

// Delegación de eventos
const lista = document.querySelector('ul');
lista.addEventListener('click', function(e) {
    if (e.target.tagName === 'LI') {
        console.log('Elemento de lista clickeado:', e.target.textContent);
    }
});

```

## AJAX

```JAVASCRIPT
// Realizando una solicitud AJAX con XMLHttpRequest
const xhr = new XMLHttpRequest();
xhr.open('GET', 'https://api.ejemplo.com/datos', true);
xhr.onload = function() {
    if (xhr.status === 200) {
        const datos = JSON.parse(xhr.responseText);
        console.log(datos);
    } else {
        console.error('Error en la solicitud:', xhr.status);
    }
};
xhr.send();
```
