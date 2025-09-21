#!/bin/bash

if [ $# -ne 1 ]; then
echo "Usage: $0 <filename>"
exit 1
fi

if [ ! -f "$1" ]; then
echo "File not found"
exit 1
fi

lines=$(wc -l < "$1")
words=$(wc -w < "$1")
chars=$(wc -m < "$1")

echo "Lines: $lines"
echo "Words: $words"
echo "Characters: $chars"