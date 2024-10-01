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