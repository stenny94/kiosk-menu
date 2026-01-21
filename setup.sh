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
echo "--------------------------------------------------"
read -p "Please enter the type of file needed (image or video): " USER_INPUT < /dev/tty

# Convert input to the desired extension
case "$USER_INPUT" in
  video)
    FILETYPE=".avi"
    ;;
  image)
    FILETYPE=".png"
    ;;
  *)
    # Fallback if they type something else or leave it blank
    echo "Invalid input detected. Defaulting to .png"
    FILETYPE=".png"
    ;;
esac

echo "Setting filetype to: $FILETYPE"
echo "--------------------------------------------------"
echo ""
echo ""



docker run -d -p 8080:80 --name kiosk-menu --restart=always -e LOCATION="$STORELOCATION" -e FILETYPE="$FILETYPE" stenny94/kiosk-menu:latest
