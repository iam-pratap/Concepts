## INSTALL DOCKER

A very detailed instructions to install Docker are provide in the below link

https://docs.docker.com/get-docker/

For Demo, 

You can create an Ubuntu EC2 Instance on AWS and run the below commands to install docker.

```
sudo apt update
sudo apt install docker.io -y
```


### Start Docker and Grant Access

A very common mistake that many beginners do is, After they install docker using the sudo access, they miss the step to Start the Docker daemon and grant acess to the user they want to use to interact with docker and run docker commands.

Always ensure the docker daemon is up and running.

A easy way to verify your Docker installation is by running the below command

```
docker run hello-world
```

If the output says:

```
docker: Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Post "http://%2Fvar%2Frun%2Fdocker.sock/v1.24/containers/create": dial unix /var/run/docker.sock: connect: permission denied.
See 'docker run --help'.
```

This can mean two things, 
1. Docker deamon is not running.
2. Your user does not have access to run docker commands.


### Start Docker daemon

You use the below command to verify if the docker daemon is actually started and Active

```
sudo systemctl status docker
```

If you notice that the docker daemon is not running, you can start the daemon using the below command

```
sudo systemctl start docker
```


### Grant Access to your user to run docker commands

To grant access to your user to run the docker command, you should add the user to the Docker Linux group. Docker group is create by default when docker is installed.

```
sudo usermod -aG docker ubuntu
```

In the above command `ubuntu` is the name of the user, you can change the username appropriately.

**NOTE:** : You need to logout and login back for the changes to be reflected.


### Docker is Installed, up and running 🥳🥳

Use the same command again, to verify that docker is up and running.

```
docker run hello-world
```

Output should look like:

```
....
....
Hello from Docker!
This message shows that your installation appears to be working correctly.
...
...
```


## Great Job, Now start with the examples folder to write your first Dockerfile and move to the next examples. Happy Learning :)

### Login to Docker [Create an account with https://hub.docker.com/]

```
docker login
```

```
Login with your Docker ID to push and pull images from Docker Hub. If you don't have a Docker ID, head over to https://hub.docker.com to create one.
Username: pratap15
Password: Pratap@2024
WARNING! Your password will be stored unencrypted in /home/ubuntu/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded
```

### Build your first Docker Image

#### Dockerfile creation steps

step1:- Create a file named "Dockerfile"

step2:- Add instructions in Dockerfile

step3:- Build Dockerfile to create image

step4:- Run image to create container

Create a Dockerfile

vi Dockerfile

```
FROM ubuntu:latest

# Set the working directory in the image
WORKDIR /tmp

# Copy the files from the host file system to the image file system
COPY testfile1 /tmp

# Install the necessary packages
RUN echo "Hii, this is test" > /tmp/testfile

# Set environment variables
ENV NAME John-cena

# Run a command to start the application
ADD test.tar.gz /tmp

```
Now, you need to build image using Dockerfile

```
docker build -t pratap15/mytestimage:latest .
```

Output of the above command

```
Sending build context to Docker daemon  29.18kB
Step 1/6 : FROM ubuntu:latest
 ---> edbfe74c41f8
Step 2/6 : WORKDIR /tmp
 ---> Using cache
 ---> 9bb6edcbc800
Step 3/6 : COPY testfile1 /tmp
 ---> Using cache
 ---> 743101dc6ac0
Step 4/6 : RUN echo "Hii, this is test" > /tmp/testfile
 ---> Using cache
 ---> c813f98a6b42
Step 5/6 : ENV NAME John-cena
 ---> Using cache
 ---> ea3e2f0e2288
Step 6/6 : ADD test.tar.gz /tmp
 ---> a270a40ae41e
Successfully built a270a40ae41e
Successfully tagged mytestfile:latest
```

### Verify Docker Image is created

```
docker images
```

Output 

```

REPOSITORY     TAG       IMAGE ID       CREATED         SIZE
mytestfile     latest    7884e024d133   5 minutes ago   580MB
ubuntu         latest    edbfe74c41f8   3 weeks ago     78.1MB
hello-world    latest    d2c94e258dcb   16 months ago   13.3kB

```

### Run your First Docker Container

```
docker run -it abhishekf5/my-first-docker-image
```

Output

```
Hello World
test.tar.gz  testfile  testfile1

```

### Push the Image to DockerHub and share it with the world

```
docker push pratap15/mytestimage
```

Output

```
Using default tag: latest
The push refers to repository [docker.io/pratap15/mytestimage]
896818320e80: Pushed
b8088c305a52: Pushed
69dd4ccec1a0: Pushed
c5ff2d88f679: Mounted from library/ubuntu
latest: digest: sha256:6e49841ad9e720a7baedcd41f9b666fcd7b583151d0763fe78101bb8221b1d88 size: 1150
```

## Docker Commands

To find out images in docker hub
```
docker search <image-name>
```
Download image from docker hub to local machine
```
docker pull <image_name>
```
Run & give the name to container
```
docker run <image_name>
docker run -it --name <container_name> <image_name> /bin/bash
```
Go inside the container
```
docker attach <container_name>
```
Start and Stop a container
```
docker start <container_id>
docker stop <container_id>
```
See all container including stopped running
```
docker ps
docker ps -a
```
Delete container
```
docker rm <container_name or ID>
```
Delete image
```
docker rmi <image-name>
```

Create image from container
```
docker commit <container_name> <image_name>
```

Check the diff before or after creation of container
```
docker diff <container_name>
```

## Create volume using Dockerfile

Create a Dockerfile

vi Dockerfile
```
FROM ubuntu
VOLUME ["/myvolume1"]
```

Create image from Dockerfile
```
docker build -t myimage .
```
Create the container from this image & run
```
docker run -it --name container1 myimage /bin/bash
```
do `ls`, you can see this volume folder `myvolume1`

### Share volume with another container
  container-------<Volume>---------container
  
  container2 --> new container

  container1 --> old container
  
```
docker run -it --name container2 --privileged=true --volumes-from container1 ubuntu /bin/bash
```
After creating container2 with volume, myvolume1 is visible and whatever you do in this volume, you can see the changes in container1's volume
```
touch /myvolume1/samplefile
docker start container1
docker attach container1

ls/myvolume1
```
Do this testing in both container and you will see samplefile

Create volume and attach volume using command
```
docker run -it --name container3 -v /volume2 ubuntu /bin/bash
```
### Share volume Between Host and container
host-------<volume>---------container

verify files in /home/ubuntu
```
docker run -it --name hostcont -v /home/ubuntu:/pratap --privileged=true ubuntu /bin/bash
```
cd /pratap

Do ls, now you can see all files of host machine

Do this testing in container and host

List the volume
```
docker volume ls
```
Create volume
```
docker volume create <volumename>
```
Delete the volume
```
docker volume rm <volumename>
```

Remove all unused docker volume
```
docker volume prune
```
See the all details related to volume and container
```
docker volume inspect <volume-name>
docker container inspect <container-name>
```



## Docker port Expose

```
docker run -td --name techserver -p 80:80 ubuntu

-d :-daemon
-p :-port/publish
```
docker ps

See the techserver port
```
docker port techserver
```
output:
```
o/p :- 80/TCP -----> 0.0.0.0/80
```
Go inside into the container
```
docker exec -it techserver /bin/bash
```
Update the container and install apach2 webserver
```
apt-get update
apt-get install apache2 -y
```
Go inside html directory & write some data inside index.html folder
```
cd /var/www/html
echo "jai jai sri ram" > index.html
```
Start the webserver
```
service apache2 start
```
Make sure port is open in AWS security group and go to crome browser paste IP-address:80

Output
```
jai jai sri ram
```
Stop all running containers
```
docker stop $(docker ps -a -q)
```
Delete all stopped containers
```
docker rm $(docker ps -a -q)
```
Delete all images
```
docker rmi -f $(docker ps -a -q)
```

### You must be feeling like a champ already 
