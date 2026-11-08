
FROM debian:bookworm

RUN apt-get update && \
    apt-get install -y php php-mysqli wget

COPY ./tools/script.sh .

RUN chmod +x script.sh && /script.sh

ENTRYPOINT ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/html"]

