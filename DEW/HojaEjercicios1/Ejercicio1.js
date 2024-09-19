
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
