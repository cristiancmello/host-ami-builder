#!/bin/sh

DOCKER_COMPOSE_VERSION=1.25.4

sudo yum update -y

# Install Docker and set up
sudo amazon-linux-extras install docker
sudo service docker start
sudo usermod -a -G docker ec2-user

# Make docker auto-start
sudo chkconfig docker on

# Install Docker Compose
sudo curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

# Install AWS EFS Utils
sudo yum -y install amazon-efs-utils