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

function funcion2(){

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


//Ejercicio 6
//Ejercicio 7
//Ejercicio 8



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