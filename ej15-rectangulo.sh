#!/bin/bash
base=$1
altura=$2


if [ $# -eq 0 ]
then
    echo "ADVERTENCIA: No has puesto argumentos"
    echo "Se utilizaran por defecto base 7 y altura 4"
    base=7
    altura=4
elif [ $# -eq 1 ]
then
    echo "ADVERTENCIA: Solo se ha indicado la base $base"
    echo "Se utilizará el valor de altura 4 por defecto"
    base=$1
    altura=4
fi

area=$((base * altura))

echo "Se va a pintar un rectángulo de base : $base , altura: $altura y área: $area"

for y in $(seq 1 $altura); do
    for x in $(seq 1 $base); do
        echo -n " #"
    done
    echo
done
