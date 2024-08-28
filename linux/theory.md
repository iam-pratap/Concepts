## Permissions in Linux

There are three permissions for any file, directory

The following lists the symbols used to denote each,along with a brief description:
- r --> User can read a file
- w --> User can write a file
- x --> User can execute a file

  Each of the three permissions are assigned to three defined categories of users.

  - Owner --> The user permissions apply only the owner of the file or directory, they will not impact the actions of other users.
  - Group --> The group permissions apply only to the group that has been assigned to the file or directory, they will not effect the actions of other users.
  - others --> The others permissions apply to all other users on the system, this is the permission group that you want to watch the most

There are two ways to use the command

- Absolute mode(4 2 1)
- symbolic mode(r w x)
Chmod-changing file permissions
The chmod command command is used to change the permissions of a file or directory
chmod permissions filename

  Chown-changing file ownership

  -you can change the owner of a file by using the chown command
  chown user:group filename

  Create two users
  sudo useradd user1
  sudo useradd user2
  sudo chown user1:user1 <file1>
  sudo chown user2:user2 <file2>

If you give a permissions is 740 means entry will be restricted for other login as user1 and try to see the data in file1 and it will say permission denied.
try with another example

vi data 
```
#!/bin/bash
echo "Hello World"
```
if executable permission is enabled then you will execute this file  
  
 SetUID
 If SUID bit is set on a file and a user executed it. The process will have the same rights as the owner of the file being executed.
 for example:passwd command have SUID bit enabled. when a normal user changes his password this script update few system files like ?etc/passwd and /etc/shadow which can't be updated by non-root account. So that passwd command process always run with root user rights.


 sudo chmod u+s testfile1
 chmod 4655 testfile2
 smalls-->there is executable
 capitals ---> there is no executable

 Setgid
 same as suid, The process will have the same group rights of the file being executed. If SGID bit is set on any directory, all subdirectories and files created inside will get same group ownership as the main directory, it doesn't matter who is creating.

sticky bit

The sticky bit is used to indicate special permissions for files and directories. If a directory with sticky bit enabled will restrict deletion of the file inside it. It can be removed by root, owner of the file or who have to write permission on it. This is useful for pubically accessible directories like /tmp.
