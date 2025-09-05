#!/bin/bash

if [ $# -ne 1 ]; then
echo "Usage $0 <positive number>"
exit 1 
fi

n="$1"
if ! [[ $n =~ ^[0-9]+$ ]]; then
echo "$n is not a prime number"
exit 1
fi


prime=1
i=2
while [ $((i *i)) -le "$n" ]; do
if [ $((n % i)) -eq  0 ]; then
prime=0
break
fi
((i++))
done

if [ $prime -eq 1 ]; then
echo "$n is a prime number"
else
echo "$n is not a prime number"
fi