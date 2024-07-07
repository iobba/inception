# Inception: Docker Infrastructure Setup Project

![Image Description](https://github.com/iobba/inception/blob/master/dockere.png)

## Introduction

This project involves setting up a small infrastructure using Docker, focusing on containerizing and orchestrating several services using docker-compose.

## Containers
Containers are an abstraction at the app layer that packages code and dependencies together. Multiple containers can run on the same machine and share the OS kernel with other containers, each running as isolated processes in user space. Containers take up less space than VMs (container images are typically tens of MBs in size), can handle more applications and require fewer VMs and Operating systems.

## Virtual Machines
Virtual machines (VMs) are an abstraction of physical hardware turning one server into many servers. The hypervisor allows multiple VMs to run on a single machine. Each VM includes a full copy of an operating system, the application, necessary binaries and libraries – taking up tens of GBs. VMs also slow to boot.

## Why Docker and What is the problem that is solving ?
so let’s imagine a scenario pre docker era we have tester and developer and the developer
has just the code and its works perfectly fine on there system but when the tester take the code the test it in his machine its just doesn’t work and the reason could be a lot of thing it it might be the tester need some dependencies need to be installed in order for the code to work properly or some environnement variables needed to be added but they don’t exist it the tester machine. that means we found the problem how can we solve it ?

- `Here When Docker Comes Into Place.`
but you can be asking your self why not use virtual machine it might be good idea but it has alot of cons so let’s take look on differences between docker and VM’s

| Virtual Machine	                 |     Docker                        |
|----------------------------------|-----------------------------------|
| Occupy a lot of memory space	   | Occupy a lot less memory space    |
| long time to boot up	           | quick boot up because it uses the running kernel that you using |
| Difficult to scale up	           | super easy to scale               |
| low efficiency	                 | high efficiency                   |
| volumes storage cannot be shared across the VM’s	volumes. | storage can be shared across the host and the containers.|

## This project setting up the following Docker services:

1. **NGINX with TLS**: A Docker container running NGINX configured to support TLSv1.2 or TLSv1.3 only.
  - `NGINX` is a web server that can also be used as a reverse proxy, load balancer, and HTTP cache. It is known for its high performance, stability, and low resource consumption. NGINX is often used to handle server-side requests for web applications, and it can also be used to serve static content such as images and JavaScript files. In addition to its web server capabilities, NGINX can be configured to handle other types of network protocols, such as Secure Sockets Layer (SSL) and Transport Layer Security (TLS). It is often used in conjunction with other software, such as databases and content management systems, to build robust and scalable web applications.
2. **WordPress with php-fpm**: A Docker container hosting WordPress with php-fpm installed and configured.
  - `WordPress` is a content management system (CMS) based on PHP and MySQL. It is an open-source platform that is widely used for building websites, blogs, and applications. With WordPress, users can easily create and manage their own websites without the need for advanced technical skills. It is known for its simplicity and flexibility, making it a popular choice for both beginners and experienced developers. WordPress has a large community of users and developers who contribute to the platform, which has led to the development of a wide range of themes, plugins, and other tools that can be used to extend the functionality of WordPress websites.
3. **MariaDB**: A Docker container hosting MariaDB without nginx.
  - `MariaDB` is a free and open-source relational database management system (RDBMS) that is widely used as a drop-in replacement for MySQL. It is named after the developer's daughter, Maria, and is designed to be a community-driven alternative to MySQL, with a focus on simplicity, collaboration, and compatibility with other database systems.
4. **Volumes**: Two volumes are required:
   - One for the WordPress database.
   - Another for the WordPress website files.
5. **Docker Network**: Establish a dedicated Docker network to connect these containers.
6. **Automatic Restart**: Ensure containers automatically restart in case of a crash.

## The most common commands used in docker-compose
  - `up`: Create and start containers
  - `down`: Stop and remove containers, networks, images, and volumes
  - `start`: Start existing containers
  - `stop`: Stop running containers
  - `restart`: Restart running containers
  - `build`: Build images
  - `ps`: List containers
  - `logs`: View output from containers
  - `exec`: Run a command in a running container
  - `pull`: Pull images from a registry
  - `push`: Push images to a registry

## The most common commands used in docker
  - `docker build`: Used to build a Docker image from a Dockerfile.
  - `docker run`: Used to run a Docker container based on a Docker image.
  - `docker pull`: Used to pull a Docker image from a registry, such as Docker Hub.
  - `docker push`: Used to push a Docker image to a registry.
  - `docker ps`: Used to list the running Docker containers on a system.
  - `docker stop`: Used to stop a running Docker container.
  - `docker rm`: Used to remove a Docker container.
  - `docker rmi`: Used to remove a Docker image.
  - `docker exec`: Used to execute a command in a running Docker container.
  - `docker logs`: Used to view the logs for a Docker container.


