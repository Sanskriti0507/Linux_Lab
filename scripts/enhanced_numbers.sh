#!/bin/bash

read -p "Enter start value: " start
read -p "Enter end value: " end
read -p "Enter step value: " step

if [ "$step" -le 0 ]; then
echo "Step must be positive."
exit 1
fi

if ! [[ "$start" =~ ^-?[0-9]+$ ]] || ! [[ "$end" =~ ^-?[0-9]+$ ]] || ! [[ "$step" =~ ^[0-9]+$ ]]; then
echo "Start and end must be integers and step must be positive."
exit 1
fi

if [ $start -le $end ]; then
    for (( i=$start; i<=$end; i+=$step )); do
    echo "Number: $i"
    done
else
    for (( i=$start; i>=$end; i-=$step )); do
    echo "Number: $i"
    done
fi