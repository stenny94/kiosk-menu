# kiosk-menu
### 1. Install Docker
    wget -O- get.docker.com | bash && sudo groupadd docker && sudo usermod -aG docker $USER

### 2. Pull & Run the Image
    docker run -d -p 8080:80 --name kiosk-menu stenny94/kiosk-menu:latest --restart=always
