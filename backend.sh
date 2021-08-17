#!/bin/bash
sudo apt update
sudo apt install git -y
sudo apt install docker.io -y
sudo systemctl enable --now docker
sudo git clone https://github.com/YaroslavVoloshchuk/digichlist-api.git
cd digichlist-api/
sudo gpasswd -a ubuntu docker
newgrp docker
sudo docker build -t digicapi .
sudo docker run -p 80:5000 -d digicapi
