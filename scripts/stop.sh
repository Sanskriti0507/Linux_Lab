#!/bin/bash

word=""

while [ "$word" != "stop" ]
do 
read -p "enter a word: " word
echo "Word: $word"
done