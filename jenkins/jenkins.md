# CI CD PIPELINE

## Launch an Ec2 instance(ubuntu)

### Install java
```
sudo apt update
sudo apt install fontconfig openjdk-17-jre
java -version
```
### Install and Configure Jenkins 

```
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins
```

#### To check the status of jenkins
```
sudo systemctl status jenkins 
```
#### Whenever the system starts jenkins start automatically
```
sudo systemctl enable jenkins
```

Take the public ip and port 8080 and paste in browser
if jenkins is not running in browser then open port 8080 in security group

using this you will get the jenkins password
`sudo cat /var/lib/jenkins/secrets/initialAdminPassword`

**Login Successfull !!**

Customize Jenkins > Install suggested plugins

create first admin user

username --> admin

password --> admin

confirm password --> admin

fullname --> honey Pratap

email -->  honeypratap07@gmail.com

Instance configuration > Jenkins URL : http://jenkins-Ip:8080/ > save and finish

**Jenkins is Ready!**

Dashboard > create a job > item name > freestyle project

General configurations

Build Steps > Execute shells
```
echo "This is pratap"
mkdir -p devops
echo "My folder is created"
```
Console output
```
Started by user Honey Pratap
Running as SYSTEM
Building in workspace /var/lib/jenkins/workspace/my-test
[my-test] $ /bin/sh -xe /tmp/jenkins667125148274585577.sh
+ echo This is pratap
This is pratap
+ mkdir -p devops
+ echo My folder is created
My folder is created
Finished: SUCCESS
```

### Declarative pipeline

Dashboard > item-name > item_type > pipeline

Pipeline > Definition > pipeline script

```
pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
            }
        }
        stage('create a folder') {
            steps {
                sh "mkdir -p devops"
            }
        }
        stage('Bye') {
            steps {
                echo 'Bye World'
            }
        }
                
    }
}
```

Save it and Build Now

Console output
```
Started by user Honey Pratap
[Pipeline] Start of Pipeline
[Pipeline] node
Running on Jenkins in /var/lib/jenkins/workspace/democicd
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Hello)
[Pipeline] echo
Hello World
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (create a folder)
[Pipeline] sh
+ mkdir -p devops
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Bye)
[Pipeline] echo
Bye World
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
Finished: SUCCESS
```

### Multi Agent

Create a new instance for jenkins agent

Install java
```
sudo apt update
sudo apt install fontconfig openjdk-17-jre
java -version
```
Connect to master <-----> agent

Generate key public & private key pair using `ssh-keygen`

master ---> private key ----> id_ed25519

agent --->public key ----> id_ed25519.pub

Copy public key and paste to agent server in `/.ssh/authorised keys`

Dashboard > Manage jenkins > Nodes > new-node

Create node > new node > agent-vinod

Type ---> permanent agent

create

Number of executers --> 1

Remote root directory ---> /home/ubuntu

labels ---> vinod

Usage --> use this node as much as possible

launch method --> launch agents via SSH

host --> agent public ip-address

Credentials ---> add

jenkins credentials provider:jenkins

domain -->global credentials(unrestricted)

kind --> SSH username with private key

scope --> Global(jenkins, nodes, items, all child items etc)

id --> ubuntu-key

description --> ubuntu-key

username --> ubuntu

private key --> enter directly and add private key then save

select > ubuntu(ubuntu-key)

host key verification strategy ---> non verifying verification strategy

save it

Go to dashboard > job-name

Change the label from agent any to agent { label "vinod" }
