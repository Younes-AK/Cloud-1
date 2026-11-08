
FROM debian:bookworm

RUN apt-get update && \
    apt-get install -y nginx openssl

COPY conf/nginx.conf /etc/nginx/nginx.conf

COPY tools/script.sh .

RUN chmod +x script.sh

CMD ["./script.sh"]
