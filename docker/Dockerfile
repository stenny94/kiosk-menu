FROM nginx:latest

ENV LOCATION=clay

RUN apt-get update && apt-get install -y git

COPY entrypoint.sh /entrypoint.sh
RUN sed -i 's/\r$//' /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
