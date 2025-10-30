#!/bin/bash

sudo apt update -y
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update -y
sudo apt install docker-ce docker-ce-cli containerd.io -y

sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

sudo apt install git -y 
sudo git clone https://github.com/MrJosem/Convocatoria-2---Recuperacion-Despliegue-Web.git /tmp/mi_repo

sudo cp -r /tmp/mi_repo/Server/* /home/admin
sudo cp -r /tmp/mi_repo/Certificates/* /home/admin

sudo systemctl enable docker
sudo systemctl start docker

cd /home/admin

sudo docker build -t ubuntu-apache .
sudo docker run -d -p 8080:80 --name my-apache ubuntu-apache