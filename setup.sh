#!/bin/bash

# Function for the spinning animation
spinner() {
    local pid=$1
    local delay=0.1
    local spinstr='|/-\'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

echo "Step 1: Installing Docker..."
(wget -O- get.docker.com | bash) > /dev/null 2>&1 &
spinner $!

echo "Step 2: Installing uidmap..."
(sudo apt-get install -y uidmap) > /dev/null 2>&1 &
spinner $!

echo "Step 3: Running Rootless setup tool..."
(dockerd-rootless-setuptool.sh install) > /dev/null 2>&1 &
spinner $!

echo "Step 4: Starting the Kiosk Menu container..."
(docker run -d -p 8080:80 --name kiosk-menu --restart=always stenny94/kiosk-menu:latest) > /dev/null 2>&1 &
spinner $!

echo "Setup complete!"
