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


