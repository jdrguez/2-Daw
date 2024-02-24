function media2v {
    local a=$1
    local b=$2

    if [ -z "$a" ] || [ -z "$b" ]
    then
        return 10
    fi

    local med=$(((a+b)/2))
    echo "$med"
    return 0
}

#Modo2
mediaNV(){
    
    local sum=0
    for  val in "$@"
    do 
        ((sum+=val))
    done    
    echo "$(($sum/$#))"
}

#Modo3 
function mediaMv(){

    local sum=0
    local num_arg=0
    while [ -n $1 ]
    do
        ((sum+=val))
        ((num_arg++))
        shift
    done
    echo "$(($sum/$#))"    
}

res=$(media2v 4 7)
echo "El resultado es $res"
echo "El error devuledo es $?"

media2v
res=$(mediaMv 2 4 8 9 36 14)
echo "$res"



#el echo de los errores tienes que ponerlo despues de la operación sino te cogerá el que tenga antes"