#! /bin/bash

# Update & Upgrade
sudo apt update && sudo apt upgrade -y

# Install Docker & docker-compose
sudo apt install docker docker-compose -y

# Create folder for Docker
sudo mkdir /home/kassa/docker

# Copy compose file to docker folder
sudo cp docker-compose.yml /home/kassa/docker

# Create binding folder for postgres image
sudo mkdir /home/kassa/docker/postgres

# Start up docker images
cd /home/kassa/docker && sudo docker-compose up -d

# Show running docker containers
sudo docker container ls

# Remove setup
sudo rm -rf /home/kassa/Kassasysteem-Deployment