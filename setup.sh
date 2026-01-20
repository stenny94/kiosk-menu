#!/bin/bash

wget -O- get.docker.com | bash

sudo apt-get install -y uidmap xautomation unclutter

dockerd-rootless-setuptool.sh install

docker run -d -p 8080:80 --name kiosk-menu --restart=always stenny94/kiosk-menu:latest
