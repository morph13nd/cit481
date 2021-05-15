#!/bin/bash


sudo apt-get -y update

git clone https://github.com/themaverick/cit481.git
cd cit481

#Create service account
sudo useradd --no-create-home prometheus
sudo mkdir /etc/prometheus
sudo mkdir /var/lib/prometheus

#Stage prometheus
wget https://github.com/prometheus/prometheus/releases/download/v2.19.0/prometheus-2.19.0.linux-amd64.tar.gz
tar xvfz prometheus-2.19.0.linux-amd64.tar.gz
sudo cp prometheus-2.19.0.linux-amd64/prometheus /usr/local/bin
sudo cp prometheus-2.19.0.linux-amd64/promtool /usr/local/bin/
sudo cp -r prometheus-2.19.0.linux-amd64/consoles /etc/prometheus
sudo cp -r prometheus-2.19.0.linux-amd64/console_libraries /etc/prometheus
sudo cp prometheus-2.19.0.linux-amd64/promtool /usr/local/bin/
sudo mv ./Prometheus/prometheus.yml /etc/Prometheus/prometheus.yml
sudo mv ./Prometheus/prometheus.service /etc/Prometheus/prometheus.service
rm -rf prometheus-2.19.0.linux-amd64.tar.gz prometheus-2.19.0.linux-amd64


#Change permissions for our prometheus service account
sudo chown prometheus:prometheus /etc/prometheus
sudo chown prometheus:prometheus /usr/local/bin/prometheus
sudo chown prometheus:prometheus /usr/local/bin/promtool
sudo chown -R prometheus:prometheus /etc/prometheus/consoles
sudo chown -R prometheus:prometheus /etc/prometheus/console_libraries
sudo chown -R prometheus:prometheus /var/lib/prometheus

#Configure prometheus service
sudo systemctl daemon-reload

sudo systemctl enable prometheus
sudo systemctl start prometheus

#Run sanity check on prometheus
sudo promtool check /etc/prometheus/prometheus.yml
sudo promtool check config /etc/prometheus/prometheus.yml

exit 0
