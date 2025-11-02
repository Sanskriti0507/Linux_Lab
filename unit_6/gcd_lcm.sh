#!/bin/bash

if [ $# -ne 2 ]; then
echo "Usage: $0 <int1> <int2>"
exit 1
fi

a=$1; b=$2

if ! [[ $a =~ ^[0-9]+$ ]] || ! [[ $b =~ ^[0-9]+$ ]]; then
echo "Both arguments must be non negative integers."
exit 1
fi

gcd(){
    x=$1; y=$2
    while [ "$y" -ne 0 ]; do
    t=$(( x % y))
    x=$y
    y=$t
    done
    echo "$x"
}

g=$(gcd "$a" "$b")
if [ "$g" -eq 0 ]; then
lcm=0
else
lcm=$(( (a / g) * b ))
fi

echo "GCD($a,$b) = $g"
echo "LCM($a,$b) = $lcm"

