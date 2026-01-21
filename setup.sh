sudo wget -O /startup.sh https://raw.githubusercontent.com/stenny94/kiosk-menu/refs/heads/main/startup.sh
sudo chmod a+x /startup.sh

docker rm -f kiosk-menu

echo ""
echo ""
echo "--------------------------------------------------"
read -p "Please enter your store location (e.g., clay, beloit, st_marys): " STORELOCATION < /dev/tty
echo "Setting location to: $STORELOCATION"
echo "--------------------------------------------------"
echo ""
echo ""



docker run -d -p 8080:80 --name kiosk-menu --restart=always -e LOCATION="$STORELOCATION" stenny94/kiosk-menu:latest
