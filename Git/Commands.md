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

Create a directory and initialise git to make the current directory as a git repo 
```
mkdir mumbaigit
cd mumbaigit

git init 
touch myfile  (put some data)

git status
git add .

git commit -m "first commit from mumbai"

git status
git log

git log --oneline

git branch -M main

git show <commit-id>
git remote add origin <centralgit url>

git push -u origin main
(enter username & password)

Username:- iam-pratap
Password:- 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

git pull -u origin main

**** To Ignore some files while committing ****

__Create one hidden file .gitignore and enter file format which you want to ignore__
for eg:- vi .gitignore >>>>> *.css
                             *.java

git add .gitignore
git commit -m "Latest update exclude .css"

git status

__Create some text, java &css files and add them by running "git add"__
for eg:- touch file.txt file2.txt file3.java file4.css
```

## Create branches

To see the list of Available branches
```
git branch
```
Create a new Branch
```
git branch <branch name>
```
To Switch in another Branch
```
git checkout <Name of branch you want to go>
```
Delete a local branch
```
git branch -d <branch-name>
```
### Merge
```
git merge <Branch name>
```

To verify the merge
```
git log
```

To push to central repo like GitHub
```
git push origin master
```

### Git Stashing 

To stash an item
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

