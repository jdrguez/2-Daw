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