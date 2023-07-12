#!/bin/bash

# basic patching
sudo apt update -y

# docker
sudo apt install docker.io -y 

# docker-compose
sudo apt install docker-compose -y

# git
sudo apt install git -y

# clone repo
cd /home/ubuntu
git clone https://github.com/jagriti-hub/Devops-Assignment-Smartcow.git

# cd to repo
cd Devops-Assignment-Smartcow/

# run app
sudo docker-compose up -d