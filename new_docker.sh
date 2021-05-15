#!/bin/bash

sudo docker login -u cit481 -p 123456789
sudo docker pull cit481/mongodb:latest
sudo docker stop rocketchat_mongo_1
sudo docker system prune -a
sudo docker run --expose 27017 -itd cit481/mongodb:latest /bin/bash
sudo docker-compose up -d
