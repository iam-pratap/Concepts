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

save it and make sure agents are online 

Go to dashboard > job-name

Change the label from agent any to agent { label "vinod" }

### Declarative Pipeline with multiagent

Dashboard > new-item > Djangopipeline > type > pipeline

Tick GitHub project and copy GitHub project url

Project url ---> paste here

Display name --> Django notes app

Build triggers --> GitHub hook trigger for GITScm polling

pipeline > definition > pipeline script

```
pipeline {
    agent { label "vinod" }

    stages {
        stage('code') {
            steps {
                echo 'This is cloning the code'
                git url: https://github.com/iam-pratap/jenkins-test.git
                echo "code cloning successfull"
            }
        }
        stage('build') {
            steps {
                echo 'This is building the code'
            }
        }
        stage('test') {
            steps {
                echo 'This is testing the code'
            }
        }
        stage('deploy') {
            steps {
                echo 'this is deploying the code'
            }
        }
    }
}
```
Save it and build now

manage jenkins > plugins > available plugin

pipeline stage view > install this and restart jenkins

#### Install Docker for build

In Agent-server
```
sudo apt-get install docker.io
sudo usermod -aG docker ubuntu
docker ps
```
```
pipeline {
    agent { label "vinod" }

    stages {
        stage("Code") {
            steps {
                echo "This is cloning the code"
                git url: "https://github.com/iam-pratap/django-notes-app.git", branch:"main"
            }
        }
        stage("Build") {
            steps {
                echo "This is building the code"
                sh "docker build -t notes-app:latest ."
            }
        }
        stage("Test") {
            steps {
                echo "This is testing the code"
            }
        }
        stage("Deploy") {
            steps {
                echo "This is deploying the code"
                sh "docker run -d -p 8000:8000 notes-app:latest"
            }
        }
    }
}
```
#### Using Docker Compose
```
sudo apt-get install docker-compose-v2
```
Stop container and remove because the port is already using
```
docker compose up -d
```
#### Push to Docker Hub

First we need to Add Credentials for Dockerhub

Dashboard > manage jenkins > credentials > system > global credentials(unrestricted)

username --> pratap15

password --> dckr_pat_gxTcFxYWuopnHcJgZgFj9f8iYuk

id --> dockerhubcred

description --> dockerhubcred 

```
pipeline {
    agent { label "vinod" }

    stages {
        stage("Code") {
            steps {
                echo "This is cloning the code"
                git url: "https://github.com/iam-pratap/django-notes-app.git", branch:"main"
            }
        }
        stage("Build") {
            steps {
                echo "This is building the code"
                sh "docker build -t notes-app:latest ."
            }
        }
        stage("push to docker") {
            steps {
                withCredentials([usernamePassword
                (credentialsId:"dockerhubcred",
                passwordVariable:"dockerHubPass",
                usernameVariable:"dockerHubUser")]){
                sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
                sh "docker image tag notes-app:latest ${env.dockerHubUser}/notes-app:latest"
                sh "docker push ${env.dockerHubUser}/notes-app:latest"
                }
            }
        }
        
        
        stage("Deploy") {
            steps {
                echo "This is deploying the code"
                sh "docker compose up -d"
            }
        }
    }
}
```

#### Webhook

Go to Github_repo > setting > webhook > add webhook

payload URL - http://13.201.60.184:8080/github-webhook/

Select --> send me everything

active (delivery was successfull)


