#!/bin/bash

#startup script to install nginx, docker, and docker-compose

sudo apt-get -y update
sudo apt-get -y install nginx
sudo systemctl stop nginx
sudo apt-get -y install certbot
sudo certbot certonly --standalone --non-interactive --agree-tos --email david.galstyan.182@my.csun.edu -d scarfacegeorge.com

sudo systemctl start nginx; wait 5; curl localhost

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get -y update

sudo apt-get install -y docker-ce
sudo usermod -aG docker ${USER}

sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo 'Run "docker --version" to check installation for Docker'
echo 'Exit SSH session and re-enter for changes to take effect'

#Saves variable permanently
echo "export PUBLICIP="$(dig +short myip.opendns.com @resolver1.opendns.com)"" >> temp.sh

sudo mkdir -p /opt/docker/rocket.chat/data/runtime/db
sudo mkdir -p /opt/docker/rocket.chat/data/dump

git clone https://github.com/themaverick/cit481.git
cd cit481
sudo mv docker-compose.yml /opt/docker/rocket.chat/docker-compose.yml

sudo mv /etc/nginx/sites-available/default /etc/nginx/sites-available/default.original
sudo mv default /etc/nginx/sites-available/default
sudo systemctl restart nginx

cd /opt/docker/rocket.chat
sudo docker-compose up -d
echo "PLEASE WAIT, INITIALIZING CONTAINERS..."
sleep 30


exit 0
