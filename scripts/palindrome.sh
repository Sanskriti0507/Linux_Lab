#!/bin/bash

if [ $# -ne 1 ]; then
echo "Usage: $0 <non negative integer>"
exit 1
fi

n="$1"
if ! [[ $n =~ ^[0-9]+$ ]]; then
echo "Enter a non negative integer"
exit 1
fi

orig="$n"
rev=0
while [ "$n" -gt 0 ]; do
rev=$(( rev * 10 + (n % 10) ))
n=$(( n / 10 ))
done

if [ "$orig" -eq "$rev" ]; then
echo "It is a palindrome number"

else
echo "It is not a palindrome number"

fi