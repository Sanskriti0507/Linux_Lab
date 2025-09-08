# Starter Kit Automation.

## The script: `starter_kit.sh`
```bash
#!/bin/bash

BASE_DIR="project"

mkdir -p $BASE_DIR/scripts
mkdir -p $BASE_DIR/docs
mkdir -p $BASE_DIR/data

echo "# Project" > $BASE_DIR/README.md
echo "# Scripts Folder" > $BASE_DIR/scripts/README.md
echo "# Documentation Folder" > $BASE_DIR/docs/README.md
echo "# Data Folder" > $BASE_DIR/data/README.md

echo "Starter Kit Ready!"
```

## Purpose of the script:
The `starter_kit.sh` script automatically creates a basic project environment with common folders (`scripts`, `docs`, `data`) and placeholder README files.  
This helps standardize project setup, saving time and ensuring consistency.

## Example run:
First make it executable by `chmod 777 starter_kit0.sh`

## Output:

![Image](<../Image/Screenshot from 2025-09-08 18-28-03.png>)

![Image](../Image/kit.png)



# Extra Questions:
## Question 1.) What does `mkdir -p` do?
### A: `mkdir -p` creates directories and any missing parent directories, and it won't error if the file aready exists.

## Question 2.) Why is automation useful in DevOps?
### A: Automation makes DevOps faster, safer and efficient. It saves time, reduces errors, ensures consistency, faster releases and improves reliability.