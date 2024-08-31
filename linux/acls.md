# Access control list

- Standard linux file permissions are satisfactory when files are used by only a single owner, and a single designated group of people. However, some use cases require that files are accessed with different file permission sets by multiple named users and groups. Access control lists(ACLs) provide this function.

- With ACLs, you can grant permissions to multiple users and groups, identified by user name, group name, UID, or GID, using the same permission flags used with regular file permissions:: read, write and execute.

- First let is understand the purpose of each permission on files and directories

### Files
`r(read)` - The contents of the file can be viewed.

`w(write)` - The file can be edited and new content can be inserted

`x(execute)` - The file can be executed

### Directories

`r(read)` - The contents of the directory can be viewed with the "ls" command.

`w(write)` - New file can be created inside the directory and existing files can be deleted.

`x(execute)` - The user with this permission can change directory "cd" into this directory

To view the access control list of a file/directory
```
getfacl <File/dir-name>
```

#### File-system ACL Support
Before using the setfacl command, acl has to be enabled on the file system, else you'll receive the following error

error:
```
setfacl:/path/to/file: Operation not supported
```

#### File system mount option

- The file system needs to be mounted with ACL support enabled. XFS file system have build-in acl support. Ext4 file systems created on RedHat Enterprise Linux & have the acl option enabled by default, but ext4 file systems created in earlier versions of RedHat Enterprise Linux may need the acl option included with the mount request, or set in the superblock.


- As you can see , since we didn't set any ACL permission on the file, the command just display the standard permissions values, plus the file owner and the group owner, both having read and write permissions.

Set the ACLs to Specific user

```
setfacl -m u:pratap:rw textfile1
```
Here, -m which allows us to change the ACL's of a file/directory

u stands for user , g -- for group or an "o" for others

pratap - Username

rw - permissions

textfile - the name of the file on which we want to apply the permissions

- AN entry for the user "pratap" has been added and showing permissions whatever we have assigned  to her. we can notice one more entry i.e mask has appered.
- The mask associated with an ACL limits the set of permissions that can be assigned on the file for the named groups and users and for the group owner, but has no effect on the permissions for the file owner and the other permission group.

See the ACLs
```
-rw-rw-r--+ 1 ec2-user ec2-user  0 Aug 31 09:29 testfile1
```
+ means ACL is enabled

 #### Change mask value
  ```
  setfacl -m mask:r textfile
  ```
Output:
```
# file: testfile1
# owner: ec2-user
# group: ec2-user
user::rw-
user:honey:rw-                  #effective:r--
group::rw-                      #effective:r--
mask::r--
other::r--
```

- After changing the mask value to "r" and permissions has been effective for group owner and pratap user. user have reading and writing permissions on the file, by changing the mask, we have effectively limited their permissions to read only. as the output of the command shows, they now are only allowed to read the file.


- Other than explicitly changed with the command above, the ACLs mask also gets automatically re-calculated when we assign or change permissions with setfacl(unless the -n option is specified)


**Note:**-As you can see the mask got re-calculated and it now reflects the maximum permissions present for the named user priya. obviously, since now no previously set permissions are higher than the mask, there is no need for showing the #effective permission status

### Default ACLs

The default acl is a specific type of permission assigned to a directory  that does not change the permissions of the directory itself, but makes so that specified ACLs are set by default on all files created inside of it.

Lets demonstrate it first we are going to create a directory and assign default ACL to it by using the -d option

Create a directory
```
mkdir dir1
```
Set the default ACLs for dir1
```
setfacl -d -m u:user1:rw dir1
```
The default permissions has been assigned correctly. Now we can verify them by creating a file inside of the test dirctory and checking its permissions by running getfacl
```
getfacl dir1
```
Output:
```
# file: dir1
# owner: ec2-user
# group: ec2-user
user::rwx
group::rwx
other::r-x
default:user::rwx
default:user:user1:rw-
default:group::rwx
default:mask::rwx
default:other::r-x
```
### Example

create one directory with user1 
```
mkdir <test-dir>
```
create one file under test-dir and give them permission
```
nano test-file
chmod 740 test-file
```
Using this 740 we restricted from others

Login as user2 and try to access this file you can't access this file becoz no permission for others

Add ACLs for specific user where we want to give the access
```
setfacl -m u:user2:r filename
```
only User2 will access this file because ACL is enabled and access=User2

Create one more user and try to access this file. you will not able to see the content
