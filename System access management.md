## Aux command:

```bash
ps aux
```

### Explanation:
* `a`--> shows processes of all users.
* `u`--> display the process owner
* `x`--> shoq process wiithout a controlling terminal.

So, altogether, It means --> Show all running process with their owners including system daemons.

### Output:
```bash
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
vboxuser    1799  0.0  0.3  21288  7948 ?        Ss   05:06   0:00 /usr/lib/syst
vboxuser    1802  0.0  0.1  21464  2880 ?        S    05:06   0:00 (sd-pam)
vboxuser    1815  0.0  0.4 124032 11156 ?        Ssl  05:06   0:00 /usr/bin/pipe
```

## 2. Process tree:

```bash
pstree -p
```

### Explanation:
It shows all process IDs along with process names in the forrm of a tree.

### Example output:
```bash
systemd(1)─┬─NetworkManager(679)
           ├─sshd(1023)───sshd(2048)───bash(2050)───vim(2102)
           ├─cron(989)
           └─apache2(1500)─┬─apache2(1501)
                          ├─apache2(1502)
                          └─apache2(1503)
```

Here, 
* `systemd` is the root parent folder.
* `sshd` spawned a login shell bash, which launched vim.
* `apache2` spawned multiple worker processes.

## 3. Real time monitoring:

```bash
top
```

### Explanation:
It showsreal time information about system processes and resource usage. Live dashboard for CPU, memory and process activity.

### Output:
```bash
top - 05:48:37 up 44 min,  1 user,  load average: 0.25, 0.37, 0.46
Tasks: 247 total,   1 running, 246 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.2 us,  0.2 sy,  0.0 ni, 99.4 id,  0.1 wa,  0.0 hi,  0.2 si,  0.0 st 
MiB Mem :   2408.6 total,    102.0 free,   2219.9 used,    326.6 buff/cache     
MiB Swap:      0.0 total,      0.0 free,      0.0 used.    188.7 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND  
   2033 vboxuser  20   0 5194648 375876  55500 S   2.5  15.2   3:39.02 gnome-s+ 
  14763 vboxuser  20   0   11.1g 268656  71032 S   0.6  10.9   1:15.03 firefox  
      1 root      20   0   23372   6284   1548 S   0.3   0.3   0:11.34 systemd  
  18561 vboxuser  20   0 1395.2g 349976  42832 S   0.3  14.2   2:21.82 joplin   
  19076 vboxuser  20   0   14536   5476   3428 R   0.3   0.2   0:00.04 top      
```


## 4. Adjusting process priority:
* Linux schedules Cpu time using process priority.
* Lower value like -10, -20 --> Higher priority
* Higher value like +10, +19 ---> Lower priority.
* Default niceness = 0

### #To start a process with low priority:

  ```bash
  nice -n 10 sleep 300 &
  ```

### Output:
 ```bash
[1] 2998
```

20691 is running in background with the nice value 10.

### #To change priority of running process:

```bash
renice -n -5 -p 2998
```

### output:

```bash
2998 (process ID) old priority 10, new priority -5
```

Now process runs with higher priorty.

## 5. Cpu affnity:

```bash
taskset -cp 2998
```

### Explanation:
Get or set CPU affinity of a running process.
* `-c`--> use CPU list format.
* `-p`--> operate on a running process.

### Output:
```bash
pid 2998's current affinity list: 0-3
```


## 6.  I/O scheduling priority:

```bash
ionice -c 3 -p 2998
```

### Explanation:
* `ionice`--> It controls how muhc a process can use the disk (I/O).
* `-c 3`--> It sets it to idle. Only usable when no oneelse is using it.
* `-p 2998`--> applies this to a running process with PID.

### Output:
It sets the PID's IO scheduling class to idle.


## 7. File descriptors used by a process.

```bash
lsof -p 3543 | head -5
```

### Explanation
* `lsof`---> Lists all the files that a process has opened.
* `-p 2998`--> Only shows the files opened by PID 2998.
* `|`--> Sends the output of lsof to another command (head).
* `head -5`--> only shows the first 5 lines of the output.

### Output:
```bash
COMMAND  PID     USER   FD   TYPE DEVICE SIZE/OFF   NODE NAME
sleep   3543 vboxuser  cwd    DIR    8,2     4096 262147 /home/vboxuser
sleep   3543 vboxuser  rtd    DIR    8,2     4096      2 /
sleep   3543 vboxuser  txt    REG    8,2    35336 537214 /usr/bin/sleep
sleep   3543 vboxuser  mem    REG    8,2  5719296 533854 /usr/lib/locale/locale-archive
```


## 8. Trace system calls of a process:

```bash
strace -p 3543
```

### Explanation:
* `strace`--> Tool that monitors system calls a process makes like file operations, networdk, calls, memory allocations.
* `-p <PID>`--> Attach to a running process with PID.

### Output:
```bash
strace: Process 3543 attached
restart_syscall(<... resuming interrupted read ...>^Cstrace: Process 3543 detached
 <detached ...>
```


## 9. Find process using a port:

```bash
sudo fuser -n tcp 8080
```

### Explanation:
* `fuser`--> It shows process IDs using a file, directory or network port.
* `-n tcp`--> Specifies namespace as TCP
* `8080`--> The port number you want to check.

### Output:
```bash
8080/tcp:		4321
```

## 10. Per-Process statistics:

```bash
pidstat -p 2998 2 3
```

### Explanation:
* `pidstat`--> Part of the `sysstat` package. Useful for tracking a specific process.
* `-p 2998`--> Track only the process with PID 2998
* `2`--> Interval in seconds between samples
* `3`--> Number of samples to collect.

### Output:
```bash
Linux 6.14.0-32-generic (Ubuntu1404) 	09/26/2025 	_x86_64_	(4 CPU)

09:22:06 AM   UID       PID    %usr %system  %guest   %wait    %CPU   CPU  Command
09:22:08 AM  1000      3722    0.00    0.00    0.00    0.00    0.00     2  sleep
09:22:10 AM  1000      3722    0.00    0.00    0.00    0.00    0.00     2  sleep
09:22:12 AM  1000      3722    0.00    0.00    0.00    0.00    0.00     2  sleep
Average:     1000      3722    0.00    0.00    0.00    0.00    0.00     -  sleep
```


## 11. Control Groups for resource limits.

### # To create a new cgroup:
```bash
sudo cgcreate -g cpu,memory:/testgroup
```

### Explanation:
* `cgcreate`--> Used to create a new control group to manage resources.
* `-g`--> specfies controllers and group path.

### # To limit CPU and memory:
```bash
echo 50000 | sudo tee /sys/fs/cgroup/cpu/testgroup/cpu.cfs_quota_usecho 100M	| sudo tee /sys/fs/cgroup/cpu/testgroup/memory.limit_in_bytes
```

### Explanation:
* `echo 50000 | sudo tee /sys/fs/cgroup/cpu/testgroup/cpu.cfs_quota_us`--> Sets CPU limit for the testgroup cgroup. Any process in this cgroup will be limited to half a cpu.
* `echo 100M	| sudo tee /sys/fs/cgroup/cpu/testgroup/memory.limit_in_bytes`--> Sets memory limit for the cgroup created. Any process exceeding this may be killed or restricted by the kernel.

### # To add a process to cgroup:
```bash
echo 2998 | sudo tee /sys/fs/cgroup/testgroup/cgro
```

### Explanation:
* It adds the process with PID 2998 to the cgroup testgroup.
* after this, the process will be restricted by the CPU and memory limits set for that cgroup.