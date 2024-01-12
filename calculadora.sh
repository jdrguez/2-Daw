a=$1
b=$2

PS3="Elija una de las opciones: "
select opcion in "Sumar" "Restar" "Multiplicar" "Dividir" "Modulo" "Salir"
do

    case $opcion in 
        "Sumar") echo "El resultado de $a + $b = $(( a+b ))";;
        "Restar") echo "El resultado de $a - $b = $(( a-b ))";;
        "Multiplicar") echo "El resultado de $a * $b = $(( a*b ))";;
        "Dividir") echo "El resultado de $a / $b = $(( a/b ))";;
        "Modulo") echo "El resultado de $a % $b = $(( a%b ))";;
        "Salir") break ;;
        *) echo "Error, '$REPLY' ha indicado una opcion incorrecta"
    esac
done
