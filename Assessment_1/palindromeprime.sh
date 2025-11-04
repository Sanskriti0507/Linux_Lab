#!/bin/bash

# Step 1:

A=("madam" "123" "121" "level" "454" "hello" "noon")
B=(2 3 4 5 10 11)

# Step 2:

is_palindrome(){
    local s="$1"
    local rev=$(echo "$s" | rev)
    [[ "$s" == "$rev" ]]
}

# Step 3:

is_prime(){
    local n=$1
    if (( n < 2 )); then
    return 1
    fi
    for ((i=2; i*i<=n; i++)); do
        if (( n % i == 0 )); then
        return 1
        fi
    done
    return 0
}

# Step 4:

sum_value(){
    local val="$1"

    if [[ "$val" =~ ^[0-9]+$ ]]; then
    local sum=0
        for ((i=0; i<${#val}; i++)); do
            sum=$((sum + ${val:i:1}))
        done
    echo "$sum"

    else
    local sum=0
        for ((i=0; i<${#val}; i++)); do
            ascii=$(printf "%d" "'${val:i:1}")
            sum=$((sum + ascii))
        done
    echo "$sum"
    fi
}

# Step 5:

C=()
pal_sums=()

for i in "${!A[@]}"; do
    if is_palindrome "${A[i]}"; then
        C+=("$i")
        pal_sums+=("$(sum_value "${A[i]}")")
    fi
done

# Step 6:

primes=()
for num in "${B[@]}"; do
    if is_prime "$num"; then
        primes+=("$num")
    fi
done

# Step 7:

D=()
for sum in "${pal_sums[@]}"; do
    for prime in "${primes[@]}"; do
        D+=($((sum * prime)))
    done
done

# Step 8:

echo "Array A: ${A[@]}"
echo "Array B: ${B[@]}"
echo "Palindrome indices (Array C): ${C[@]}"
echo "Products (Array D): ${D[@]}"
