#! /bin/bash

# Update & Upgrade
sudo apt update && sudo apt upgrade -y

# Install Docker & docker-compose
sudo apt install docker docker-compose python3-pip -y

# Install python packages
sudo pip3 pyserial

# Create folder for Docker
sudo mkdir /home/kassa/docker

# Copy compose file to docker folder
sudo cp docker-compose.yml /home/kassa/docker

# Create folder for Script
sudo mkdir /home/kassa/scripts

# Make python script executable
sudo chmod +x printer_listener.py

# Copy python script to scripts folder
sudo cp printer_listener.py /home/kassa/scripts

# Change service permissions
sudo chmod 644 printerlistener.service

# Copy service file to service folder
sudo cp printerlistener.service /lib/systemd/system

# Reloading system-ctl
sudo systemctl daemon-reload

# Enabling service
sudo systemctl enable printerlistener.service

# Starting service
sudo systemctl start printerlistener.service

# Show status of service
sudo systemctl status printerlistener.service

# Create binding folder for postgres image
sudo mkdir /home/kassa/docker/postgres

# Start up docker images
cd /home/kassa/docker && sudo docker-compose up -d

# Show running docker containers
sudo docker container ls

# Remove setup
sudo rm -rf /home/kassa/Kassasysteem-Deployment