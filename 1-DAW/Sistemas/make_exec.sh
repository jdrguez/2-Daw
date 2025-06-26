#!/bin/bash

element=$1
permisos='No'

if [ -z "$element" ]
then
    echo "ERROR: no has introducido ningun argumento"
    read -p "Por favor introduzca un argumento" element
fi

if [ -e "$element" ]
then
    echo "'$element' EXISTE"
    if [ -f "$element" ]
    then
        echo " '$element' es un fichero"
    else 
        echo " '$element' no es un fichero"
    fi
fi

if [ ! -x "$element" ]
then
    echo "'$element' no tiene permisos de ejecución"
    read -p "Quieres que '$element' tenga permisos de ejecución (si/no)" permisos
    if [ $permisos='si' ]
    then
        chmod u+x $element
    else
        echo " '$element' no tiene permisos "
    fi
fi