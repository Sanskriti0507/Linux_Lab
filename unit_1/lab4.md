# FILE PERMISSIONS WITH "chmod" AND "chown"

# 1. File permissions in Linux:

### Each file/directory in Linux has-
* Owner --> The user who created the file.
* Group --> A group of users who may share access.
* Other --> Everyone else who has access.

### Permission type- 
* `r` --> Read (4 in numeric)
* `w` --> Write (2 in numeric)
* `x` --> Execute (1 in numeric)

### Example by using `ls -la`:

```bash
-rwx-rw-r--
```

Explanation:
* `rwx-` --> Read, write and execute permissions for the owner.
* `rw-` -->  Read and write permissions for the group.
* `r--` --> Read permission for the others.


# 2. "chmod"- Change file permissions:

## Numerical method- 
--> Use for quick changes.

Each permission is represented by a number:
* Read --> 4
* Write --> 2
* Execute --> 1


If we add them up, we get a number for each category (Owner, Group, Other):
* `7` --> `rwx`
* `6` --> `rw-`
* `5` --> `r-x`
* `4` --> `r--`
* `0` --> `---`

### Example:
```bash
chmod 765 script.sh
```
Explanation:
* 7 --> `rwx`
* 6 --> `rw-`
* 5 --> `r-x`


## Symbolic Method-
--> Use for fine adjustments. 

Use:
* `u` --> user
* `g` --> group
* `o` --> others
* `a` --> all

Operations:
* `+` --> To **Add** permission
* `-` --> To **Remove** permission
* `=` --> To **Assign exact** permission

### Usage:

```bash
chmod u+x script.sh     # Add execute for owner
chmod g-w notes.txt     # Remove write from group
chmod o=r file.txt      # Set others to read only
chmod a+r report.txt    # Everyone gets read access
chmod a+rwx data.txt    # Everyone gets all access
```


## Recursive Changes-

```bash
chmod -R 755 folder
```

* `R` --> It applies changes recursively to all files/subdirectories.

### Example:

![Image](<../Image/Screenshot from 2025-08-20 08-01-09.png>)


# 3. "chown" – Change File Ownership:
```bash
chown [options] new_owner:new_group filename
```

### Usage:
```bash
chown vboxuser file.txt           # Change owner to user 'vboxuser'
chown vboxuser:hey file.txt       # Change owner to 'vboxuser' and group to 'hey'
chown :hey file.txt               # Change only group to 'hey'
chown -R vboxuser:hey /project    # Recursive ownership change
```

# 4. Putting it all together:

### Example:

```bash
touch project.sh
ls -l project.sh
```

### Output:

```
-rw-r--r-- 1 vboxuser hey 0 Aug 19 12:00 project.sh
```

### Some more uses:

```bash
chmod 700 project.sh           # To Only owner has rwx
chmod u+x,g-w project.sh       # To Add execute for user, remove write for group
chown root:admin project.sh    # To Change owner to root and group to admin
```

---
**This shows us how to use "chmod and "chown" commands.**
---