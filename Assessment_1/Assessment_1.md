## 📋The Script:
```bash
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
```

## Breakdown:

`#!/bin/bash`---> Shebang.

### Step 1: Defining Input Arrays.
```bash
A=("madam" "123" "121" "level" "454" "hello" "noon")
B=(2 3 4 5 10 11)
```

* `A` --> array containing strings and numbers.
* `B` --> array of integers.

### Step 2: Palindrome Check Function
```bash
is_palindrome() {
    local s="$1"
    local rev=$(echo "$s" | rev)
    [[ "$s" == "$rev" ]]
}
```

* `is_palindrome()` --> Defines a function which checks if a number is palindrome or not.
* `local s="$1"` --> stores the first argument into a local variable `s`.
* `rev=$(echo "$s" | rev)` --> reverses the string using the Unix command `rev`.
* `[[ "$s" == "$rev" ]]` --> checks if the string equals its reverse.
	* If true → exit status 0 (meaning “yes, palindrome”)
	* If false → exit status 1 (“not palindrome”).
 
So this returns success if the argument is a palindrome.

### Step 3: Prime check function:
```bash
is_prime() {
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
```

* Takes one argument, assigns it to `n`.
* `if (( n < 2 ))` --> primes must be ≥ 2, so if not, `return 1` (false).
* `for ((i=2; i*i<=n; i++))` --> loop from 2 up to √n.
* `if (( n % i == 0 ))` --> if divisible evenly by any number, not prime → `return 1`.
* If the loop finishes without finding a divisor → `return 0` (true, prime).

### Step 4: Sum of Digits or ASCII Values
```bash
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
```

* Takes a value (`val`) and checks if it’s all digits using regex ``^[0-9]+$``.
* If it’s numeric:
	* Loops through each digit and adds it up (`sum of digits`).
* If it’s a string:
	* Loops through each character.
	* `printf "%d" "'A"` returns the ASCII code of `A`.
	* Adds each ASCII value to a running total.
* Finally, echo "$sum" prints the result, so the caller can capture it.

* Example:
	* `"121"` → sum = 1 + 2 + 1 = 4
	* `"madam"` → sum = 109+97+100+97+109 = 512 (Uses ASCII value)
 

### Step 5: Find Palindromes in Array A
```bash
C=()
pal_sums=()

for i in "${!A[@]}"; do
    if is_palindrome "${A[i]}"; then
        C+=("$i")
        pal_sums+=("$(sum_value "${A[i]}")")
    fi
done
```

* `C=()` --> Empty array to store palindrome indices (positions in A).
* `pal_sums=()` --> Empty array to store sum results for each palindrome.
* `for i in "${!A[@]}"` --> Loops through all indices of array `A`.
* For each element:
	* `is_palindrome "${A[i]}"` --> checks if it’s a palindrome.
	* If yes:
		* Add its index to `C`.
		* Compute its sum (`sum_value`) and store in `pal_sums`.
	 
### Step 6: Find Primes in Array B
```bash
primes=()
for num in "${B[@]}"; do
    if is_prime "$num"; then
        primes+=("$num")
    fi
done
```

* Create an empty `primes` array.
* Loop over each number in `B`.
* If `is_prime` returns success, append it --> Now `primes` will contain only prime numbers from `B` (e.g., `2 3 5 11`).

### Step 7: Generate Products (Array D)
```bash
D=()
for sum in "${pal_sums[@]}"; do
    for prime in "${primes[@]}"; do
        D+=($((sum * prime)))
    done
done
```

* Initialize an empty array `D`.
* For each palindrome’s `sum`:
	* Multiply it by each prime in `primes`.
	* Store every result in `D`.

This means every palindrome gets multiplied with every prime.

### Step 8: Display Results
```bash
echo "Array A: ${A[@]}"
echo "Array B: ${B[@]}"
echo "Palindrome indices (Array C): ${C[@]}"
echo "Products (Array D): ${D[@]}"
```

Prints everything neatly:
* Original arrays `A` and `B`
* Indices of palindromes (`C`)
* The computed list of products (`D`)

## 📃Result:

![Image](<../Image/Screenshot 2025-11-04 162214.png>)