#!/bin/bash

cantidad_euros=$1
interes_tae=$2
anios=$3

if [ $# -ne 3 ]
then
    echo "ERROR: Debes proporcionar 3 valores: cantidad de euros, TAE y años"
    exit 100
fi

echo "Para un depósito de $cantidad_euros con un interes de $interes_tae a $anios, sera: "

for i in $(seq 1 $anios); do
    dinero_actual=$(((( ($cantidad_euros * (1 + $interes_tae / 100)  ) | bc
    ganancia= $(echo "$dinero_actual - $cantidad_euros" | bc)

    echo "Año $i: $cantidad_euros * (1 + $interes_tae / 100)= $dinero_actual euros (en total has ganado $ganancia euros)"

    cantidad_euros=$dinero_actual
done
