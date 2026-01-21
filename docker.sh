#!/bin/bash

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

dockerd-rootless-setuptool.sh install

sudo apt-get update
sudo apt-get install -y uidmap xautomation unclutter
