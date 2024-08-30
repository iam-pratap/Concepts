# User Administration

## Accounts
There are three types of accounts on a Unix system

- Root account
- System account
- User accounts


## Managing Users and Groups
There are four main user administration file -

- `/etc/passwd` - Keeps the user account and password information. This file holds the majority of information about accounts on the Unix system.

- `/etc/shadow` - Holds the encrypted password of the corresponding account. Not all the systems support this file.

- `/etc/group` - This file contains the group information for each account.

- `/etc/gshadow` - This file contains secure group account information.

#### create user and set password and delete
```
 sudo useradd <username>
 sudo password <username>
 cat /etc/passwd
 sudo deluser <username>
```

#### create group and add user to group and delete
```
 sudo groupadd <group-name>
 cat /etc/group
 sudo delgroup <group-name>
 sudo usermod -aG <groupname> <username>
```

create user with all related thing like group, id, shell, directory etc
```
sudo useradd -g devops -c "kubernetes admin" -u 1198 -s "/bin/sh" -d /home/pratap pratap
```

If i want to create one user with two group like (developere, devops)
```
sudo useradd -g devops -G developers pratap
```
g means primary group

G means secondary group

Create a user with non-default directory
```
sudo useradd -d /home/test pratap
```
#### Locking and Un-locking a user
A Super user is lock and un-lock an user account

Lock
```
sudo passwd -l <user-name>
```
Un-Lock
```
sudo passwd -u <user-name>
```
check user account is lock/unlock
```
cat /etc/shadow | grep -i <user-name>
```
In result at the starts showing ! it means account is locked

#### Change the Username
old to new one
```
sudo usermod -l <new-name> <old-name>
```

### Usermod Command
The `usermod` command is simple to use with lots of options to make changes to an existing user. Let us see how to use usermod command by modifying some existing users in linux box.

## Understanding /etc/shadow file

- The /etc/shadow file stores actual password in encrypted format(more like the hash of the password) for user's account with additional properties related to user password.
- Basically, it stores secure user account information. All fields are separated by colon(:) symbol.
- It contains one entry per line for each user listed in /etc/passwd file.

See the user details in shadow file
```
<username>:<encrypted-password>:<last-password changed>:<minimum-days-to-change-the-password>:<maximumnoof days>:<warnings>:::
```

### Manage linux password expiration and aging using `CHAGE`

The Command name `CHAGE` is an acronym for `Change age`. This command is used to change the user's password's aging / expiry information. Any user can execute this command with the '-L' option to view their password and aging information. No other unauthorised users can view the password's aging/expiry information. As the root user, you can execute this command to modify the aging information.

Syntax:

```
CHAGE[-M MINDAYS][-M MAXDAYS][-D LASTDAY][-I INACTIVE][EXPIREDATE][-W WARNDAYS] <user-name>
```
See the user's password expiration details
```
chage -l <user-name>
```
Output should look like:
```
Last password change                                    : Aug 30, 2024
Password expires                                        : never
Password inactive                                       : never
Account expires                                         : never
Minimum number of days between password change          : 0
Maximum number of days between password change          : 99999
Number of days of warning before password expires       : 7
```

Change the user's password expiration detail - Modify(M), Inactive(I), Expiry(E), Warnings(W) password 
```
chage -M <time,date etc> <user-name>
```
