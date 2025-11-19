#!/bin/bash

op="$1"; shift
case "$op" in
  len)
    s="$*"
    echo "Length: ${#s}"
    ;;
  concat)
    echo "Concatenated: $*"
    ;;
  cmp)
    a="$1"; b="$2"
    if [ "$a" = "$b" ]; then echo "Equal"; else echo "Not equal"; fi
    ;;
  *)
    echo "Usage: $0 {len|concat|cmp} args..."
    ;;
esac