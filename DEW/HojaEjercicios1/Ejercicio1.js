
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