#!/bin/bash
sudo apt-get update;
sudo apt-get install awscli -y;
#echo "------------awscli configure-------------"
sudo mkdir home/ubuntu/.aws;
sudo touch home/ubuntu/.aws/credentials home/ubuntu/.aws/config;
sudo cat <<EOF >> /home/ubuntu/.aws/credentials
[default]
aws_access_key_id=${access}
aws_secret_access_key=${secret}
EOF
sudo cat <<EOF >> /home/ubuntu/.aws/config
[default]
region=us-east-1
EOF
#echo "---------------sudo awscli conf----------------------"
sudo aws configure set aws_access_key_id ${access}
sudo aws configure set aws_secret_access_key ${secret}
sudo aws configure set default.region us-east-1
#echo "------------------install docker---------------------"
sudo apt-get update;
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y;
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -;
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs)  stable";
sudo apt-get install docker-ce -y;
#echo "-----------------set docker us root--------------------"
sudo chown root:docker /var/run/docker.sock;
sudo chown -R root:docker /var/run/docker;
sudo chmod 666 /var/run/docker.sock;
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
#echo "-------------register to ecr and docker pull image--------------------"
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 903120719010.dkr.ecr.us-east-1.amazonaws.com;
docker pull 903120719010.dkr.ecr.us-east-1.amazonaws.com/digichlist-frontend:latest;
docker run -ip 80:80 903120719010.dkr.ecr.us-east-1.amazonaws.com/digichlist-frontend:latest;
