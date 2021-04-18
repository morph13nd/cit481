#!/bin/bash

#startup script to install nginx, docker, and docker-compose

sudo apt-get -y update
sudo apt-get install nginx
sudo systemctl restart nginx; wait 5; curl localhost

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get -y update

sudo apt-get install -y docker-ce
sudo usermod -aG docker ${USER}

 sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
 sudo chmod +x /usr/local/bin/docker-compose

echo 'Run "docker --version" to check installation for Docker'
echo 'Exit SSH session and re-enter for changes to take effect'

exit 0
