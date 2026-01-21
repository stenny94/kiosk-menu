#!/bin/bash

# 1. Install Docker (standard way)
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# 2. Install dependencies
sudo apt-get update
sudo apt-get install -y uidmap xautomation unclutter

# 3. Setup rootless (if that is your intent)
dockerd-rootless-setuptool.sh install

# 4. Download and setup startup script
sudo wget -O /startup.sh https://raw.githubusercontent.com/stenny94/kiosk-menu/refs/heads/main/startup.sh
sudo chmod a+x /startup.sh

# --- THE FIX ---
# We redirect input from the terminal specifically to ensure the prompt appears
echo "--------------------------------------------------"
read -p "Please enter your store location (e.g., clay, beloit, st_marys): " STORELOCATION < /dev/tty
echo "Setting location to: $STORELOCATION"
echo "--------------------------------------------------"

# 5. Run the container
docker run -d -p 8080:80 --name kiosk-menu --restart=always -e LOCATION="$STORELOCATION" stenny94/kiosk-menu:latest
