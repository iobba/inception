# Inception_42

Welcome to the **Inception** project's README! This project focuses on system administration tasks using Docker and containerization. I will provide some useful links and resources for reference throughout the project.

# what is DOCKER:

https://hackr.io/blog/what-is-docker#docker-compose

# What is Dockerfile:

https://jyotijha5916.ongraphy.com/blog/understanding-dockerfile


# what is the difference between containerization and Virtualization

Containerization is a form of virtualization. **Virtualization aims to run multiple OS instances on a single server, whereas containerization runs a single OS instance, with multiple user spaces to isolate processes from one another**.

![image](https://github.com/iobba/inception/assets/125093290/ac97b609-e581-4e01-b062-db7c6c38dc51)

## **CMD TO REMOVE ALL (images , containers , volumes and networks)**:
| images | container | volume | networks |
| --- | --- | --- | ---- |
| docker rmi -f (ID or name) | docker rm -f (ID or NAME) | docker volume rm -f (ID OR NAME) | docker network rm -f (ID OR NAME) |
