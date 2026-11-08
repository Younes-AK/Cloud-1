
FROM debian:bookworm

RUN apt-get update && \
    apt-get install -y nginx

COPY ./tools/nginx.conf /etc/nginx/nginx.conf

COPY ./tools/website/. /var/www/html

CMD ["nginx", "-g", "daemon off;"]
