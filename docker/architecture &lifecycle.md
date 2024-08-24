# Docker

Docker is a containerization platform that provides easy way to containerize your applications, which means, using Docker you can build container images, run the images to create containers and also push these containers to container regestries such as DockerHub, Quay.io and so on.

In simple words, you can understand as `containerization is a concept or technology` and `Docker Implements Containerization`.

- We can install docker on any operating system but docker engine runs natively on linux distribution.
- Docker written in 'go' language.
- Docker was first release in march 2013. It is developed by solomon hykes and sebastian pahl.
- Docker is a set of platform as a service that uses O.S-level virtualization whereas VMware uses hardware-level virtualization.


### Advantages
- **CI Efficiency**-> With the help of a Docker, we can build a container image and can further use that same image over every step of the deployment process.
- Less Cost
- It is light weight
- It can run on physical hardware/ virtual hardware/ or on cloud.
- It took very less time to create  container.

### Disadvantages
- Docker is not a good solution for application that requires rich GUI.
- Difficult to manage large amount of containers.
- Docker does not provide cross-platform compatibility means if an application is designed to run in a docker container on windows, then it can't run on linux or vice-versa.
- Docker is suitable when the development O.S and testing O.S are same if the O.S is different, we should use VM.
- No solution for data recovery and backup.


## Architecture

![image](https://user-images.githubusercontent.com/43399466/217507877-212d3a60-143a-4a1d-ab79-4bb615cb4622.png)

The above picture, clearly indicates that Docker Deamon is brain of Docker. If Docker Deamon is killed, stops working for some reasons, Docker is brain dead :p (sarcasm intended).

### Docker daemon

The Docker daemon (dockerd) listens for Docker API requests and manages Docker objects such as images, containers, networks, and volumes. A daemon can also communicate with other daemons to manage Docker services.


### Docker client

The Docker client (docker) is the primary way that many Docker users interact with Docker. When you use commands such as docker run, the client sends these commands to dockerd, which carries them out. The docker command uses the Docker API. The Docker client can communicate with more than one daemon.


### Docker Desktop

Docker Desktop is an easy-to-install application for your Mac, Windows or Linux environment that enables you to build and share containerized applications and microservices. Docker Desktop includes the Docker daemon (dockerd), the Docker client (docker), Docker Compose, Docker Content Trust, Kubernetes, and Credential Helper. For more information, see Docker Desktop.


### Docker registries

A Docker registry stores Docker images. Docker Hub is a public registry that anyone can use, and Docker is configured to look for images on Docker Hub by default. You can even run your own private registry.

When you use the docker pull or docker run commands, the required images are pulled from your configured registry. When you use the docker push command, your image is pushed to your configured registry.
Docker objects

When you use Docker, you are creating and using images, containers, networks, volumes, plugins, and other objects. This section is a brief overview of some of those objects.


### Dockerfile

Dockerfile is a file where you provide the steps to build your Docker Image. 

### Docker Images

Docker images are the read only binary templetes used to create  docker container.

You might create your own images or you might only use those created by others and published in a registry. To build your own image, you create a Dockerfile with a simple syntax for defining the steps needed to create the image and run it. Each instruction in a Dockerfile creates a layer in the image. When you change the Dockerfile and rebuild the image, only those layers which have changed are rebuilt. This is part of what makes images so lightweight, small, and fast, when compared to other virtualization technologies.

### Docker Container
- Container hold the entire packages that is needed to run the application.
- The image is a templete and the container is a copy of that templete.
- Container is like a virtual machine.
- Images becames container when they run on docker engine. 

## Docker LifeCycle 

We can use the above Image as reference to understand the lifecycle of Docker.

There are three important things,

1. docker build -> builds docker images from Dockerfile
2. docker run   -> runs container from docker images
3. docker push  -> push the container image to public/private regestries to share the docker images.

![Screenshot 2023-02-08 at 4 32 13 PM](https://user-images.githubusercontent.com/43399466/217511949-81f897b2-70ee-41d1-b229-38d0572c54c7.png)

## Ways to create an Images
1. Take image from docker hub
2. create image from docker file
3. create image from existing docker containers

## Docker Components

`FROM` For base image. This command must be on top of the dockerfile

`RUN` To execute commands, it will create a layer in image

`MAINTAINER` Author/ Owner/ Description

`COPY` Copy file from local system(dockerVM) we need to provide source destination(we can't download file from internet and any remote repo)

`ADD` Similar to copy but, it provides a feature to download files from internet, also we extract file at docker image side

`EXPOSE` To Expose ports such as port port 80 for nginx 

`WORKDIR` TO Set working directory for a container

`CMD` Execute commands but during container creation

`ENTRYPOINT` Similar to CMD, but has higher priority over CMD, first commands will be executed by ENTRYPOINT Only.

`ENV` Environment variables

## Files and Folders in containers base images

  /bin: contains binary executable files, such as the ls, cp, and ps commands.

  /sbin: contains system binary executable files, such as the init and shutdown commands.

  /etc: contains configuration files for various system services.

  /lib: contains library files that are used by the binary executables.

  /usr: contains user-related files and utilities, such as applications, libraries, and documentation.

  /var: contains variable data, such as log files, spool files, and temporary files.

  /root: is the home directory of the root user.




## Files and Folders that containers use from host operating system


  The host's file system: Docker containers can access the host file system using bind mounts, which allow the container to read and write files in the host file system.

  **Networking stack:** The host's networking stack is used to provide network connectivity to the container. Docker containers can be connected to the host's network directly or through a virtual network.

  **System calls:** The host's kernel handles system calls from the container, which is how the container accesses the host's resources, such as CPU, memory, and I/O.

  **Namespaces:** Docker containers use Linux namespaces to create isolated environments for the container's processes. Namespaces provide isolation for resources such as the file system, process ID, and network.

  **Control groups (cgroups):** Docker containers use cgroups to limit and control the amount of resources, such as CPU, memory, and I/O, that a container can access.
    

It's important to note that while a container uses resources from the host operating system, it is still isolated from the host and other containers, so changes to the container do not affect the host or other containers.

**Note:** There are multiple ways to reduce your VM image size as well, but I am just talking about the default for easy comparision and understanding.

so, in a nutshell, container base images are typically smaller compared to VM images because they are designed to be minimalist and only contain the necessary components for running a specific application or service. VMs, on the other hand, emulate an entire operating system, including all its libraries, utilities, and system files, resulting in a much larger size. 

I hope it is now very clear why containers are light weight in nature.
