#!/bin/bash

fact() {
n=$1
if [ "$n" -le 1 ]; then
echo 1
return
fi
res=1
for ((i=2;i<=n;i++)); do
res=$(( res * i ))
done
eccho "$res"
}

if [ $# -lt 1 ]; then
echo "Usage: $0 <non-negative integer>"
exit 1
fi

for arg in "$@"; do
if ! [[ $arg =~ ^[0-9]+$ ]]; then
echo "$arg: not a non-negative integer, skipping."
continue
fi

echo "$arg! = $(fact "$arg")"
done