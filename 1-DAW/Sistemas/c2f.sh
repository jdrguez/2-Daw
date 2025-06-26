#######################################################
#
# Autor= Jose Domingo
#
# Entrada = Grados farenheit
# Salida = Grados Celcium
# 
# Objetivo= Convertir los grados celcium  a farenheit
# 
# Historial:
#	2023-12-23: Versión 1
#       2024-01-09: Versión 2
#######################################################




grados=$1
ndec=$2

if [ $# -eq 0 ]
then
  echo "ERROR: No has indicado argumentos. Debes indicar 2 argumentos"
  echo "SINTAXIS: $0 <grados f> <num decimales>"
  exit
elif [ $# -eq 1 ]
then
    echo "Por defecto se cogeran 2 deciamales"
    ndec=2
elif [ $# -eq 2 ]
then
  echo "Has indicado los correctos"
else
  echo "Has indicado $# mas argumentos de los requeridos, solo se cogeran los dos primeros $grados y $ndec"
fi

resultado=$(echo "scale=$ndec;$grados * 9 / 5 + 32" | bc)

echo "${grados}ºC son ${resultado}ºF"
