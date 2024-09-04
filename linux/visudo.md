# visudo

The sudo command is basically a command that allow one user to execute a command as another user. It is commonly used to allow basic users to execute commands usually reserved to the root user(a user typically used by administrators), such as the kill, mount, adduser commands.

- The visudo command is a safe and secure way of editing the "/etc/sudoers" file on UNIX and Linux systems. Since the sudoers file determines which users can run administrative tasks.
  
- sudo is easy to configure and uses a straight forward syntax. You use the command visudo to edit the file /etc/sudoers.


## sudoers file : Definition

- The sudoers file (/etc/sudoers by default) is the "List of who can run what". The file is basically built over 2 kind of data.

- **Aliases** : Aliases are variables that stores multiple entries that fit the same domain (users, hosts, commands).

  There are 4 kind of Aliases as:

  *User_Alias==> for listing users
  
  *Runas_Alias==> for listing users a given user can run as
  
  *Host_Alias==> for listing hosts
  
  *Cmnd_Alias==> for listing commands

## Alias:

#### User alias specification
```
User_Alias FULLTIMERS = millert, mikef, dowdy
```
#### Runas alias specification
```
Runas_Alias DB = oracle, sybase
```
#### Host alias specification
```
Host_alias CUNETS = 128.138.0.0/255.255.0.0
```
#### Cmnd alias specification
```
Cmnd_Alias DUMPS = /usr/sbin/dump, /usr/sbin
Cmnd_Alias KILL = /usr/bin/kill
```
When you first open the sudoers file the only not-commented line is:

root ALL=(ALL) ALL

user hosts=(users:groups) commands

Let's use this to explain the basic of the sudoers syntax. We can see that there are 4 fields as:

root: This is the user(s) to whom the following "items" applies

ALL: This is the place(s) where the "sudo command" can be launched

(ALL): This is the part that specify which user(s) you may act as.

ALL: This is the command(s) that may be ran using the sudo commands

### Basic examples:

- Allow the user pratap to run ALL commands from anywhere as root:
```
  pratap ALL=(ALL) ALL
```
-Same as above but without any password prompt(!)
```
pratap ALL=(ALL) NOPASSWD:ALL
```

- Allow the user pratap to run yum, mount and ifconfig commands from anywhere as root:

  ```
  pratap ALL=(ALL) /usr/bin/yum, /sbin/mount, /sbin/ifconfig
  ```
- You may also specify some commands to be ran with a password and some "password-free" on one line, in the below example we allow pratap to run only the partedcommand without any password prompt:

- ```
  pratap ALL=(ALL) /usr/bin/yum, /sbin/mount, /sbin/ifconfig, NOPASSWD:/sbin/parted
  ```
