#######################################################
#
# Autor= Jose Domingo
#
# Entrada = dias, meses y años
# Salida = dia de la semana
# 
# Objetivo= indicar que dia de la semana es una fecha correspondiente
# 
# Historial:
#	2024-01-09: Versión 1
#
#######################################################


dia=$1
mes=$2
anyo=$3

resultado=$(date -d $anyo-$mes-$dia +"%A")

echo "El dia $dia/$mes/$anyo es $resultado" 
