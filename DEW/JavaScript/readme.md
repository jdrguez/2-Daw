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


# Ejercicios JS hechos en clase 

```JAVASCRIPT


/**Función principal del ejercicio 1 */


function detect_negative(a,b,c){
    let numbers = [];
    numbers.push(a,b,c);
    for(const number of numbers){
        if(number < 0){
            console.error("este numéro genero el error negativo" + " " + number);
            break;
        }
    }
}

function its_same(a,b,c){
    let numbers = [];
    numbers.push(a,b,c);
    const unique_numbers = new Set(numbers);
    for (const num of numbers){
        var length_unique = 0;
        length_unique += 1;
    }
    if (length_unique < 3){
        console.error("Existen números iguales");
    }
}

function ejercicio1(){
    var num1 = parseFloat(document.getElementById("num1").value);
    var num2 = parseFloat(document.getElementById("num2").value);
    var num3 = parseFloat(document.getElementById("num3").value);

    let sum = num1 + num2 + num3;
    if (detect_negative(num1, num2, num3)){
        console.error("Uno de los números parece ser negativo");
    }else if (num1 == 0 && num2 == 0 && num3 == 0){
        console.error("Todos los números son iguales a 0");
    }else if (sum > 10 && its_same(num1, num2, num3)){
        console.error("La suma de los números es mayor a 10 pero no son diferentes.")
    }

    console.log(num1);
    console.log(num2);
    console.log(num3);
    console.log("la suma de los elementos sería:");
    console.log(sum);
}

/**Ejercicio número 2 */

function its_even(num){
    return num % 2 == 0
}

function ejercicio2(num){
    num = parseFloat((num).value);
    const max_number = [0, 1, 2, 3, 4, 5, 6];
    if (!(num in max_number)){
        console.log("¡¡Sólo se contar de 0 a 6!!")
    }else if (num == 0){
        console.log("Este es muy fácil.... ¡prueba otro!")
    }else if (its_even(num)){
        console.log("El número es par")
    }else{
        console.log("Tu numero es impar")
    }       
}

/** Ejercicio 3 */

function ejercicio3(){
    for (i = 0, j = 20; i < 8, j > 0; i++, j = j - 3){
        console.log(i, j)
    }
}

/**Ejercicio 4 */

function ejercicio4a(){
    let result, arg1, arg2, res1, res2;

    while(true){
        arg1 = Math.random() - 0.5;
        if (arg1 < 0){
            continue;
        }

        res1 = Math.sqrt(arg1);
        arg2 = Math.random();

        if (arg1 + arg2 == 0){
            break;
        }

        res2 = res1 / (arg1 + arg2);
        result = res1 + res2;
        console.log(result);

        if (result <= 0){
            break;
        }
    }
}

function ejercicio4b(){
    let result = 1, arg1, arg2, res1, res2;

    while (result > 0){
        arg1 = Math.random() - 0.5;

        if (arg1 >= 0){
            res1 = Math.sqrt(arg1);
            arg2 = Math.random();
        }

        if (arg1 + arg2 !== 0){
            res2 = res1 / (arg1 + arg2);
            result = res1 + res2;
            console.log(result);
        }
    }
}

function ejercicio4c(){
    let arg1, arg2, res1, res2;

    while (true){
        arg1 = Math.random() - 0.5;

        if (arg1 >= 0) {
            res1 = Math.sqrt(arg1);
            arg2 = Math.random();
        }

        if (arg1 + arg2 !== 0) {
                res2 = res1 / (arg1 + arg2);
                let result = res1 + res2;
                console.log(result);
                
                if (result <= 0) {
                    break;
                }
            }
        }
    }


/** Ejercicio 5 */

function ejercicio5(){
    let date = Date.now()
    let today = new Date(date)
    console.log(today)
}

/** Ejercicio 6 */

function ejercicio6a(){
    let date = document.getElementById("date1").value;
    const clean_date = date.replace("/", " ")
    let new_date = new Date(clean_date)
    console.log(new_date)
}

function ejercicio6b(){
    let date = document.getElementById("date2").value;
    const clean_date = date.replace("-", " ")
    let new_date = new Date(clean_date)
    console.log(new_date)
}

function ejercicio6c(){
    let date = document.getElementById("date3").value;
    let new_date = new Date(date)
    console.log(new_date)
}

/** Ejercicio 7 */

function days_calculator(date){
    const birth = "114/04/2000";
    var cleanead_birth = birth.split("/");
    var clean_date = date.split("/");
    var date1 = Date.UTC(cleanead_birth[2],cleanead_birth[1]-1,cleanead_birth[0]);
    var date2 = Date.UTC(clean_date[2],clean_date[1]-1,clean_date[0]);
    var dif = date2 - date1;
    var dias = Math.floor(dif / (1000 * 60 * 60 * 24));
    return dias
}

function ejercicio7(date,aswn){
    var date = document.getElementById("date").value;
    var aswn = document.getElementById("asnw").value;
    let total_days = days_calculator(date)

    if (aswn == 'd'){
        console.log("Han pasado un total de " + total_days + " " + "días")
    }else if(aswn == 'h'){
        let total_hours = total_days * 60;
        console.log("Han pasado un total de " + total_hours + " " + "horas");
    }else if(aswn == 'm'){
        let total_minutes = total_days * 60 * 60;
        console.log("Han pasodo un total de " + total_minutes + " minutos");
    }else if(aswn == 's'){
        let total_seconds = total_days * 60 * 60 * 60;
        console.log("Han pasado un total de " + total_seconds + " segundos");
    }else{
        console.log("No se proporciono medida")
    }

}


/**Ejercicio 8 */



function hdec2hms(){
    let num = parseFloat(document.getElementById("decimal").value);

    let hours = Math.floor(num);
    let rest_hours = Math.floor( num % 1 * 100);
    let decimal_minutes = rest_hours * 60 / 100;
    let minutes = Math.floor(decimal_minutes);
    let rest_mins = Math.floor(decimal_minutes % 1 * 100);
    let seconds = Math.floor(rest_mins * 60 / 100);

    console.log("Tu número hexadecimal sería la siguiente fecha " + hours + ":"+ minutes + ":" + seconds)
}


/**Ejercicio 9 */

function juliana_convert(date){
    let fecha= new Date(date);
    let unix_temp = fecha.getTime();

    let unix_temp_days = Math.floor(unix_temp / (100 * 60 * 60 * 24));
    let juliana_date = Math.floor(unix_temp_days + 2440587.5);
    return juliana_date
}

function ejercicio9(){
    let date = document.getElementById("date_juliana").value;

    let juliana_date = juliana_convert(date);
    console.log("Fecha Juliana: ", juliana_date);
}

/** Ejercicio 10 */

function deg2rand(){
    let deg = parseInt(document.getElementById("ang1").value);
    console.log(deg * (Math.PI / 180));
}

function rad2deg(){
    let rad = parseInt(document.getElementById("ang1").value);
    console.log( rad * (180 / Math.PI));
}

function sinDeg(){
    let deg = parseInt(document.getElementById("ang3").value);
    console.log( Math.sign(deg2rand(deg)));
}

function cosDeg(){
    let deg = parseInt(document.getElementById("ang4").value);
    console.log( Math.cos(deg2rand(deg)));
}

function sinDegAlt(){
    let deg = parseInt(document.getElementById("ang5").value);
    let cosValue = cosDeg(deg);

    return Math.sqrt(1 - cosValue * cosValue);
}

function cosDegAlt(){
    let deg = parseInt(document.getElementById("ang6").value);
    let sinValue = sinDeg(deg);
    return Math.sqrt(1 - sinValue * sinValue);
}

```

# Ejercicio 2 JS

```JAVASCRIPT

//Ejercicio 1


function funcion1(){
    const text1 = document.getElementById("text").value
    const char1 = document.getElementById("char").value
    let counter = 0;
    for (var letter of text1){
        if (letter == char1){
            counter ++ 
        }
    }
    console.log(counter);
}


//Ejercicio2

function funcion2() {
    const input = document.getElementById("numeros").value;
    const valores = input.split(',').map(item => item.trim());
    let suma = 0;
    let count = 0;

    valores.forEach((valor, index) => {
        const num = parseFloat(valor);
        if (!isNaN(num)) {
            suma += num;
            count++;
        } else {
            console.log(`El argumento número ${index + 1} "${valor}" no es un número, lo ignoramos.`);
        }
    });

    if (count > 0) {
        const media = suma / count;
        console.log(`La suma de los números es: ${suma}`);
        console.log(`La media de los números es: ${media}`);
    } else {
        console.log("No se ingresaron números válidos.");
    }
}

//Ejercicio 3
function funcion3(){
    let num1 = parseInt(document.getElementById("num1").value);
    let num2 = parseInt(document.getElementById("num2").value);
    let rslt1, rslt2, rslt3, rslt4 = 0;
    rslt1 = num1 + num2;
    rslt2 = String(num1) + String(num2);
    rslt3 = console.log("la suma es de %d", num1 + num2);
    rslt4 = `la suma es de ${num1 + num2}`;

    console.log(rslt1, rslt2, rslt3, rslt4)

}

//Ejercicio 4
function funcion4(){
    let num1 = parseInt(document.getElementById("num3").value)
    let num2 = parseInt(document.getElementById("num4").value) 
    let result = ''
    if (isNaN(num1)|| isNaN(num2)){
        result = 'De los dos, uno no es un número'
    }else if (num2 === 0){
        result = '0 es imposible dividirlo'
    }
    else{
        result = num1 / num2
    }
    console.log(result)
}


// Ejercicio 5

function funcion5(){
    let number = parseInt(document.getElementById("num6").value)
    const all_letters = 'TRWAGMYFPDXBNJZSQVHLCKET'
    let letterIndex = number % 23
    let result = `${number}${all_letters[letterIndex]}`
    console.log(`Tu dni es el siguiente ${result}`);

}

// Ejercicio 6

function funcion6() {
    let csvText = document.getElementById("csvText").value;
    let delimiter = document.getElementById("delimiter").value;

    if (delimiter === "") {
        delimiter = ",";
    }
    let elementos = csvText.split(delimiter);
    console.log(`Se han detectado ${elementos.length} elementos:`);
    for (let i = 0; i < elementos.length; i++) {
        console.log(`Elemento ${i + 1}: ${elementos[i].trim()}`);
    }
}

//Ejercicio 7

function funcion7() {
    let texto = document.getElementById("text7").value;
    texto = texto.toLowerCase().trim();
    let puntos = 0;
    if (texto.startsWith("el ") || texto.startsWith("la ")) {
        puntos += 1;
    }
    if (texto.endsWith("ando") || texto.endsWith("endo")) {
        puntos += 10;
    }
    let regexCon = /\b\w+\scon\s\w+\b/;
    if (regexCon.test(texto)) {
        puntos += 100;
    }
    console.log(`El total de puntos es: ${puntos}`);
}

//Ejercicio 8

function funcion8() {
    let texto = document.getElementById("text8").value;
    if (texto.includes("arriba")) {
        let nuevoTexto = texto.replace(/arriba/g, "abajo");
        console.log("La cadena 'arriba' fue encontrada.");
        console.log("El nuevo texto es:", nuevoTexto);
    } else {
        console.log("La cadena 'arriba' no fue encontrada en el texto.");
    }
}


// Ejercicio 9

function funcion9(){
    let text = document.getElementById("text9").value
    let result = ''
    if (text == text.toUpperCase()){
        result = 'Todas son mayusculas'
    }else if(text == text.toLowerCase()){
        result = 'Todas son minusculas'
    }else{
        result='Hay una combinacion de ambos'
    }

    console.log(result)

}

//Ejercicio 10
function funcion10() {
    let frase = document.getElementById("text10").value;
    let fraseLimpia = frase.toLowerCase().replace(/[\W_]/g, '');
    let fraseInvertida = fraseLimpia.split('').reverse().join('');
    if (fraseLimpia === fraseInvertida) {
        console.log("La frase es un palíndromo.");
    } else {
        console.log("La frase no es un palíndromo.");
    }
}

```

# Ejercicios 3

```JAVASCRIPT

//Ejercicio 1

function funcion1(numElem = 10, min = 100, max = 200) {
    let arr = Array.from({ length: numElem }, () => Math.floor(Math.random() * (max - min + 1)) + min);
    console.log(`Aquí tienes el arrat aleatorio solicitado: [${arr.join(", ")}]`);
    return arr;
}

// Ejercicio 2

function funcion2() {
    let arr = funcion1(20, 20, 100);
    arr.sort((a, b) => a - b);
    console.log(`Aquí tienes tu array ordenado: [${arr.join(", ")}]`);
}

// Ejercicio 3

function funcion3() {
    let arr = funcion1(20, 20, 100);
    arr.sort((a, b) => a - b);
    arr = arr.sort(() => Math.random() - 0.5);
    console.log(`Todo el array a sido mezclado: [${arr.join(", ")}]`);
}

// Ejercicio 4


function funcion4() {
    let arr = funcion1(15, -10, 20);
    let newArr = [];
    
    arr.forEach(x => {
        let operation = '';
        if (x <= -5) {
            operation = `Se eliminará el primer elemento: ${newArr.shift() || 'Array vacío'}`;
        } else if (x > -5 && x <= 0) {
            operation = `Se eliminará el segundo elemento: ${newArr.pop() || 'Array vacío'}`;
        } else if (x > 0 && x <= 10) {
            newArr.unshift(x);
            operation = `Se añade el siguiente ${x} al principio`;
        } else if (x > 10) {
            newArr.push(x);
            operation = `Se añade el siguiente ${x} al final`;
        }
        console.log(`x: ${x}, ${operation}. Tamaño del nuevo array: ${newArr.length}`);
    });
}

// Ejercicio 5

function funcion5() {
    let arr = funcion1(20, 60, 100);
    let sqrtArr = arr.map(x => Math.sqrt(x));
    console.log(`Aquí tienes tus raices cuadradas: [${sqrtArr.join(", ")}]`);
}

// Ejercicio 6

function funcion6() {
    let arr = funcion1(20, -100, 100);
    let max = Math.max(...arr);
    let min = Math.min(...arr);
    let maxIndex = arr.indexOf(max);
    let minIndex = arr.indexOf(min);
    
    console.log(`El máximo del array: ${max} (su índice: ${maxIndex}), el mínimo del array : ${min} (su índice: ${minIndex})`);
}

// Ejercicio 7

function funcion7() {
    let arr = Array.from({ length: 50 }, () => Math.floor(Math.random() * (20 - 10 + 1)) + 10);
    let seen = new Set();
    let result = '';
    
    arr.forEach(num => {
        if (seen.has(num)) {
            result += `El siguente número ${num} es repetido.\n`;
        } else {
            result += `El siguiente número ${num} es nuevo.\n`;
            seen.add(num);
        }
    });
    
    console.log(result);
}

// Ejercicio 8


function funcion8() {
    let arr = Array.from({ length: 50 }, () => Math.floor(Math.random() * (20 - 10 + 1)) + 10);
    let counts = {};
    let result = '';
    
    arr.forEach(num => {
        if (counts[num]) {
            counts[num]++;
            result += `Número ${num} ya existía, aparece ${counts[num] - 1} veces.\n`;
        } else {
            counts[num] = 1;
            result += `Número ${num} es nuevo.\n`;
        }
    });
    
    console.log(result);
}

```

# Ejercicios 4

```JAVASCRIPT


// Ejercicio 1

const ring = document.querySelector('#ring')
ring.addEventListener('click', () =>{
    document.querySelector('.chosen').style.backgroundColor='yellow'
})

// Ejercicio 2


const elements = document.querySelectorAll('#ejer_list li')

elements.forEach(element => {
    element.addEventListener('mouseover', () => {
        element.textContent = 'Nazgûl';
        element.style.backgroundColor = 'black';
        element.style.color = 'white';
    })

});


// Ejercicio 3


class Ejercito{
    constructor(nombre, numeroSoldados,fuerza){
        this.nombre = nombre
        this.numeroSoldados = numeroSoldados
        this.fuerza = fuerza
    }

    compararFuerza(other){
        if (this.fuerza > other.fuerza){
            return `${this.nombre} gana contra ${other.nombre} `
        } else if (this.fuerza < other.fuerza){
            return `${this.nombre} pierde contra ${other.nombre} `
        } else{
            return `${this.nombre} empata contra ${other.nombre} `
        }
    }
}

const ejercito1 = new Ejercito('Elfos', 1000, 80);
const ejercito2 = new Ejercito('Enanos', 800, 85);
const ejercito3 = new Ejercito('Humanos', 1200, 75);
const ejercito4 = new Ejercito('Orcos', 1500, 70);
const ejercito5 = new Ejercito('Trolls', 500, 90);

console.log(ejercito1.compararFuerza(ejercito2));
console.log(ejercito3.compararFuerza(ejercito4));
console.log(ejercito5.compararFuerza(ejercito1));


// Ejercicio 4


document.querySelector('#mordor').addEventListener('click', () => {
    alert('Has llegado a Mordor, Felicidades!!');
});

document.querySelector('#rohan').addEventListener('click', () => {
    alert('Has llegado a Rohan, Felicidades');
});

document.querySelector('#gondor').addEventListener('click', () => {
    alert('Has llegado a Gondor, Felicidades');
});



// Ejercicio 5


const oscuridad = document.querySelector('#ladoOscuro')
const fuerza = document.querySelector('#ladoFuerza')
const body = document.querySelector('body')
oscuridad.addEventListener('click', () =>{
    body.style.backgroundColor='black'
})
fuerza.addEventListener('click', () =>{
    body.style.backgroundColor='yellow'
})



// Ejercicio 6


const sable = document.querySelector('#sableLaser');
        sable.addEventListener('click', () => {
            sable.src = 'https://www.aceroymagia.com/Images/articulo/sable-de-luz-obi-wan-hoja-extraible/01-sable-de-luz-obi-wan-hoja-extraible.jpg'; 
});



// Ejercicio 7


class Jedi {
    constructor(nombre, nivelFuerza, arma) {
        this.nombre = nombre;
        this.nivelFuerza = nivelFuerza;
        this.arma = arma;
    }
}

class Sith {
    constructor(nombre, nivelFuerza, arma) {
        this.nombre = nombre;
        this.nivelFuerza = nivelFuerza;
        this.arma = arma;
    }
}

function combate(jedi, sith) {
    if (jedi.nivelFuerza > sith.nivelFuerza) {
        return `${jedi.nombre} gana el combate con su ${jedi.arma}`;
    } else if (jedi.nivelFuerza < sith.nivelFuerza) {
        return `${sith.nombre} gana el combate con su ${sith.arma}`;
    } else {
        return `Es un empate entre ${jedi.nombre} y ${sith.nombre}`;
    }
}

const jedi = new Jedi('Luke Skywalker', 95, 'sable láser verde');
const sith = new Sith('Darth Vader', 90, 'sable láser rojo');

console.log(combate(jedi, sith));




// Ejercicio 8


class Superheroe {
    constructor(nombre, poder, nivel) {
        this.nombre = nombre;
        this.poder = poder;
        this.nivel = nivel;
    }
}

function encontrarMasPoderoso(superheroes) {
    let masPoderoso = superheroes[0];
    superheroes.forEach(hero => {
        if (hero.nivel > masPoderoso.nivel) {
            masPoderoso = hero;
        }
    });
    return masPoderoso.nombre;
}

const heroes = [
    new Superheroe('Spiderman', 'Telarañan', 80),
    new Superheroe('Superman', 'HiperFuerza', 95),
    new Superheroe('Batman', 'Tecnología', 90)
];

console.log(`El superhéroe más poderoso es ${encontrarMasPoderoso(heroes)}`);




// Ejercicio 9


const escudo = document.querySelector('#escudo');
        escudo.addEventListener('click', () => {
            escudo.style.left = '100px'
        });



// Ejercicio 10


const bats = document.querySelector('#batS');
        bats.addEventListener('click', () => {
            document.body.style.backgroundImage = 'url("https://www.shutterstock.com/image-vector/chattogram-bangladesh-june-17-2023-600nw-2318874201.jpg")';
        });



// Ejercicio 11


class Superman{
    constructor(element){
        this.element = element
    }

    volar(){
        this.element.style.bottom = '500px'
    }
}

const superman = new Superman(document.getElementById('superman'))

document.querySelector('#volar').addEventListener('click', () => {
    superman.volar()
})



// Ejercicio 12

const poder = {
    'Spiderman': 'Telaraña',
    'Superman': 'Volar',
    'Batman': 'Tecnología'
};

const seleccion = document.querySelector('#superheroes')

const poderParrafo = document.querySelector('#poder')

seleccion.addEventListener('change', () =>{
    const heroe = seleccion.value;
    poderParrafo.textContent = `Poder de ${heroe}:${poder[heroe]}`
})


// Ejercicio 13


const button = document.querySelector('#cambiar')
const image = document.querySelector('#img_batman')

button.addEventListener('click', () =>{
    if (image.style.display == 'none'){
        image.style.display = 'block';
    } else{
        image.style.display = 'none';
    }
})



// Ejercicio 14



class Gema{
    constructor(nombre, poder){
        this.nombre = nombre
        this.poder = poder
    }
}

class Thanos{
    constructor(){
        this.gemas = []
    }

    recogerGema(gema){
        this.gemas.push(gema);
        console.log(`Thanos recoge la gema de ${gema.nombre}`)
    }

    poderTotal(){
        return this.gemas.reduce((total, gema) => total + gema.poder, 0)
    }
}

const gema1 = new Gema('Gema del Poder', 50);
const gema2 = new Gema('Gema del Espacio', 60);
const gema3 = new Gema('Gema del Tiempo', 70);

const thanos = new Thanos();
thanos.recogerGema(gema1);
thanos.recogerGema(gema2);
thanos.recogerGema(gema3);

console.log(`Poder total de Thanos: ${thanos.poderTotal()}`);




// Ejercicio 15



document.querySelector('#groot').addEventListener('click', () => {
    alert('¡Yo soy Groot!');
});




// Ejercicio 16


const input = document.querySelector('#password');
        const mensaje = document.querySelector('#mensaje');

        input.addEventListener('input', () => {
            if (input.value === 'Vengadores') {
                mensaje.textContent = 'Assemble!';
            } else {
                mensaje.textContent = '';
            }
});




// Ejercicio 17


const misiones = document.querySelectorAll('#misiones li');
        misiones.forEach(mision => {
            mision.addEventListener('click', () => {
                mision.style.textDecoration = 'line-through';
                mision.style.backgroundColor = 'green';
                mision.style.color='white';
            });
        });



// Ejercicio 18


class Villano{
    constructor(nombre, plan){
        this.nombre = nombre;
        this.plan = plan;
    }

    cambiarPlan(nuevoplan){
        this.plan = nuevoplan
    }
}

const thanos = new Villano('thanos', 'Matar a la mitad de la población universal')

console.log(thanos.plan)
thanos.cambiarPlan('Volver a casa')
console.log(thanos.plan)


// Ejercicio 19


const frodo = document.querySelector('#anilloFrodo')
const mensaje = document.querySelector('#mensaje')

frodo.addEventListener('click', () =>{
    mensaje.textContent = 'Has elegido correctamente'
})




// Ejercicio 20


class Hechizo {
    constructor(nombre, poder) {
        this.nombre = nombre;
        this.poder = poder;
    }
}

class Mago {
    constructor(nombre, hechizo) {
        this.nombre = nombre;
        this.hechizo = hechizo;
    }

    invocarHechizo() {
        return this.hechizo.poder;
    }
}

function duelo(mago1, mago2) {
    const poderMago1 = mago1.invocarHechizo();
    const poderMago2 = mago2.invocarHechizo();

    if (poderMago1 > poderMago2) {
        return `${mago1.nombre} gana el duelo con el hechizo ${mago1.hechizo.nombre}`;
    } else if (poderMago2 > poderMago1) {
        return `${mago2.nombre} gana el duelo con el hechizo ${mago2.hechizo.nombre}`;
    } else {
        return 'El duelo termina en empate';
    }
}

const hechizo1 = new Hechizo('Rayo', 80);
const hechizo2 = new Hechizo('Bola de fuego', 90);

const mago1 = new Mago('Merlin', hechizo1);
const mago2 = new Mago('Agni', hechizo2);

const mensaje = document.querySelector('#mensaje')
const ganador = document.querySelector('#ganador')

ganador.addEventListener('click', () =>  {
    mensaje.textContent=`${duelo(mago1, mago2)}`

})



console.log(duelo(mago1, mago2));
```

# Guia de Resolucion de Ejercicios Javascript

1. Comprender el Requerimiento del Proyecto
Antes de escribir cualquier línea de código, asegúrate de entender bien el objetivo de la app. Pregunta si no tienes claro algo o haz una lista de las funciones que necesitas implementar.

Ejemplos de mini proyectos:
- To-Do List: una app donde puedes agregar, eliminar y marcar tareas como completadas.
- Calculadora: una calculadora básica con operaciones aritméticas.
- Juego de adivinanza de números: una app que genere un número aleatorio y pida al usuario que lo adivine.
- Conversor de unidades: por ejemplo, de kilómetros a millas.

2. Organización y Estructura del Proyecto
Crea los archivos iniciales de tu proyecto:

- index.html (para el HTML de la app)
- styles.css (para los estilos en CSS)
- script.js (para la lógica en JavaScript)

**Asegúrate de enlazar correctamente los archivos CSS y JS en tu archivo HTML:**
```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mi Proyecto de JavaScript</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <script src="script.js"></script>
</body>
</html>
```

3. Estructura HTML Básica
Define el HTML con los elementos básicos de tu app, según el tipo de proyecto. Ejemplo:
Para una To-Do List:

```html
<h1>Lista de Tareas</h1>
<input type="text" id="new-task" placeholder="Nueva tarea...">
<button id="add-task-btn">Agregar</button>
<ul id="task-list"></ul>
```
**Asegúrate de usar IDs y clases para facilitar la manipulación con JavaScript.**

4. Interactividad con JavaScript
Selecciona los elementos HTML que necesitas manipular usando **document.getElementById** o **document.querySelector.**

- Añade los eventos necesarios a los elementos interactivos. Ejemplo:

Al hacer clic en el botón “Agregar” se debe llamar una función que añada una nueva tarea.
Lógica del proyecto: define y organiza el código según la funcionalidad principal. Aquí hay una lista de 

- las tareas comunes que puedes necesitar:
    - Captura de datos del usuario: por ejemplo, al agregar un nuevo elemento en la lista de tareas.
    - Manipulación del DOM: agregar, modificar o eliminar elementos HTML dinámicamente.
    - Validación básica: comprobar que el usuario haya ingresado un valor antes de realizar una acción.
    - Actualizar el contenido en tiempo real, por ejemplo, al completar o eliminar una tarea.

Ejemplo de JavaScript para una To-Do List:
```javascript
// Selecciona los elementos
const taskInput = document.getElementById('new-task');
const addTaskButton = document.getElementById('add-task-btn');
const taskList = document.getElementById('task-list');

// Añadir evento al botón
addTaskButton.addEventListener('click', addTask);

function addTask() {
    // Obtener el valor del input
    const taskText = taskInput.value.trim();
    if (taskText === "") return; // Validación
    
    // Crear un nuevo elemento de tarea
    const listItem = document.createElement('li');
    listItem.textContent = taskText;
    
    // Añadir la tarea a la lista
    taskList.appendChild(listItem);
    
    // Limpiar el input
    taskInput.value = "";
}
```

6. Mejorar la Experiencia del Usuario (Opcional)
Puedes agregar características como:

- Confirmación de eliminación: usa confirm() antes de eliminar un elemento.
- Feedback visual: cambia el color del fondo de la tarea cuando esté completada.
- Persistencia de datos: guarda la lista de tareas en el localStorage para que persista al recargar la página.

Ejemplo de uso de localStorage:

```javascript
// Guardar tareas
localStorage.setItem('tasks', JSON.stringify(tasksArray));

// Recuperar tareas
const storedTasks = JSON.parse(localStorage.getItem('tasks')) || [];
```

7. Pruebas y Debugging
Prueba tu aplicación en cada paso. Esto te permite identificar errores o problemas antes de que el código se vuelva demasiado complejo.

- Usa **console.log()** para ver el flujo de datos y asegurarte de que tus funciones funcionen como esperas.

Revisa errores de sintaxis en la consola del navegador y corrígelos de inmediato.

8. Refactorización (Opcional)

Una vez que todo esté funcionando, revisa tu código para ver si puedes simplificar o reutilizar alguna parte.

Busca fragmentos repetidos y considera moverlos a funciones separadas.

9. Últimos Toques y Entrega

Asegúrate de que la app esté bien estructurada y que todo funcione según lo planeado.
Verifica que has usado nombres de variables y funciones claros y descriptivos.
Ejemplo de Proyecto Completado: To-Do List

- HTML: Estructura con input y lista de tareas.
- CSS: Estilo de lista y diseño básico.
- JavaScript: Agregar, eliminar y marcar tareas como completadas, con persistencia en localStorage.

## Funciones y Métodos

| Función/Método                | Descripción                                                                                          |
|-------------------------------|------------------------------------------------------------------------------------------------------|
| `document.getElementById`      | Selecciona un elemento del DOM por su ID, devolviendo una referencia al elemento.                    |
| `document.querySelector`       | Selecciona el primer elemento que coincida con un selector CSS.                                      |
| `document.querySelectorAll`    | Selecciona todos los elementos que coincidan con un selector CSS, devolviendo una lista de nodos.    |
| `element.addEventListener`     | Añade un evento a un elemento, por ejemplo, "click", "submit", etc., junto con una función manejadora.|
| `element.appendChild`          | Añade un elemento hijo al final de otro elemento.                                                    |
| `element.removeChild`          | Elimina un elemento hijo del DOM desde el elemento padre.                                            |
| `element.innerHTML`            | Establece o devuelve el contenido HTML de un elemento.                                               |
| `element.textContent`          | Establece o devuelve el texto de un elemento sin formato HTML.                                       |
| `element.classList.add`        | Añade una clase CSS al elemento, útil para aplicar estilos específicos.                              |
| `element.classList.remove`     | Elimina una clase CSS del elemento.                                                                  |
| `element.classList.toggle`     | Añade o elimina una clase, dependiendo de si está presente o no en el elemento.                     |
| `localStorage.setItem`         | Almacena un dato en `localStorage` en formato clave-valor. Los datos persisten entre sesiones.      |
| `localStorage.getItem`         | Recupera un dato almacenado en `localStorage` por su clave.                                         |
| `localStorage.removeItem`      | Elimina un dato almacenado en `localStorage` por su clave.                                          |
| `JSON.stringify`               | Convierte un objeto de JavaScript a una cadena de texto JSON para almacenarlo (p. ej., en `localStorage`). |
| `JSON.parse`                   | Convierte una cadena JSON en un objeto JavaScript para su manipulación.                             |
| `console.log`                  | Imprime información en la consola del navegador para fines de depuración.                           |
| `setTimeout`                   | Ejecuta una función después de un tiempo específico (en milisegundos).                              |
| `setInterval`                  | Ejecuta una función repetidamente, cada cierto intervalo de tiempo.                                 |
| `Math.random`                  | Genera un número decimal aleatorio entre 0 (inclusive) y 1 (exclusivo).                             |
| `Math.floor`                   | Redondea un número decimal hacia abajo, devolviendo un número entero.                               |
| `alert`                        | Muestra una ventana emergente de alerta al usuario.                                                 |
| `prompt`                       | Muestra una ventana emergente que solicita una entrada del usuario y devuelve el texto ingresado.   |
| `confirm`                      | Muestra una ventana emergente que solicita una confirmación del usuario y devuelve `true` o `false`.|

### Ejemplo

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mini App To-Do List</title>
</head>
<body>
    <h1>Lista de Tareas</h1>
    <input type="text" id="new-task" placeholder="Nueva tarea...">
    <button id="add-task-btn">Agregar</button>
    <ul id="task-list"></ul>

    <script>
        // Seleccionamos los elementos principales
        const taskInput = document.getElementById('new-task');        // Obtener un elemento por ID
        const addTaskButton = document.getElementById('add-task-btn');
        const taskList = document.getElementById('task-list');

        // Cargar tareas guardadas en localStorage al iniciar la app
        const savedTasks = JSON.parse(localStorage.getItem('tasks')) || [];
        savedTasks.forEach(taskText => createTaskElement(taskText));

        // Añadir evento al botón "Agregar"
        addTaskButton.addEventListener('click', () => {
            const taskText = taskInput.value.trim();
            if (taskText === "") return alert("¡Escribe una tarea!"); // Validación usando alert
            
            createTaskElement(taskText);                            // Crear el elemento de tarea
            saveTask(taskText);                                     // Guardar en localStorage
            taskInput.value = "";                                   // Limpiar el campo de entrada
        });

        // Función para crear un nuevo elemento de tarea en el DOM
        function createTaskElement(taskText) {
            const listItem = document.createElement('li');           // Crear elemento de tarea
            listItem.textContent = taskText;
            
            // Añadir opción de completar tarea
            listItem.addEventListener('click', () => {
                listItem.classList.toggle('completed');              // Usar toggle para marcar tarea completada
                console.log(`Tarea "${taskText}" completada:`, listItem.classList.contains('completed'));
            });

            // Añadir opción de eliminar tarea
            listItem.addEventListener('dblclick', () => {
                if (confirm("¿Eliminar tarea?")) {                  // Confirmar antes de eliminar
                    taskList.removeChild(listItem);                 // Eliminar del DOM
                    removeTask(taskText);                           // Eliminar de localStorage
                }
            });
            
            taskList.appendChild(listItem);                          // Añadir tarea a la lista en el DOM
        }

        // Guardar una tarea en localStorage
        function saveTask(taskText) {
            savedTasks.push(taskText);
            localStorage.setItem('tasks', JSON.stringify(savedTasks)); // Guardar array actualizado en localStorage
        }

        // Eliminar una tarea de localStorage
        function removeTask(taskText) {
            const taskIndex = savedTasks.indexOf(taskText);
            if (taskIndex > -1) {
                savedTasks.splice(taskIndex, 1);
                localStorage.setItem('tasks', JSON.stringify(savedTasks));
            }
        }

        // Ejemplo adicional de uso de setTimeout y setInterval
        setTimeout(() => alert("¡No olvides revisar tus tareas!"), 5000);  // Mostrar alerta después de 5 segundos

        let count = 0;
        setInterval(() => {
            console.log("App activa durante", ++count, "segundos.");     // Contador en consola
        }, 1000);

        // Ejemplo de uso de Math.random y Math.floor para un número aleatorio
        const randomNum = Math.floor(Math.random() * 10) + 1;            // Número entre 1 y 10
        console.log("Número aleatorio entre 1 y 10:", randomNum);
        
    </script>

    <style>
        /* Ejemplo de estilos básicos */
        .completed {
            text-decoration: line-through;
            color: gray;
        }
    </style>
</body>
</html>
```


## Mini proyectos de JS

# Mini Projects

## ToDo App

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>To-Do List</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>Lista de Tareas</h1>
    <input type="text" id="taskInput" placeholder="Añadir nueva tarea">
    <button onclick="addTask()">Añadir</button>
    <ul id="taskList"></ul>
    <script src="script.js"></script>
</body>
</html>
```

```js
function addTask() {
    const taskInput = document.getElementById("taskInput");
    const taskList = document.getElementById("taskList");

    if (taskInput.value.trim() !== "") {
        const listItem = document.createElement("li");
        listItem.textContent = taskInput.value;
        
        const deleteBtn = document.createElement("button");
        deleteBtn.textContent = "Eliminar";
        deleteBtn.onclick = () => taskList.removeChild(listItem);

        listItem.appendChild(deleteBtn);
        taskList.appendChild(listItem);
        
        taskInput.value = "";
    }
}
```

## Calc basic

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calculadora</title>
</head>
<body>
    <h1>Calculadora Básica</h1>
    <div id="calculator">
        <input type="text" id="display" disabled>
        <div id="buttons">
            <button onclick="appendNumber('7')">7</button>
            <button onclick="appendNumber('8')">8</button>
            <button onclick="appendNumber('9')">9</button>
            <button onclick="setOperation('/')">/</button>
            <button onclick="appendNumber('4')">4</button>
            <button onclick="appendNumber('5')">5</button>
            <button onclick="appendNumber('6')">6</button>
            <button onclick="setOperation('*')">*</button>
            <button onclick="appendNumber('1')">1</button>
            <button onclick="appendNumber('2')">2</button>
            <button onclick="appendNumber('3')">3</button>
            <button onclick="setOperation('-')">-</button>
            <button onclick="appendNumber('0')">0</button>
            <button onclick="clearDisplay()">C</button>
            <button onclick="calculate()">=</button>
            <button onclick="setOperation('+')">+</button>
        </div>
    </div>
    <script src="script.js"></script>
</body>
</html>
```

```js
let display = document.getElementById("display");
let currentOperation = null;
let currentValue = "";

function appendNumber(number) {
    display.value += number;
}

function setOperation(operation) {
    currentValue = display.value;
    currentOperation = operation;
    display.value = "";
}

function calculate() {
    if (currentOperation && currentValue) {
        const result = eval(currentValue + currentOperation + display.value);
        display.value = result;
        currentOperation = null;
        currentValue = "";
    }
}

function clearDisplay() {
    display.value = "";
    currentOperation = null;
    currentValue = "";
}
```

## Conversor de moneda

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Conversor de Moneda</title>
</head>
<body>
    <h1>Conversor de Moneda</h1>
    <input type="number" id="amount" placeholder="Monto">
    <select id="currencyFrom">
        <option value="USD">Dólares</option>
        <option value="EUR">Euros</option>
    </select>
    <button onclick="convertCurrency()">Convertir</button>
    <select id="currencyTo">
        <option value="EUR">Euros</option>
        <option value="USD">Dólares</option>
    </select>
    <p id="result">Resultado: </p>
    <script src="script.js"></script>
</body>
</html>
```

```js
function convertCurrency() {
    const amount = parseFloat(document.getElementById("amount").value);
    const from = document.getElementById("currencyFrom").value;
    const to = document.getElementById("currencyTo").value;
    let result = 0;

    if (from === "USD" && to === "EUR") {
        result = amount * 0.85; // Ejemplo de tasa de cambio
    } else if (from === "EUR" && to === "USD") {
        result = amount * 1.18; // Ejemplo de tasa de cambio
    }

    document.getElementById("result").textContent = "Resultado: " + result.toFixed(2);
}
```

## Reloj Digital

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reloj Digital</title>
</head>
<body>
    <h1>Reloj Digital</h1>
    <div id="clock">00:00:00</div>
    <script src="script.js"></script>
</body>
</html>
```

```js
function updateClock() {
    const now = new Date();
    const hours = String(now.getHours()).padStart(2, "0");
    const minutes = String(now.getMinutes()).padStart(2, "0");
    const seconds = String(now.getSeconds()).padStart(2, "0");
    document.getElementById("clock").textContent = `${hours}:${minutes}:${seconds}`;
}

setInterval(updateClock, 1000);
```

## Adivina el número

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Juego de Adivinar el Número</title>
</head>
<body>
    <h1>Adivina el Número</h1>
    <p>He pensado en un número entre 1 y 100. ¿Puedes adivinarlo?</p>
    <input type="number" id="guessInput" placeholder="Tu adivinanza" min="1" max="100">
    <button onclick="checkGuess()">Adivinar</button>
    <p id="message"></p>
    <p id="attempts">Intentos: 0</p>
    <script src="script.js"></script>
</body>
</html>
```

```js
let randomNumber = Math.floor(Math.random() * 100) + 1;
let attempts = 0;

function checkGuess() {
    const guess = parseInt(document.getElementById("guessInput").value);
    attempts++;
    
    if (guess < randomNumber) {
        document.getElementById("message").textContent = "El número es mayor.";
    } else if (guess > randomNumber) {
        document.getElementById("message").textContent = "El número es menor.";
    } else {
        document.getElementById("message").textContent = "¡Felicidades! Adivinaste el número.";
    }
    
    document.getElementById("attempts").textContent = "Intentos: " + attempts;
}
```

## Gallery ligthbox

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Galería de Imágenes</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>Galería de Imágenes</h1>
    <div class="gallery">
        <img src="image1.jpg" onclick="openLightbox(this.src)">
        <img src="image2.jpg" onclick="openLightbox(this.src)">
        <img src="image3.jpg" onclick="openLightbox(this.src)">
    </div>
    <div id="lightbox" onclick="closeLightbox()">
        <img id="lightboxImg">
    </div>
    <script src="script.js"></script>
</body>
</html>
```

```js
function openLightbox(src) {
    const lightbox = document.getElementById("lightbox");
    const lightboxImg = document.getElementById("lightboxImg");
    lightbox.style.display = "flex";
    lightboxImg.src = src;
}

function closeLightbox() {
    document.getElementById("lightbox").style.display = "none";
}
```

```css
body {
    font-family: Arial, sans-serif;
}

.gallery img {
    width: 100px;
    margin: 10px;
    cursor: pointer;
}

#lightbox {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.8);
    justify-content: center;
    align-items: center;
}

#lightbox img {
    max-width: 90%;
    max-height: 90%;
}
```

## Formulario Validacion de datos

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario de Registro</title>
</head>
<body>
    <h1>Formulario de Registro</h1>
    <form id="registrationForm" onsubmit="return validateForm()">
        <label for="name">Nombre:</label>
        <input type="text" id="name"><br>
        
        <label for="email">Correo Electrónico:</label>
        <input type="email" id="email"><br>
        
        <label for="password">Contraseña:</label>
        <input type="password" id="password"><br>
        
        <button type="submit">Registrarse</button>
        <p id="errorMessage"></p>
    </form>
    <script src="script.js"></script>
</body>
</html>
```

```js
function validateForm() {
    const name = document.getElementById("name").value;
    const email = document.getElementById("email").value;
    const password = document.getElementById("password").value;
    const errorMessage = document.getElementById("errorMessage");

    if (name.trim() === "") {
        errorMessage.textContent = "El nombre no puede estar vacío.";
        return false;
    }

    const emailPattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
    if (!emailPattern.test(email)) {
        errorMessage.textContent = "El correo electrónico no es válido.";
        return false;
    }

    if (password.length < 8) {
        errorMessage.textContent = "La contraseña debe tener al menos 8 caracteres.";
        return false;
    }

    errorMessage.textContent = "";
    alert("Registro exitoso!");
    return true;
}
```

## Sist Puntuación

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contador de Puntos</title>
</head>
<body>
    <h1>Contador de Puntos</h1>
    <p>Puntuación: <span id="score">0</span></p>
    <button onclick="addPoint()">Añadir Punto</button>
    <button onclick="subtractPoint()">Restar Punto</button>
    <button onclick="resetScore()">Reiniciar</button>
    <script src="script.js"></script>
</body>
</html>
```

```js
let score = 0;

function updateScore() {
    document.getElementById("score").textContent = score;
}

function addPoint() {
    score++;
    updateScore();
}

function subtractPoint() {
    if (score > 0) {
        score--;
        updateScore();
    }
}

function resetScore() {
    score = 0;
    updateScore();
}
```

# Temporizador cuenta regresiva interactivo

### html
```htm
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Temporizador de Cuenta Regresiva</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>Temporizador de Cuenta Regresiva</h1>
    <div id="timer-container">
        <label for="minutes">Minutos:</label>
        <input type="number" id="minutes" min="0" max="60" value="0">
        
        <label for="seconds">Segundos:</label>
        <input type="number" id="seconds" min="0" max="59" value="0">
        
        <button onclick="startTimer()">Iniciar</button>
        <button onclick="resetTimer()">Reiniciar</button>
        
        <div id="countdown">00:00</div>
    </div>
    
    <script src="script.js"></script>
</body>
</html>
```

### JS
```js
let countdownInterval;
let remainingTime = 0;

function startTimer() {
    // Obtener los minutos y segundos del input
    const minutes = parseInt(document.getElementById("minutes").value, 10);
    const seconds = parseInt(document.getElementById("seconds").value, 10);
    
    // Calcular el tiempo total en segundos
    remainingTime = minutes * 60 + seconds;

    // Verificar que el tiempo ingresado es válido
    if (remainingTime <= 0) {
        alert("Por favor, ingresa un tiempo mayor a cero.");
        return;
    }

    // Si ya hay un intervalo en curso, limpiarlo
    if (countdownInterval) {
        clearInterval(countdownInterval);
    }

    // Iniciar el intervalo que actualiza el temporizador cada segundo
    countdownInterval = setInterval(updateCountdown, 1000);
}

function updateCountdown() {
    if (remainingTime <= 0) {
        clearInterval(countdownInterval);
        document.getElementById("countdown").textContent = "¡Tiempo completado!";
        alert("¡El tiempo ha terminado!");
        return;
    }

    // Calcular minutos y segundos restantes
    const minutes = Math.floor(remainingTime / 60);
    const seconds = remainingTime % 60;

    // Mostrar tiempo restante en formato 00:00
    document.getElementById("countdown").textContent = 
        `${String(minutes).padStart(2, '0')}:${String(seconds).padStart(2, '0')}`;
    
    // Reducir el tiempo restante en un segundo
    remainingTime--;
}

function resetTimer() {
    // Limpiar el intervalo si está en ejecución
    if (countdownInterval) {
        clearInterval(countdownInterval);
    }

    // Resetear el contador y el display del temporizador
    remainingTime = 0;
    document.getElementById("countdown").textContent = "00:00";
    document.getElementById("minutes").value = "0";
    document.getElementById("seconds").value = "0";
}
```

### Explicación

1. Inicio del Temporizador:
- El usuario ingresa minutos y segundos en los campos correspondientes.
- Al hacer clic en "Iniciar", la función startTimer() convierte el tiempo total a segundos.
- Se inicia un intervalo (setInterval) que ejecuta la función updateCountdown() cada segundo.

2. Actualización de la Cuenta Regresiva:
- En updateCountdown(), el tiempo se decrementa en un segundo en cada llamada y se actualiza el contenido de #countdown con el formato MM:SS.
- Si el tiempo llega a cero, el temporizador se detiene y se muestra un mensaje de alerta.

3. Reinicio del Temporizador:
- La función resetTimer() limpia el intervalo, restablece el valor de remainingTime a 0 y actualiza el contador visual para mostrar "00:00".


# Menu onteractivo

### html
```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menú de Comandas de Restaurante</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Menú de Comandas</h1>
    </header>

    <div id="menu">
        <h2>Entradas</h2>
        <ul id="entradas">
            <li>
                <span>Ensalada César</span> - <span>$5</span>
                <button onclick="addToOrder('Ensalada César', 5)">Añadir</button>
            </li>
            <li>
                <span>Sopa de Tomate</span> - <span>$4</span>
                <button onclick="addToOrder('Sopa de Tomate', 4)">Añadir</button>
            </li>
        </ul>

        <h2>Platos Principales</h2>
        <ul id="platos-principales">
            <li>
                <span>Pizza Margherita</span> - <span>$12</span>
                <button onclick="addToOrder('Pizza Margherita', 12)">Añadir</button>
            </li>
            <li>
                <span>Burger de Res</span> - <span>$10</span>
                <button onclick="addToOrder('Burger de Res', 10)">Añadir</button>
            </li>
        </ul>

        <h2>Postres</h2>
        <ul id="postres">
            <li>
                <span>Brownie con Helado</span> - <span>$6</span>
                <button onclick="addToOrder('Brownie con Helado', 6)">Añadir</button>
            </li>
            <li>
                <span>Cheesecake</span> - <span>$7</span>
                <button onclick="addToOrder('Cheesecake', 7)">Añadir</button>
            </li>
        </ul>
    </div>

    <div id="pedido">
        <h2>Tu Comanda</h2>
        <ul id="comanda-lista">
            <!-- Los artículos de la comanda se añadirán aquí -->
        </ul>
        <h3>Total: $<span id="total">0</span></h3>
        <button onclick="clearOrder()">Limpiar Comanda</button>
    </div>

    <script src="script.js"></script>
</body>
</html>
```

### JS
```js
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menú de Comandas de Restaurante</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Menú de Comandas</h1>
    </header>

    <div id="menu">
        <h2>Entradas</h2>
        <ul id="entradas">
            <li>
                <span>Ensalada César</span> - <span>$5</span>
                <button onclick="addToOrder('Ensalada César', 5)">Añadir</button>
            </li>
            <li>
                <span>Sopa de Tomate</span> - <span>$4</span>
                <button onclick="addToOrder('Sopa de Tomate', 4)">Añadir</button>
            </li>
        </ul>

        <h2>Platos Principales</h2>
        <ul id="platos-principales">
            <li>
                <span>Pizza Margherita</span> - <span>$12</span>
                <button onclick="addToOrder('Pizza Margherita', 12)">Añadir</button>
            </li>
            <li>
                <span>Burger de Res</span> - <span>$10</span>
                <button onclick="addToOrder('Burger de Res', 10)">Añadir</button>
            </li>
        </ul>

        <h2>Postres</h2>
        <ul id="postres">
            <li>
                <span>Brownie con Helado</span> - <span>$6</span>
                <button onclick="addToOrder('Brownie con Helado', 6)">Añadir</button>
            </li>
            <li>
                <span>Cheesecake</span> - <span>$7</span>
                <button onclick="addToOrder('Cheesecake', 7)">Añadir</button>
            </li>
        </ul>
    </div>

    <div id="pedido">
        <h2>Tu Comanda</h2>
        <ul id="comanda-lista">
            <!-- Los artículos de la comanda se añadirán aquí -->
        </ul>
        <h3>Total: $<span id="total">0</span></h3>
        <button onclick="clearOrder()">Limpiar Comanda</button>
    </div>

    <script src="script.js"></script>
</body>
</html>
```

### Explicacion

#### HTML:
La página tiene un menú dividido en tres secciones: Entradas, Platos Principales, y Postres. Cada sección contiene productos con su precio y un botón para añadirlo a la comanda.
Cuando el usuario añade un item, este aparece en la sección "Tu Comanda", donde se muestra el nombre del producto, su precio y un botón para eliminarlo.

#### JavaScript:
addToOrder(itemName, itemPrice): Esta función agrega un producto al pedido, actualizando tanto la lista de productos en la comanda como el total.
updateOrder(): Actualiza la lista de la comanda en la interfaz. Muestra cada producto con un botón de eliminar.
removeFromOrder(itemToRemove): Elimina un producto del pedido y actualiza tanto la lista como el total.
updateTotal(): Actualiza el total de la comanda mostrado en la página.
clearOrder(): Limpia la comanda y restablece el total a 0.

# Menu con .JSON

### html
```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menú de Restaurante con Datos desde JSON</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Menú del Restaurante</h1>
    </header>

    <div id="menu">
        <!-- Aquí se cargarán dinámicamente los productos del menú -->
    </div>

    <div id="pedido">
        <h2>Tu Comanda</h2>
        <ul id="comanda-lista">
            <!-- Los artículos de la comanda se añadirán aquí -->
        </ul>
        <h3>Total: $<span id="total">0</span></h3>
        <button onclick="clearOrder()">Limpiar Comanda</button>
    </div>

    <script src="script.js"></script>
</body>
</html>
```

Parte del json
```js
[
    {
        "category": "Entradas",
        "items": [
            { "name": "Ensalada César", "price": 5 },
            { "name": "Sopa de Tomate", "price": 4 }
        ]
    }, ... sigue
```

### Js
```js
let total = 0;
const orderList = [];

// Función para cargar los datos del JSON (simulado)
function loadMenu() {
    // Usamos fetch para simular la obtención de datos de un archivo JSON
    fetch('data.json')
        .then(response => response.json())  // Convertir la respuesta a JSON
        .then(menuData => {
            // Llamamos a la función para mostrar el menú
            displayMenu(menuData);
        })
        .catch(error => {
            console.error('Error al cargar los datos del menú:', error);
        });
}

// Función para mostrar el menú en la página
function displayMenu(menuData) {
    const menuContainer = document.getElementById("menu");

    // Iteramos a través de las categorías y los elementos
    menuData.forEach(category => {
        const categorySection = document.createElement('div');
        const categoryTitle = document.createElement('h2');
        categoryTitle.textContent = category.category;
        categorySection.appendChild(categoryTitle);

        const categoryList = document.createElement('ul');

        category.items.forEach(item => {
            const li = document.createElement('li');
            li.innerHTML = `<span>${item.name}</span> - <span>$${item.price}</span>`;

            // Botón para añadir al pedido
            const addButton = document.createElement('button');
            addButton.textContent = "Añadir";
            addButton.onclick = () => addToOrder(item.name, item.price);
            li.appendChild(addButton);

            categoryList.appendChild(li);
        });

        categorySection.appendChild(categoryList);
        menuContainer.appendChild(categorySection);
    });
}

// Función para añadir un item a la comanda
function addToOrder(itemName, itemPrice) {
    // Añadir el item a la lista de la comanda
    orderList.push({ name: itemName, price: itemPrice });

    // Actualizar el total
    total += itemPrice;

    // Actualizar la vista de la comanda y el total
    updateOrder();
    updateTotal();
}

// Actualizar la vista de la comanda
function updateOrder() {
    const comandaLista = document.getElementById("comanda-lista");
    comandaLista.innerHTML = ''; // Limpiar la lista de la comanda

    // Mostrar los items en la lista de la comanda
    orderList.forEach(item => {
        const li = document.createElement('li');
        li.textContent = `${item.name} - $${item.price}`;

        // Añadir un botón para eliminar el item
        const removeButton = document.createElement('button');
        removeButton.textContent = "Eliminar";
        removeButton.onclick = () => removeFromOrder(item);

        li.appendChild(removeButton);
        comandaLista.appendChild(li);
    });
}

// Función para eliminar un item de la comanda
function removeFromOrder(itemToRemove) {
    // Eliminar el item de la lista de la comanda
    const index = orderList.indexOf(itemToRemove);
    if (index > -1) {
        orderList.splice(index, 1);
    }

    // Actualizar el total
    total -= itemToRemove.price;

    // Actualizar la lista de la comanda y el total
    updateOrder();
    updateTotal();
}

// Actualizar el total de la comanda
function updateTotal() {
    const totalElement = document.getElementById("total");
    totalElement.textContent = total.toFixed(2);
}

// Limpiar la comanda
function clearOrder() {
    // Limpiar la comanda y el total
    orderList.length = 0;
    total = 0;

    updateOrder();
    updateTotal();
}

// Cargar el menú cuando la página se haya cargado
window.onload = loadMenu;
```

# App de pelis

### Html
```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aplicación de Películas</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Lista de Películas</h1>
    </header>

    <div id="movie-list">
        <!-- Las películas se cargarán aquí -->
    </div>

    <div id="favorites">
        <h2>Favoritas</h2>
        <ul id="favorites-list">
            <!-- Aquí se agregarán las películas favoritas -->
        </ul>
        <h3>Total de Favoritas: <span id="favorites-count">0</span></h3>
    </div>

    <script src="script.js"></script>
</body>
</html>
```

parte del json
```js
[
    {
        "title": "El Padrino",
        "genre": "Crimen, Drama",
        "year": 1972,
        "rating": 9.2
    }, ...sigue
```

```js
let favoriteMovies = [];

// Cargar las películas desde el archivo JSON
function loadMovies() {
    // Usamos fetch para obtener los datos de un archivo JSON
    fetch('data.json')
        .then(response => response.json())  // Convertir la respuesta a JSON
        .then(movies => {
            displayMovies(movies); // Mostrar las películas
        })
        .catch(error => {
            console.error('Error al cargar las películas:', error);
        });
}

// Mostrar las películas en la interfaz
function displayMovies(movies) {
    const movieListContainer = document.getElementById("movie-list");

    movies.forEach(movie => {
        const movieItem = document.createElement('div');
        movieItem.classList.add('movie-item');
        movieItem.innerHTML = `
            <h3>${movie.title} (${movie.year})</h3>
            <p><strong>Género:</strong> ${movie.genre}</p>
            <p><strong>Calificación:</strong> ${movie.rating}</p>
            <button onclick="addToFavorites('${movie.title}', '${movie.year}')">Añadir a Favoritas</button>
        `;
        movieListContainer.appendChild(movieItem);
    });
}

// Agregar una película a la lista de favoritas
function addToFavorites(title, year) {
    // Evitar agregar duplicados
    if (!favoriteMovies.find(movie => movie.title === title)) {
        favoriteMovies.push({ title, year });
        updateFavorites();
    }
}

// Mostrar la lista de favoritas en la interfaz
function updateFavorites() {
    const favoritesListContainer = document.getElementById("favorites-list");
    const favoritesCount = document.getElementById("favorites-count");

    // Limpiar la lista de favoritas
    favoritesListContainer.innerHTML = '';

    // Añadir las películas favoritas a la lista
    favoriteMovies.forEach(movie => {
        const favoriteItem = document.createElement('li');
        favoriteItem.textContent = `${movie.title} (${movie.year})`;
        favoritesListContainer.appendChild(favoriteItem);
    });

    // Actualizar el número de películas favoritas
    favoritesCount.textContent = favoriteMovies.length;
}

// Cargar las películas cuando la página se cargue
window.onload = loadMovies;
```

## Resumen 

1. Cargar el archivo data.json con fetch
El primer paso es recuperar la información de un archivo JSON que contiene datos sobre las películas. Para ello, usamos el método fetch. Este método se encarga de enviar una solicitud a un servidor (en este caso, simulamos que es un archivo en el servidor local) y obtener la información.

```js
fetch('data.json')
    .then(response => response.json())  // Convertir la respuesta a JSON
    .then(movies => {
        displayMovies(movies); // Llamamos a la función para mostrar las películas
    })
    .catch(error => {
        console.error('Error al cargar las películas:', error);
    });

```

- fetch('data.json'): Aquí usamos fetch para pedir el archivo data.json. Este archivo contiene la información de las películas.

- .then(response => response.json()): Cuando fetch recibe la respuesta (es decir, el archivo data.json), convierte esa respuesta en un objeto JavaScript usando .json().

- .then(movies => { ... }): Después de que los datos se convierten en objetos JavaScript, llamamos a la función displayMovies(movies) para mostrar las películas en la página.

- .catch(error => {...}): Si hay un error en el proceso (como que no se encuentre el archivo data.json), lo mostramos en la consola con console.error.


2. Mostrar las películas en la página
La función displayMovies es la que se encarga de mostrar las películas que vienen desde el archivo JSON en la página web. Vamos a ver cómo funciona:

```js
function displayMovies(movies) {
    const movieListContainer = document.getElementById("movie-list");

    movies.forEach(movie => {
        const movieItem = document.createElement('div');
        movieItem.classList.add('movie-item');
        movieItem.innerHTML = `
            <h3>${movie.title} (${movie.year})</h3>
            <p><strong>Género:</strong> ${movie.genre}</p>
            <p><strong>Calificación:</strong> ${movie.rating}</p>
            <button onclick="addToFavorites('${movie.title}', '${movie.year}')">Añadir a Favoritas</button>
        `;
        movieListContainer.appendChild(movieItem);
    });
}
```

- movies.forEach(movie => {...}): Recibimos las películas en la variable movies (un array). Usamos forEach para recorrer cada película y mostrarla en la página.

- const movieItem = document.createElement('div'): Para cada película, creamos un div (un bloque HTML) que contendrá la información de esa película.

- movieItem.innerHTML = ...: Aquí le agregamos el contenido HTML al div. Mostramos el título de la película, el año, el género y la calificación, y también añadimos un botón que dice "Añadir a Favoritas". Este botón ejecutará la función addToFavorites cuando se haga clic en él.

- movieListContainer.appendChild(movieItem): Finalmente, agregamos cada película a la lista de películas en el contenedor (#movie-list), que es donde se mostrarán todas las películas en la página.


3. Agregar una película a las "Favoritas"
Cuando el usuario hace clic en el botón de "Añadir a Favoritas", se ejecuta la función addToFavorites:

```js
function addToFavorites(title, year) {
    if (!favoriteMovies.find(movie => movie.title === title)) {
        favoriteMovies.push({ title, year });
        updateFavorites();
    }
}
```

- if (!favoriteMovies.find(movie => movie.title === title)): Este condicional verifica si la película que estamos agregando ya está en la lista de favoritas. Si ya está, no hace nada; si no está, la agrega.

- favoriteMovies.push({ title, year }): Si la película no está en la lista de favoritas, la añadimos al array favoriteMovies con el título y año de la película.

- updateFavorites(): Después de agregar la película, llamamos a la función updateFavorites para actualizar la lista de favoritas y mostrarla en la página.

4. Mostrar las "Favoritas"
La función updateFavorites es la que actualiza la lista de películas favoritas en la página:

```js
function updateFavorites() {
    const favoritesListContainer = document.getElementById("favorites-list");
    const favoritesCount = document.getElementById("favorites-count");

    favoritesListContainer.innerHTML = '';  // Limpiar la lista actual de favoritas

    favoriteMovies.forEach(movie => {
        const favoriteItem = document.createElement('li');
        favoriteItem.textContent = `${movie.title} (${movie.year})`;
        favoritesListContainer.appendChild(favoriteItem);
    });

    favoritesCount.textContent = favoriteMovies.length;
}
```

- favoritesListContainer.innerHTML = '': Primero limpiamos la lista de favoritas, para asegurarnos de que no haya repeticiones o elementos viejos.

- favoriteMovies.forEach(movie => {...}): Recorremos todas las películas que están en la lista de favoritas (favoriteMovies) y las mostramos en la página.

- favoritesCount.textContent = favoriteMovies.length: Finalmente, actualizamos el contador de "Favoritas", que es el número total de películas que se han agregado a la lista.

5. Cargar el menú cuando la página se carga
Para que todo esto funcione, necesitamos cargar las películas cuando la página se ha cargado. Esto lo logramos con el evento window.onload:

```js
window.onload = loadMovies;
``` 

- window.onload: Este evento se ejecuta cuando toda la página (incluyendo el HTML, CSS y JavaScript) ha sido completamente cargada. Al momento de cargar la página, se ejecuta la función loadMovies, que se encarga de cargar las películas desde el archivo data.json.

Resumen
- Recuperamos los datos de un archivo JSON utilizando fetch y los convertimos en objetos JavaScript.
- Mostramos las películas en la página utilizando innerHTML y las mostramos dinámicamente.
- Permites que el usuario agregue películas a una lista de favoritas, asegurándote de que no se repitan.
- Actualizas la interfaz de la lista de favoritas y el contador de favoritas cuando el usuario agrega una película.
- Cuando la página se carga, todo el proceso comienza con window.onload, que llama a loadMovies para obtener y mostrar las películas.



# Cosas de básicas

# Conceptos básicos

| Concepto               | Descripción | Ejemplo de Código |
|------------------------|-------------|--------------------|
| **Bucle `for`**        | Recorre una secuencia de valores un número determinado de veces. | ```javascript\nfor (let i = 0; i < 5; i++) {\n    console.log(i);\n}\n``` |
| **Bucle `while`**      | Ejecuta un bloque de código mientras se cumpla una condición. | ```javascript\nlet i = 0;\nwhile (i < 5) {\n    console.log(i);\n    i++;\n}\n``` |
| **Bucle `for...of`**   | Recorre elementos de un array o iterable, como un `string`. | ```javascript\nconst array = [1, 2, 3];\nfor (const num of array) {\n    console.log(num);\n}\n``` |
| **Bucle `for...in`**   | Recorre propiedades de un objeto (ideal para iterar sobre objetos). | ```javascript\nconst obj = {a: 1, b: 2};\nfor (const key in obj) {\n    console.log(key, obj[key]);\n}\n``` |
| **Objeto**             | Colección de pares clave-valor que representa una entidad. | ```javascript\nconst persona = {\n    nombre: "Ana",\n    edad: 25\n};\n``` |
| **Acceder a un Objeto**| Accede a valores en un objeto mediante `.` o `[]`. | ```javascript\nconsole.log(persona.nombre); // "Ana"\nconsole.log(persona["edad"]); // 25\n``` |
| **Modificar un Objeto**| Cambia valores o añade propiedades a un objeto existente. | ```javascript\npersona.edad = 26;\npersona.pais = "México";\n``` |
| **Función**            | Bloque de código reutilizable. Puede tener parámetros y devolver un valor. | ```javascript\nfunction saludar(nombre) {\n    return `Hola, ${nombre}`;\n}\nconsole.log(saludar("Ana"));\n``` |
| **Función Flecha**     | Función corta usando `=>`. Ideal para funciones rápidas. | ```javascript\nconst saludar = nombre => `Hola, ${nombre}`;\nconsole.log(saludar("Ana"));\n``` |
| **Array**              | Colección ordenada de elementos, accedidos por índice. | ```javascript\nconst frutas = ["manzana", "plátano", "cereza"];\n``` |
| **Acceder a un Array** | Accede a elementos por índice. | ```javascript\nconsole.log(frutas[0]); // "manzana"\n``` |
| **Modificar un Array** | Cambia elementos, añade o elimina usando métodos. | ```javascript\nfrutas.push("naranja");\nfrutas[1] = "fresa";\n``` |
| **Método `.push()`**   | Añade uno o más elementos al final del array. | ```javascript\nfrutas.push("uva");\n``` |
| **Método `.pop()`**    | Elimina el último elemento del array. | ```javascript\nfrutas.pop();\n``` |
| **Método `.shift()`**  | Elimina el primer elemento del array. | ```javascript\nfrutas.shift();\n``` |
| **Método `.unshift()`**| Añade uno o más elementos al inicio del array. | ```javascript\nfrutas.unshift("sandía");\n``` |
| **Condicional `if`**   | Ejecuta código si se cumple una condición. | ```javascript\nif (frutas.length > 0) {\n    console.log("Hay frutas disponibles");\n}\n``` |
| **Condicional `if...else`** | Ejecuta un bloque si se cumple una condición, otro bloque si no se cumple. | ```javascript\nif (frutas.length > 0) {\n    console.log("Hay frutas");\n} else {\n    console.log("No hay frutas");\n}\n``` |
| **Operador Ternario**  | Forma breve de un `if...else`. | ```javascript\nconst mensaje = frutas.length > 0 ? "Hay frutas" : "No hay frutas";\n``` |
| **`switch`**           | Ejecuta bloques de código según el valor de una variable. | ```javascript\nconst fruta = "manzana";\nswitch (fruta) {\n    case "manzana":\n        console.log("Es una manzana");\n        break;\n    case "plátano":\n        console.log("Es un plátano");\n        break;\n    default:\n        console.log("Fruta desconocida");\n}\n``` |
| **`try...catch`**      | Maneja errores para evitar que el código se detenga. | ```javascript\ntry {\n    let resultado = dividir(10, 0);\n} catch (error) {\n    console.error("Ocurrió un error:", error.message);\n}\n``` |
| **`setTimeout`**       | Ejecuta código después de un tiempo especificado (ms). | ```javascript\nsetTimeout(() => {\n    console.log("Han pasado 2 segundos");\n}, 2000);\n``` |
| **`setInterval`**      | Ejecuta código repetidamente cada intervalo especificado (ms). | ```javascript\nsetInterval(() => {\n    console.log("Cada segundo");\n}, 1000);\n``` |
| **JSON.stringify**     | Convierte un objeto o array en un texto JSON. Ideal para `localStorage`. | ```javascript\nconst obj = {nombre: "Ana"};\nconst json = JSON.stringify(obj);\n``` |
| **JSON.parse**         | Convierte una cadena JSON en un objeto o array de JavaScript. | ```javascript\nconst obj = JSON.parse(json);\n``` |
| **`localStorage.setItem`** | Guarda un dato en `localStorage` con una clave. Persiste incluso al cerrar el navegador. | ```javascript\nlocalStorage.setItem("nombre", "Ana");\n``` |
| **`localStorage.getItem`** | Recupera un dato de `localStorage` por su clave. | ```javascript\nconst nombre = localStorage.getItem("nombre");\n``` |
| **`localStorage.removeItem`** | Elimina un dato de `localStorage` por su clave. | ```javascript\nlocalStorage.removeItem("nombre");\n``` |



1. Bucle for
Un bucle for recorre una secuencia de valores un número determinado de veces.

```js
for (let i = 0; i < 5; i++) {
    console.log(i); // Imprime 0, 1, 2, 3, 4
}
```

2. Bucle while
El bucle while ejecuta un bloque de código mientras se cumpla una condición.

```js
let i = 0;
while (i < 5) {
    console.log(i); // Imprime 0, 1, 2, 3, 4
    i++;
}
```

3. Bucle for...of
El bucle for...of recorre elementos de un array o de un iterable, como un string.

```js
const array = [1, 2, 3];
for (const num of array) {
    console.log(num); // Imprime 1, 2, 3
}
```

4. Bucle for...in
El bucle for...in recorre propiedades de un objeto.

```js
const obj = { a: 1, b: 2 };
for (const key in obj) {
    console.log(key, obj[key]); // Imprime 'a 1' y 'b 2'
}
```

5. Objeto
Un objeto es una colección de pares clave-valor que representa una entidad.

```js
const persona = {
    nombre: "Ana",
    edad: 25
};
```

6. Acceder a un Objeto
Puedes acceder a valores en un objeto mediante el operador . o [].

```js
console.log(persona.nombre);    // "Ana"
console.log(persona["edad"]);   // 25
```

7. Modificar un Objeto
Para cambiar valores o añadir propiedades en un objeto existente.

```js
persona.edad = 26;
persona.pais = "México";
console.log(persona); // {nombre: "Ana", edad: 26, pais: "México"}
```

8. Función
Una función es un bloque de código reutilizable. Puede tener parámetros y devolver un valor.

```js
function saludar(nombre) {
    return `Hola, ${nombre}`;
}
console.log(saludar("Ana")); // "Hola, Ana"
```

9. Función Flecha
Las funciones flecha permiten una sintaxis corta usando =>.

```js
const saludar = nombre => `Hola, ${nombre}`;
console.log(saludar("Ana")); // "Hola, Ana"
```

10. Array
Un array es una colección ordenada de elementos, accedidos por índice.

```js
const frutas = ["manzana", "plátano", "cereza"];
```

11. Acceder a un Array
Para acceder a un elemento del array por índice.

```js
console.log(frutas[0]); // "manzana"
```

12. Modificar un Array
Puedes cambiar elementos o añadir/eliminar usando varios métodos.

```js
frutas.push("naranja");   // Añade "naranja" al final
frutas[1] = "fresa";      // Cambia "plátano" a "fresa"
```

13. Método .push()
El método push() añade uno o más elementos al final del array.

```js
frutas.push("uva");
console.log(frutas); // ["manzana", "fresa", "cereza", "naranja", "uva"]
```

14. Método .pop()
El método pop() elimina el último elemento del array.

```js
frutas.pop();
console.log(frutas); // ["manzana", "fresa", "cereza", "naranja"]
```

15. Método .shift()
El método shift() elimina el primer elemento del array.

```js
frutas.shift();
console.log(frutas); // ["fresa", "cereza", "naranja"]
```

16. Método .unshift()
El método unshift() añade uno o más elementos al inicio del array.

```js
frutas.unshift("sandía");
console.log(frutas); // ["sandía", "fresa", "cereza", "naranja"]
```

17. Condicional if
La estructura if ejecuta código solo si se cumple una condición.

```js
if (frutas.length > 0) {
    console.log("Hay frutas disponibles");
}
```

18. Condicional if...else
El condicional if...else ejecuta un bloque si se cumple la condición y otro si no se cumple.

```js
if (frutas.length > 0) {
    console.log("Hay frutas");
} else {
    console.log("No hay frutas");
}
``` 

19. Operador Ternario
El operador ternario es una forma breve de if...else.

```js
const mensaje = frutas.length > 0 ? "Hay frutas" : "No hay frutas";
console.log(mensaje);
```

20. switch
La estructura switch ejecuta bloques de código según el valor de una variable.

```js
const fruta = "manzana";
switch (fruta) {
    case "manzana":
        console.log("Es una manzana");
        break;
    case "plátano":
        console.log("Es un plátano");
        break;
    default:
        console.log("Fruta desconocida");
}
```

21. try...catch
try...catch maneja errores para evitar que el código se detenga si ocurre uno.

```js
try {
    let resultado = dividir(10, 0);
} catch (error) {
    console.error("Ocurrió un error:", error.message);
}
``` 

22. setTimeout
setTimeout ejecuta código después de un tiempo especificado (en milisegundos).

```js
setTimeout(() => {
    console.log("Han pasado 2 segundos");
}, 2000);
```

23. setInterval
setInterval ejecuta código repetidamente en intervalos específicos (en milisegundos).

```js
setInterval(() => {
    console.log("Cada segundo");
}, 1000);
```

24. JSON.stringify
JSON.stringify convierte un objeto o array en una cadena JSON. Es útil para almacenar en localStorage.

```js
const obj = { nombre: "Ana" };
const json = JSON.stringify(obj);
console.log(json); // '{"nombre":"Ana"}'
```

25. JSON.parse
JSON.parse convierte una cadena JSON en un objeto o array de JavaScript.

```js
const obj = JSON.parse(json);
console.log(obj); // { nombre: "Ana" }
```

26. localStorage.setItem
localStorage.setItem guarda un dato en localStorage con una clave. Este dato persiste incluso si cierras el navegador.

```js
localStorage.setItem("nombre", "Ana");
```

27. localStorage.getItem
localStorage.getItem recupera un dato de localStorage por su clave.

```js
const nombre = localStorage.getItem("nombre");
console.log(nombre); // "Ana"
```

28. localStorage.removeItem
localStorage.removeItem elimina un dato de localStorage por su clave.

```js
localStorage.removeItem("nombre");
```



