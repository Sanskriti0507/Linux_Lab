# PRACTICE EXPERIMENT

## 1. Create a new user-

### Syntax:
```bash
sudo useradd -m newuser
```

`-m` --> It creates a home directory (/home/newuser)


## 2. Create a new group-

### Syntax:
```bash
sudo groupadd newgroup
```


## 3. Add the user to the group-

### Syntax:
```bash
sudo usermod -aG newgroup newuser
```

`-aG` → It append user to the supplementary group (doesn’t remove existing groups).


## 4. Create a file-

### Syntax:
```bash
touch testfile.txt
```

### To check ownership:

```bash
ls -l testfile.txt
```

### Output:
![Image](<../Image/Screenshot from 2025-08-21 12-01-57.png>)


## 5. Assign ownership of the file to "newuser" and "newgroup"-

### Syntax:
```bash
sudo chown newuser:newgroup testfile.txt
```


## 6. Verify ownership-

### Syntax:
```bash
ls -l testfile.txt
```

## 7. Overall Output:

![alt text](<../Image/Screenshot from 2025-08-21 12-05-50.png>)