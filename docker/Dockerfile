FROM nginx:latest

# Install git
RUN apt-get update && apt-get install -y git

# Copy our script into the image and make it executable
COPY entrypoint.sh /entrypoint.sh
RUN sed -i 's/\r$//' /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set the script as the command that runs on startup
ENTRYPOINT ["/entrypoint.sh"]
