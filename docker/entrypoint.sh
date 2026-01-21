#!/bin/bash

# Navigate to the parent directory
cd /usr/share/nginx

# Force delete the html directory and recreate it empty
rm -rf html
mkdir html

# Clone the repo into the now-empty html folder
git clone https://github.com/stenny94/kiosk-menu.git html

# Start Nginx
nginx -g "daemon off;"