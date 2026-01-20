#!/bin/bash

echo "Step 1: Installing Docker..."
wget -O- get.docker.com | bash

echo "Step 2: Installing uidmap..."
sudo apt-get install -y uidmap

echo "Step 3: Running Rootless setup tool..."
dockerd-rootless-setuptool.sh install

echo "Step 4: Starting the Kiosk Menu container..."
docker run -d -p 8080:80 --name kiosk-menu --restart=always stenny94/kiosk-menu:latest

echo "Setup complete!"
