#!/bin/bash

if [ $# -ne 3 ]; then
echo "Usage: $0 <num1, num2, operator>"
exit 1
fi

sum(){
    echo "Result=$(($1 + $2))"
}

substract(){
    echo "Result=$(($1 - $2))"
}

multiply(){
    echo "Result=$(($1 x $2))"
}

divide(){
    if [ $2 -eq 0 ]; then
    echo "Invalid."
    else
    echo "Result=$(($1 / $2))"
    fi
}

num1=$1
num2=$2
op=$3


case $op in
+) sum $num1 $num2;;
-) substract $num1 $num2;;
x) multiply $num1 $num2;;
/) divide $num1 $num2;;
esac