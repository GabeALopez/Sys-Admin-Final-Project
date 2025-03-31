# Sys Admin Final Project

## Description

This project utilizes Docker containers to maintain a server hosting a WordPress application. Additionally, a database will be connected to the WordPress application. To ensure high availability and fault tolerance, multiple containers will be deployed across three GCP instances. This setup ensures that the server remains operational even if one instance or Docker container fails.

## Set Up

**Installing Docker and Docker Compose:**

```Bash
sudo apt update
sudo apt install docker.io

sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

```
**Then Verify Docker Compose With:**

```Bash
docker-compose --version
```
**How to Run Compose File**

***NOTE: Run this in the directory where the compose file is***

```Bash
docker-compose up -d
```

After everything is downloaded, navigate to port 8000 on localhost and go through the process to installing WordPress.

## How to Full Reset Everything

```Bash
sudo docker system prune -a --volumes -f
```
