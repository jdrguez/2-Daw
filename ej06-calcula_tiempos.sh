#!/bin/bash


segundos=$1

if [ $# -eq 0 ]
then
    echo "Error: Se detiene la ejecución porque no existe argumentos para ejecutar"
    exit
elif [ $# -gt 1 ]
then 
    echo "Error: se detine la ejecución porque hay mas argumentos que uno"
    exit
else
    dias=$(($segundos /86400 ))
    horas=$(($segundos %86400 / 3600))
    minutos=$(( $segundos %3600 / 60))
    segundos=$(($segundos %60))

    echo $"tus $segundos son un total de $dias dias, $horas horas, $minutos minutos y $segundos segundos"
fi
