# Interview Q&A with Notes

`1. What is automation?`

Automation is the process where we reduce manual activies

`2. What is the difference between /bin/sh and /bin/bash?`

Previously both of them were same because /bin/sh was redirecting using the linking concept to /bin/bash but now it is not the same because some of the operating systems have decided to use dash as default. so your script might not execute if you are writing in bash scripting.

`3. what is Shebang?`

Shebang is a special character sequence used at the beginning of a script file in Unix-like systems to specify the interpreter that should be used to execute the script.

Syntax:
```
#!/path/to/interpreter
```
`#!:` The shebang sequence.

`path/to/interpreter:` The absolute or relative path to the interpreter that should be used to execute the script.

**Note:** For print any thing in shell scripts we use "echo"

### Example

vi test.sh
```
#!/bin/bash
echo "My name is honey"
```
save it and change the permission to executable and then execute the script

Run this script `sh my-shell.sh` or `./my-shell.sh`

Output should look like
```
My name is honey
```
### Some commands to check the cpu, memory & processes

`nproc` ----> list the cpu's present in your machine

`free` ---> list the memory present in your machine

`top` ---> which process is currently running

`4. Why are you using shell scripting?`

I have automated all the node health of my virtual machines so we have some close to thousand machines and and every time it is difficult to monitor the node health or status of this virtual machine so I,ve decided to write a script.
there are some automated tools then why are you using this.
in our orgnization we are not using such tools or you can simply say that you know these tools are restricted for generating some parametersonly a restricted number of parameters but in my script i am fetching more parameters that are not provided by these tools

## First shell script

vi my-first-shell-script
```
#!/bin/bash
#create a dirctory
mkdir data
#create two files
cd data/
touch file1 file2
```
save it and then change permission to executable`chmod +x my-first-shell-script.sh` then execute

Output should look like

part1:(after executing the script and ls)
```
data  my-first-shell-script.sh
```
part2:(after doing cd data/ and ls)
```
file1  file2
```

## Node health check script

vi nodehealth.sh
```
#!/bin/bash
###########################
# Author: Honey
# Date: 08/09/2024
#
# This script outputs the node health
#
# Version:v1
#######################
set -x #debug mode
echo "print disk space"
df -h

echo "print the memory"
free -g

echo "print the nproc"
nproc
```
Output should look like
```
+ echo 'print disk space'
print disk space
+ df -h
Filesystem      Size  Used Avail Use% Mounted on
devtmpfs        467M     0  467M   0% /dev
tmpfs           477M     0  477M   0% /dev/shm
tmpfs           477M  404K  476M   1% /run
tmpfs           477M     0  477M   0% /sys/fs/cgroup
/dev/xvda1      8.0G  1.8G  6.3G  23% /
tmpfs            96M     0   96M   0% /run/user/1000
+ echo 'print the memory'
print the memory
+ free -g
              total        used        free      shared  buff/cache   available
Mem:              0           0           0           0           0           0
Swap:             0           0           0
+ echo 'print the nproc'
print the nproc
+ nproc
1
```

ps -ef ----> process the entire details(stopped, daemon and zombie process) in full format

### Create a script
vi test.sh
```
#!/bin/bash
echo 1
echo 11
echo 12
echo 55
echo 99
```
save it and change the permission to executable then execute

./test.sh | grep 1

Output
```
1
11
12
```
pipe --> Get the output of first commands and send it to second command

**Note:** Channels every virtual machine has
stdin, stdout, stderr

`5. date | echo "this" . what is the output of this command?`

It will only print "this" because date is a system default command it sends the output to stdin but pipe will not be able to receive the information from stdin pipe can only receive the information if the command is not sending the information to stdin and if the command is ready to pass the information to the next command. 

#### Command:
awk --> pattern scanning and processing language
```
ps -ef | grep amazon | awk -F" " '{print $2}'
```

##### Example
vi test
```
My name is Honey
```
save it and change the permission to executable then execute

grep name test | awk -F" " '{print$4}'

Output
```
honey
```

### Usage of `set -e` and `set -o`

if you are using pipe command in your script then you need to add this in syntax

`set -e` --->Exit the script when there is an error, it did not catch the pipefailure

`set -o` ---> this is for pipefailure

#### Example

vi nodehealth1.sh
```
#!/bin/bash
###########################
# Author: Honey
# Date: 08/09/2024
#
# This script outputs the node health
#
# Version:v1
#######################
set -e # exit the script when there is an error

dbdbabbaj | echo
df -h
free -g
nproc
```

##### When we are only using `set -e`
Output:
```
+ set -e
+ set -o pipefail
+ echo

+ dbdbabbaj
./nodehealth.sh: line 14: dbdbabbaj: command not f
```
##### When we are using `set -e` with `set -o`
Output:
```
+ set -e
+ echo

+ dbdbabbaj
./nodehealth.sh: line 14: dbdbabbaj: command not found
+ df -h
Filesystem      Size  Used Avail Use% Mounted on
devtmpfs        467M     0  467M   0% /dev
tmpfs           477M     0  477M   0% /dev/shm
tmpfs           477M  436K  476M   1% /run
tmpfs           477M     0  477M   0% /sys/fs/cgroup
/dev/xvda1      8.0G  1.8G  6.3G  23% /
tmpfs            96M     0   96M   0% /run/user/1000
+ free -g
              total        used        free      shared  buff/cache   available
Mem:              0           0           0           0           0           0
Swap:             0           0           0
+ nproc
1
```


`curl` --> you can retrieve all of this required information from any external devices from the internet.

`wget` ---> download manager

`find` ---> it will find that you give the location

/ ---> means every thing

syntax: find / -name <name>

## Loops

### If/Else Loops

vi ifelse.sh

```
#Initializing two variables 
a=20 
b=20 
  
if [ $a == $b ] 
then 
    #If they are equal then print this 
    echo "a is equal to b"
else
    #else print this 
    echo "a is not equal to b"
fi 
```
Output
```
a is equal to b
```
### for loops
vi forloop.sh

```
#!/bin/bash
# Loop from 1 to 100 and print each number
for i in {1..100}; do
  echo "$i"
done
```
Output 
```
1
2
,
,
100
```

#### Note:
whatever action that you are performing using your keyoard or you are performing using some commands okay lets say you are using a kill command, kill command is basically used to kill a process so if a java process is running and you want to kill it so what you will say kill -9 java. so if the name of the process is java or you the process ID lets say the process ID is one one one one

-9 ---> instructs the linuc compiler or the Linux kernel to say okay kill this specific process with this process id.
when you executing this command there is a signal that is passed to the Linux saying that okay so this person is asking you to kill a specific file so this is a signal.

ctrl+c ---> to terminate the script
SIGKILL is signal for kill command.
