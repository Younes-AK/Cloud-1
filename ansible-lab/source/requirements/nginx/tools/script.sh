#!/bin/bash

mkdir -p /etc/nginx/ssl

if [ ! -s /etc/nginx/ssl/server.key ] || [ ! -s /etc/nginx/ssl/server.crt ]; then
  openssl req -x509 -nodes -days 365 \
    -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/server.key \
    -out /etc/nginx/ssl/server.crt \
    -subj "/C=MO/ST=KH/L=KH/O=1337/OU=1337/CN=${DOMAIN_NAME}"
fi

exec nginx -g "daemon off;"
