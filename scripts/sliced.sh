#!/bin/bash

a=(1 2 3 4 5 6 7 8 9 10)

echo " a is : ${a[@]}"

b="${a[@]:5:4}"

echo " b is : ${b[@]}"