#!/bin/bash
# Instalacion Docker
sudo yum update -y
sudo yum install docker -y
sudo service docker start
sudo groupadd docker
sudo usermod -aG docker ec2-user
newgrp docker
# Instalacion Plugings Docker Compose
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins
curl -SL https://github.com/docker/compose/releases/download/v2.33.1/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
sudo  chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
# Intalacion de Git
sudo yum install git -y

#Clonar repo publico: 
git clone https://github.com/gbzz24/Assessment2
cd Asssessment2/
#Levantar Docker Compose
docker-compose up -d --build

