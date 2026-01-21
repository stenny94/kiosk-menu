# kiosk-menu
### 1. Install Docker and Dependancies

    wget -O- https://raw.githubusercontent.com/stenny94/kiosk-menu/refs/heads/main/docker.sh | bash

Run this one once per system setup.

### 2. Container Setup

    wget -O- https://raw.githubusercontent.com/stenny94/kiosk-menu/refs/heads/main/setup.sh | bash

Run this one if you wish to change the store/menu you would like, or if you need to update the container.

### 3. Add to Startup (or Autostart)
Create an autostart/startup link to the file at the root directory called 'startup.sh', it is the file that will launch Firefox in kiosk mode at the menu server.

---

And... that's it. I probably put way too much work into this, but that's okay.

---

#### Personal Resources/Notes
Use the following command to build the Docker image.

    docker build -t stenny94/kiosk-menu .

And use this command to push to the repository.

    docker push stenny94/kiosk-menu:latest
