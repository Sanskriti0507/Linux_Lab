## Script:
```bash
#!/bin/bash

if [ $# -ne 1 ]; then
echo "Usage: $0 <filename>"
exit 1 
fi

file="$1"

if [ -e "$file" ]; then
echo "File exists : $file"
echo"----- contents -----"
cat -- "$file"
else
echo "File '$file' does not exist."
read -p "Create it now? (y/n):" ans
case "$ans" in
[Yy]*) touch "$file"; echo "Created $file"; echo "You can edit it using your favourite editor." ;;
*) echo "Not creatig file." ;;
esac

fi
```


## Breakdown:

1.  `#!/bin/bash` -->  Shebang -- tells the system to run the script in bash.

2.  `if [ $# -ne 1 ]; then` --> Checks if the number of arguments ($#) is not equal to 1.  <br> - If it is true then the exit command runs. <br> - If it is false, then the rest of the script executes.

3.  `exit 1` -->  tells the shell to stop running the current script. The number (1) is the exit code or return status.

4.  `file="$1"` --> Saves the first argument as **file**.

5.  `if [ -e "$file" ]; then` --> Checks if the file exists.

6.  `echo "------ contents ------"` --> Prints a  separator line.

7.  `cat -- "$file"` --> Displays the content of the file.

8.  `else` --> If the file doesn't exist.

9.  `read -p "Create it now? (y/N): " ans`--> Prompts for confirmation and saves it in ans.

10.  `case` --> It follows up according to the "ans" inputted.

11.  `[Yy]*) touch "$file"; echo "Created $file"; echo "You can edit it using your favorite editor." ;;` --> If the input begins with Y or y, create the file and print info.

12.  `*) echo "Not creating file." ;;` --> Otherwise, do nothing.


## Outputs:

### Case -1: No arguments supplied:
```bash
In terminal: ./check_file.sh
Usage: ./check_file.sh <filename>
```

### Case - 2: There is a file named file.txt:
```bash
./check_file.sh file.txt
File exists: file.txt
------ contents ------
hello world
```

### Case - 3: File doesn't exist and the input is y:

```bash
./check_file.sh newfile.txt
File 'newfile.txt' does not exist.
Create it now? (y/n): y
Created newfile.txt
You can edit it using your favorite editor.
```

### Case - 4: File doesn't exist and the input is anything other than y or Y:

```bash
./check_file.sh duck.txt
File 'duck.txt' does not exist.
Create it now? (y/n): n
Not creating file.