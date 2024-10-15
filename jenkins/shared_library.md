## Shared library

We need to add the git repository to jenkins

Dashboard > manage jenkins > system

In Global Trusted pipeline Libraries

Name ---> shared

default version ---> main

Retrieval method ---> modern SCM

source code management --> Git

Project repository --> repo url

Now we need to add the git repository to pipeline

Specify this in script
```
@Library("library-name")
```

script
```
@Library("shared") _
pipeline {
    agent { label "vinod" }

    stages {
        stage("Hello"){
            steps{
                script{
                    hello()
                }
            }
        }
        stage("Code") {
            steps {
                script{
                code_checkout("https://github.com/iam-pratap/django-notes-app.git", "main")
                }
            }
        }
        stage("Build") {
            steps {
                script{
                docker_build("notes-app","latest","pratap15")
                }
                
            }
        }
        stage("push to docker") {
            steps {
                script{
                docker_push("notes-app","latest","pratap15")
                
                }
            }
        }
        
        
        stage("Deploy") {
            steps {
                echo "This is deploying the code using docker compose"
                sh "docker compose up -d"
            }
        }
    }
}
```
If we use Pipeline script from SCM then we need to configure this

SCM --> git

repository --> https://github.com/iam-pratap/django-notes-app.git

branch specifier --> */main

script path --> Jenkinsfile
