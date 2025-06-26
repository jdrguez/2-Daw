#!/bin/bash

######################################################################
#   Nombre: Gestión de procesos                                      #
#   Autores: José Domingo Rguez y Lili                               #
#                                                                    #
#   Objetivo: Crear un menú para analizar los procesos que consuman  #
#   los recursos indicados.                                          #
#                                                                    #
#   Entrada: Parametros de MaxCpu y MaxMem                           #
#   Salida: Monstrar los procesos y con su correspondiente menú      #
#                                                                    #
#   Fecha: 22/04/2024                                                #
#                                                                    #
#    Versión: 1.0                                                    #
######################################################################


maxCPU=$1
maxMem=$2


trap "echo Se procede a interrumpir la ejecución..; exit 0" INT
trap "echo Finalizando la ejecución del script...; exit 0" TERM
trap "echo Carga del sistema; uptime" USR1
trap "echo Límite del proceso; unlimit -u" USR2
comprobacion_sistema(){
    while true
    do

        echo "Estamos comprobando tanto la CPU como la memoria del sistema..."
        echo "Espere, por favor ... "

        sleep 2
        clear

        procesosCPU=$(ps axo pcpu= --sort -pcpu | head -n 1)
        pidCPUprocesos=$(ps axo pid= --sort -pcpu | head -n 1)

        procesosMEMORIA=$(ps axo pmem= --sort -pmem | head -n 1)
        pidMEMORIAprocesos=$(ps axo pid= --sort -pmem | head -n 1)

        if echo "$procesosCPU >= $maxCPU" | bc -l | grep -q 1 && echo "$procesosMEMORIA > $maxMem" | bc -l | grep -q 1;
        then
            echo "Los procesos $pidCPUprocesos y $pidMEMORIAprocesos  se han sobrepasado los limites"
            read -p "Seleccione entre los siguientes CPU(1,a) o Memoria(2,b): " opcion
            
            case "$opcion" in
                CPU|cpu|1|a) echo "Has elegido coger el proceso en CPU"
                ps p $pidCPUprocesos
                menu
                break
                ;;
            
                Memoria|memoria|mem|b|2) echo "Has elegido coger el proceso en memoria"
                ps p  $pidMEMORIAprocesos
                menu
                break
                ;;

                *) echo "$opcion no es una opción válida"
                break
                ;;
            esac
        elif echo "$procesosCPU >= $maxCPU" | bc -l | grep -q 1
        then 
            ps p $pidCPUprocesos
            menu $pidCPUprocesos
            break
        elif echo "$procesosMEMORIA >= $maxMem" | bc -l | grep -q 1
        then
            ps p $pidMEMORIAprocesos
            menu $pidMEMORIAprocesos
            break
        fi

        sleep 6

    done
}






menu(){
    echo ""
    echo "*************************"
    echo "**** O P C I O N E S ****"
    echo "*************************"
    echo ""
    echo " a) Ignorar el aviso y seguir comprobando"
    echo " b) Disminuir en 3 puntos la prioridad del proceso"
    echo " c) Interrumpir el proceso"
    echo " d) Terminar el proceso"
    echo " e) Finalizar inmediatamente el proceso"
    echo " f) Detener el proceso (congelarlo de forma evitable)"
    echo " g) Detener el proceso (congelarlo de forma inevitable)"


    while true
    do
        read -p "Introduzca la opción que quiere realizar con su proceso: " choice
        case "$choice" in
            a|A|1) echo "Ignoramos el aviso y seguimos comprobando..."
            comprobacion_sistema
            ;;
            b|B|2) echo "Disminuir puntos la prioridad del proceso"
            read -p "Cuantos puntos quieres disminuir el proceso" puntos
            renice $puntos $pidCPUprocesos
            break
            ;;
            c|C|3) echo "Interrumpir el proceso"
            kill -INT $pidCPUprocesos
            break
            ;;
            d|D|4) echo "Terminando el proceso"
            kill -TERM $pidCPUprocesos
            break
            ;;
            e|E|5) echo "Finalizando inmediatamente el proceso"
            kill -KILL $pidCPUprocesos
            break
            ;;
            f|F|6) echo "Deteniendo el proceso, pero no es reversible."
            kill -TSTP $pidCPUprocesos
            ;;
            g|G|7) echo "Deteniendo el proceso definitivamente. No se puede revertir esta acción."
            kill -STOP $pidCPUprocesos
            ;;
            *) echo "Opción incorrecta. $choice no es una opción correcta."
            ;;
        esac
    done
}



if [ "$#" -ne 2 ]; 
then
    echo "ERROR 100: Debes introducir dos argumentos para que el programa pueda funcionar "
    exit 100
fi

if [ "$1" -lt 0 ] || [ "$2" -lt 0 ];
then 
    echo "ERROR 200: Los valores introducidos no son correctos, estos son inferiores a 0"
    exit 200
fi

if [ "$2" -gt 100 ];
then 
    echo "ERROR 150: $maxMen es mayor al 100% del cpu. Introduzca valores correctos"
    exit 150
fi

comprobacion_sistema


