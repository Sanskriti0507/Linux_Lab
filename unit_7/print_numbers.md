## Script:
```bash
#!/bin/bash

a=(1 2 3 4 5 6 7)

for i in "${a[@]}"; do
  echo "$i"
done
```

## Breakdown:
1. `#!/bin/bash`--> Shebang -- tells the OS to run the script in bash.

2. `a=(1 2 3 4 5 6 7)`--> Creates a Bash array named a with seven elements: 1,2,…7.

3. `for i in "${a[@]}"; do`--> Starts a loop. "${a[@]}" expands to each array element as a separate word, so the loop runs once per element. Quoting preserves elements that contain spaces. The loop variable is i.

4. `echo "$i"`--> Prints the current element. Quoting "$i" prevents word-splitting and pathname expansion.

5. `done`--> Ends the for loop.


## Output:
```bash
./print_numbers.sh
1
2
3
4
5
6
7
```