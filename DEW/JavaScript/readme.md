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

