Install and configure jenkins

Install java

sudo apt update
sudo apt install fontconfig openjdk-17-jre
java -version

Install java

sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins

To check the status of jenkins

systemctl status jenkins 

When the system starts system automatically starts

sudo systemctl enable jenkins


Take the public ip and port 8080 and paste in browser
if jenkins is not running in browser then open port 8080 in security group

using this sudo cat /var/lib/jenkins/secrets/initialAdminPassword

you will get the jenkins password



Customize Jenkins > Install suggested plugins

create first admin user

username --> admin
password --> admin
confirm password --> admin
fullname --> honey Pratap
email- honeypratap07@gmail.com

instance configuration > Jenkins URL : http://jenkins-Ip:8080/ > save and finish

Jenkins is Ready!

dashboard > create a job > item name > freestyle project


Console op

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


Decrarative pipeline

dashboard > itemname > pipeline

pipeline > deginition > pipeline script

script

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


save it 
build now


console output

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


Multi agent

dashboard > manage jenkins > nodes > new node

create a new instance for jenkins agent

we need to install only java

connect master <-----> agent

generate key public & private key pair

ssh-keygen

ex: id_ed25519 ---> private key
id_ed25519.pub ---> public key

master---> private key
agent --->public key

copy public key and paste to agent authorised keys

create node > new node > agent-vinod
type ---> permanent agent

create

number of executers --> 1
remote root directory ---> /home/ubuntu
labels ---> vinod

usage --> use this node as much as possible

launch method --> launch agents via SSH

host --> agent instance public ip address

credentials ---> add

jenkins credentials provider:jenkins

domain -->global credentials(unrestricted)

kind --> SSH username with private key

scope --> Global(jenkins, nodes, items, all child items etc)

id --> ubuntu-key

description --> ubuntu-key

username --> ubuntu

private key --> enter directly and add private key
save 
select > ubuntu(ubuntu-key)

host key verification strategy ---> non verifying verification strategy

save it

go to dashboard > democicd 

agent any to agent { label: "vinod" }
