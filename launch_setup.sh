#!/bin/bash

#startup script to install nginx, docker, and more

sudo apt-get -y update
sudo apt-get -y install nginx
sudo systemctl stop nginx

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
sudo rm /etc/nginx/sites-available/default
sudo mv ./SSL/default /etc/nginx/sites-available/default
sudo mv ./SSL/dhparam.pem /etc/ssl/certs/dhparam.pem
sudo mv ./SSL/nginx-selfsigned.crt /etc/ssl/certs/nginx-selfsigned.crt
sudo mv ./SSL/nginx-selfsigned.key /etc/ssl/private/nginx-selfsigned.key
sudo mv ./SSL/self-signed.conf /etc/nginx/snippets/self-signed.conf
sudo mv ./SSL/ssl-params.conf /etc/nginx/snippets/ssl-params.conf

sudo mv docker-compose.yml /opt/docker/rocket.chat/docker-compose.yml

sudo systemctl restart nginx

cd /opt/docker/rocket.chat
sudo docker-compose up -d
echo "PLEASE WAIT, INITIALIZING CONTAINERS..."
sleep 30


exit 0
