








num1=$1
num2=$2

if [ $# -lt 2 ]
then
  echo "Has introducido solo un numero"
  read -p "Por favor introduzca un numero nuevo" num2
fi

if [ "$num1" -gt "$num2" ]
then
  echo "$num1 es mayor que $num2"
elif [ "$num2" -gt "$num1" ]
then
  echo "$num2 es mayor que $num1"
elif [ "$num1" -eq "$num2" ]
then
  echo "$num1 es igual que $num2"
fi



