#!/bin/bash

if [ $# -lt 2 ]; then
echo "Usage: $0 <asec|desc> <num1> [num2 ...]>"
exit 1
fi

order="$1"; shift

if [ "$order" = "asc" ]; then
for n in "$@"; do echo "$n"; done | sort -n 
elif [ "$order" = "desc" ]; then
for n in "$@"; do echo "$n"; done | sort -nr

else
echo "First argument must be 'asc' or 'desc'"
exit 1
fi
