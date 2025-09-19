## Script:
```bash
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
```


## Breakdown:
1. `#!/bin/bash` --> Shebang -- tells the os to run the script in bash.

2. `if [ $# -ne 1 ]; then` --> Checks if the number of command-line arguments ($#) is not equal to 1.

3. `exit 1` -->  tells the shell to stop running the current script. The number (1) is the exit code or return status.

4. `if [ ! -f "$1" ]; then` --> Tests if the argument is not a regular file (-f).

5.  `echo "File not found."` --> Prints an error if the file doesn't exist.

6.  `lines=$(wc -l < "$1")` -->  Uses wc -l (word count, lines) to count the number of lines in the file. The < redirection sends the file as input to wc.

7.  `words=$(wc -w < "$1")` --> Uses wc -w to count the number of words.

8.  `chars=$(wc -m < "$1")` --> Uses wc -m to count the number of characters (including spaces and newlines).

9.  `echo "Lines: $lines"`--> Displays the line count.

10. `echo "Words: $words"`-->Displays the word count.

11. `echo "Characters: $chars"`--> Displays the character count.

## Output:

If there is a file --> `file.txt` which contains:
```bash
Hello World
45690
Hi
```

### Running the command:
```bash
./count_lwc.sh sample.txt
Lines: 3
Words: 3
Characters: 17
```

