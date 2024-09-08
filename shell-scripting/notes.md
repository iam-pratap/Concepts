What is automation

Automation is the process where we reduce manual activies

what is the difference between /bin/sh and /bin/bash

Previously both of them were same because /bin/sh was redirecting using the linking concept to /bin/bash but now it is not the same because some of the operating systems have decided to use dash as default. so your script might not execute if you are writing in bash scripting.

shebang??


for print any thing in shellscripts we use echo


create a shell script

vi my-shell.sh

#!/bin/bash

echo "My name is honey"

save it

execute a script

sh my-shell.sh
or
./ my-shell.sh



nproc ----> list the cpus on your machine
free ---> what is the memory present in your machine
top ---which process is running

why are you using shell scripting
I have automated all the node health of my virtual machines so we have some close to thousand machines and and every time it is difficult to monitor the node health or status of this virtual machine so I,ve decided to write a script.
there are some automated tools then why are you using this.
in our orgnization we are not using such tools or you can simply say that you know these tools are restricted for generating some parametersonly a restricted number of parameters but in my script i am fetching more parameters that are not provided by these tools

first shell script

vi my-first-shell-script
#!/bin/bash

create a dirctory
mkdir data

create two files
touch file1 file2
----------------------
vi nodehealth.sh

#!/bin/bash

###########################
# Author: Honey
# Date: 01/12/2022
#
# This script outputs the node health
#
# Version:v1
#######################
echo "print disk space"
df -h

echo "print the memory"
free -g

echo "print the nproc"
nproc
-------------------------

set -x -----> debug mode

--------------------------

ps -ef ----process entire details in full format
----------------------------
vi test.sh

#!/bin/bash

echo 1
echo 11
echo 12
echo 55
echo 99

./test.sh | grep 1

pipe cmd sends the o/p of fist cd to second cmd

---------------------------------------
channels every virtual machine has
stdin, stdout, stderr

Q. date | echo "this" . what is the output of this command?
it will only print "this" because date is a system default command it sends the output to stdin but pipe will not be able to receive the information from stdin pipe can only receive the information if the command is not sending the information to stdin and if the command is ready to pass the information to the next command 
---------------------------------------
awk --> pattern scanning and processing language

ps -ef | grep amazon | awk -F" "'{print $2}'

---------------------
vi test.sh

My name is Honey
my employee is 11111

grep name test | awk -F" "print $4'
--------------------

if you are using pipe command in your script then you need to add to syntax
set -e --->exit the script when there is an error,it did not catch the pipefailure
set -o ---> pipefail

check using set -e or without

------------------------------------------------

curl --> you can retrieve all of this required information from any external devices from the internet or anything also.

wget ---> download manager


-----------------------------
find ---> it will find that you location give
/ --->every thing
syntax: find / -name <name>

--------------------------------
a=4
b=10

if [ $a > $b ]
then
   echo "a is greater than b"
else
   echo "b is greater than a"
fi

###for loops
iterations

for i in {1.100}: do echo $1: done

-------------------------------------------
whatever action that you are performing using your keyoard or you are performing using some commands okay lets say you are using a kill command, kill command is basically used to kill a process so if a java process is running and you want to kill it so what you will say kill -9 java. so if the name of the process is java or you the process ID lets say the process ID is one one one one

-9 ---> instructs the linuc compiler or the Linux kernel to say okay kill this specific process with this process id.
when you executing this command there is a signal that is passed to the Linux saying that okay so this person is asking you to kill a specific file so this is a signal.

ctrl+c ---> to terminate the script
SIGKILL is signal for kill command.
