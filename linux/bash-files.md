## User's Home Directory

- A home directory, also called a login directory, is the directory on Unix-like operating systems that serves as the repository for a user's personal files, directories and programs. It is also the directory that a user is first in after logging into the system.

- A home directory is created automatically for every ordinary user in the directory called /home. A standard subdirectory of the root directory, /home has the sole purpose of containing user's home directories. The root directory, which is designated by a forward slash(/), is the directory that contains all other directories and their subdirectories as well as all files on the system.

- A part from having a home directory to create and store files, users need an environment that gives them access to the tools and resources. When a user logs in to a system, the user's work environment is determined by the initialization files.

- These initialization files are defined by the user's startup shell, which can vary depending on the release. The default initialization files in your home directory enable you to customize your working environment.

- Below are Various inilialization file for Bash shell

   - The `/etc/profile` file is a systemwide file that the system administrator maintains. This file defines tasks that the shell executes for every user who logs in. The instructions in the file usually set the shell variables, such as PATH, USER, and HOSTNAME.
 
   - The `/.bash_profile` file is a configuration file for configuring user environments. The users can modify the default settings and add any extra configurations in it.
 
   - The `/.bash_rc` is a shell script which runs every time a user opens a new shell.
 
   - The `/.bash_logout` file contains instructions for the logout procedure. When logging out of a linux system running the BASH shell, file .bash_logout is executed. This file is usually very short, and contains commands users want to execute upon leaving the account. The most popular is the clear command, which clears the screen.
 
     If you to see these files then
     ```
     ls -ltra
     ```
  - .bash_profile is executed for login shells, while .bashrc is executed for interactive non-login shells.
 
  - when you login (type username and password) via console, either sitting at the machine, or remotely via ssh: .bash_profile is executed to configure your shell before the initial command prompt.
 
  - But, if you've already logged into your machine and open a new terminal window(xterm) then .bashrc is executed before the window command prompt. .bashrc is also run when you start a new bash instance by typing /bin/bash in a terminal.
    
  ### Set the PATH in .bash_profile file

  Create a user
  give passwd

  login as newuser

  ls -ltra

  vi .bash_profile

```
  # .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH
 ```
ADD echo "WelCome to Linux World"

vi .bashrc
```
# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
```
ADD echo "This is a .bashrc file"

Output Should look loke:
```
Last login: Wed Sep  4 05:42:23 UTC 2024 on pts/0
This is bashrc file
##########
WelCome To Linux World
##########
```
When the user logedin both your initialization files will executed

first .bashrc then .bash_profile

If i want run any command in my home directory then i need add the PATH in .bash_profile file
```

PATH=$PATH:$HOME/.local/bin:$HOME/bin
```
just simply add /tmp after bin

reloggedin and try again

#### Create alias
In .bashrc file
add
alias lk='ls -ltra'
alias pk='ps -ef'

## Bash Variables

- Bash variables are local to a single shell by default
  ```
  Set with VARIABLE=VALUE
  ```
- Environment variables are inherited by child shells
  ```
  Set with export VARIABLE=VALUE
  ```
  Accessed by some programs for configuration

- System Variable

  Created and maintained by Linux bash shell itself.


define variable
A=20

read variable
echo $A
