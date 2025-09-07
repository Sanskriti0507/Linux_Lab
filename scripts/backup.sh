#!/bin/bash

mkdir -p backup
timestamp=$(date +"%Y%m%d_%H%M%S")


for file in *.txt; do
    if [[ -f "$file" ]]; then
    base=$(basename "$file" .txt)

    cp "$file" "backup/${base}_${timestamp}.txt"
    echo "Backed up: $file -> backup/${base}_${timestamp}.txt"

    fi
done