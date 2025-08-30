#!/bin/bash

names=("Alice" "Bob")
subjects=("Math" "Science")

for name in "${names[@]}"
do
for subject in "${subjects[@]}"
do
    echo "$name is studying $subject"
done
done