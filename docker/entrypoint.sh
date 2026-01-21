#!/bin/bash

cd /usr/share/nginx

rm -rf html
mkdir html

git clone https://github.com/stenny94/kiosk-menu.git html

cd html
sed -i 's/LOCATION/${APP_MODE:-clay}/g' index.html

nginx -g "daemon off;"
