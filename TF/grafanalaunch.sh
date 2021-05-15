#!/bin/bash

#install docker
sudo apt-get -y update
sudo systemctl start nginx; wait 5; curl localhost:3000
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get -y update
sudo apt-get install -y docker-ce
sudo usermod -aG docker ${USER}

#install grafana container
sudo docker run -d --name=grafana -p 3000:3000 grafana/grafana
echo "PLEASE WAIT, INITIALIZING CONTAINERS..."

sleep 10

exit 0
