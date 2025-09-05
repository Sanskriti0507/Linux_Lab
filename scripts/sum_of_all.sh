#!/bin/bash

if [ $# -ne 1 ]; then
echo "Usage: $0 <posiive integer>"
exit 1
fi

num="$1"
if ! [[ $num =~ ^[0-9]+$ ]]; then
echo "Input must be an non negative numbee"
exit 1
fi

sum=0
while [ $num -gt 0 ]; do
digit=$(( num % 10 ))
sum=$(( sum + digit ))
num=$(( num / 10 ))
done 

echo "sum of digits=$sum"