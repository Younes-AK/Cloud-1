FROM debian:bookworm

RUN apt update && apt install -y \
    curl git wget php php-fpm php-mysql netcat-openbsd

COPY tools/script.sh .

RUN chmod +x script.sh

WORKDIR /var/www/wp

RUN mkdir -p /run/php

ENTRYPOINT [ "bash", "/script.sh" ]
