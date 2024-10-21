## Go to AWS management console and Launch an instance

## Install git
```
sudo su
yum update -y
yum install git -y
git --version
which git
```
### Setup Configurations
Set the name and email that will be attached to your commits and tags
```
git config --global user.name "honey"
git config --global user.email "honey@gmail.com"
git config --list
```

### Create a Project

Create a directory and go inside
```
mkdir mumbaigit
cd mumbaigit
```
Initializes a new Git repository in the current directory.
```
git init
```
Create one file and put some data
```
touch myfile  
```

Shows the current state of your repository, including tracked and untracked files, modified files, and branch information.
```
git status
```
Adds all modified and new files to the staging area.
```
git add .
```
Creates a new commit with the changes in the staging area and specifies the commit message inline.
```
git commit -m "first commit from mumbai"
```
Displays the commit history of the current branch.
```
git log
git log --oneline
```
It shows the commit details using commit-ids
```
git show <commit-id>
```
Configure and connects to github(remote repo)
```
git remote add origin <centralgit url>

git push -u origin main
(enter username & password)

Username:- iam-pratap
Password:- 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
token_name:- github-token
```

List and delete the remotes from git
```
git remote -v
git remote remove <remote name>
```

### .gitignore

To Ignore some files while committing

Create one hidden file .gitignore and enter file format which you want to ignore
for eg:- vi .gitignore >>>>> *.css
                             *.java
```
git add .gitignore
git commit -m "Latest update exclude .css"

git status
```
Create some text, java &css files and add them by running "git add"
for eg:- touch file.txt file2.txt file3.java file4.css
Now, you will see only .txt format files because we created .gitignore file and exclude .java&.css


### Create branches

To see the list of Available branches

```
git branch
```
Create a new Branch(when we create a new branch all the data on master branch copied to new branch. check using `ls` command)
```
git branch <branch-name>
```
Switch to another Branch
```
git checkout <Name-of-branch-you-want-to-go>
```
Delete a local branch
```
git branch -d <branch-name>
```
### Merge

Merges the specified branch into the current branch.
```
git merge <Branch-name>
```

To verify the merge
```
git log
```

To push to central repo like GitHub
```
git push origin master
```

### Rebase

```
git rebase <feature1> <main>
```

### Git Stashing 

To stash an item (from staging area)
```
git stash
```
To see stashed items
```
git stash list
```
To apply stashed items
```
git stash apply stash@{0}

0,1,2,3 etc
0----> latest item
3----> oldest item
```
then you can add and commit

To clear the stash items
```
git stash clear
```

### Git reset

To Reset staging area
```
git reset <filename>
git reset .
```
To reset the changes from both staging area and working directory at a time
```
git reset --hard
```

### Git revert

First check the status then revert
```
git status
git revert <commit-id>
```

### Remove untracked files
```
git clean -n (dry run)
git clean -f (forcefully)
```

### Tags

Apply tags
```
git tag -a <tag name> -m <message> <commit-id>
```
To see the list of tags
```
git tag
```
To see particular commit content by using tag
```
git show <tag name>
```
To Delete a tag
```
git tag -d <tag name>
```
### GitHub clone
Clone an existing repository
```
git clone <url of GitHub repo> 
```

