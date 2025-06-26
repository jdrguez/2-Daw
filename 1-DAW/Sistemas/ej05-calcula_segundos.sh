#!/bin/bash
dias=$1
horas=$2
minutos=$3
segundos=$4

if [ $# -lt 4 ]
then
    echo "Error: No has puesto la cantidad de argumentos necesarios"
    read -p "Introduce cuatro argumentos" dias horas minutos segundos
fi

operacion=$(( ($dias * 24 * 3600 ) + ($horas * 3600)  + ($minutos * 60 ) + $segundos ))
echo "$dias días, $horas horas, $minutos minutos y $segundos segundos son un total de = ${operacion} segundos"
