## Access control list

- Standard linux file permissions are satisfactory when files are used by only a single owner, and a single designated group of people. However, some use cases require that files are accessed with different file permission sets by multiple named users and groups . Access control lists(ACLs) provide this function.

- With ACLs, you can grant permissions to multiple users and groups, identified by user name, group name, UID, or GID, using the same permission flags used with regular file permissions: read, write and execute.

- First let is understand the purpose of each permission on files and directories

### Files
`r(read)` - The contents of the file can be viewed.
`w(write)` - The file can be edited and new content can be inserted
`x(execute)` - The file can be executed

### Directories

`r(read)` - The contents of the directory can be viewed with the ls command.`
w(write)` - New file can be created inside the directory and existing files can be deleted.
`x(execute)` - The user with this permission can change directory cd into this directory

To view the access control list of a file/directory
```
getfacl test1
```

File-system ACL Support
- Before using the setfacl command, acl has to be ebabled on the file system, else you'll receive the following error
error:
```
setfacl:/path/to/file: Operation not supported
```
#### File system mount option
- The file system needs to be mounted with ACL support enabled. XFS file system have build-in acl support. Ext4 file systems created on Red Hat Enterprise Linux & have the acl option enabled by default, but ext4 file systems created in earlier versions of Red Hat Enterprise Linux may need the acl option included with the mount request, or set in the superblock.


  
