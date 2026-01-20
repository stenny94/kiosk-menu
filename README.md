# kiosk-menu
### 1. Install Docker and the Webserver
    wget -O- get.docker.com | bash && sudo apt-get install -y uidmap && dockerd-rootless-setuptool.sh install && docker run -d -p 8080:80 --name kiosk-menu stenny94/kiosk-menu:latest --restart=always

And... that's it.
