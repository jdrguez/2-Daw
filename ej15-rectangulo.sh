#!/bin/bash
base=$1
altura=$2


if [ $# -eq 0 ]
then
    base=7
    altura=4
elif [ $# -eq 1 ]
then
    base=$1
    altura=4
fi

area=$((base * altura))

echo "Se va a pintar un rectángulo de base : $base , altura: $altura y área: $area"

for ((y = 0; y < altura; y++)); do
    for ((x = 0; x < base; x++)); do
        echo -n " #"
    done
    echo
done