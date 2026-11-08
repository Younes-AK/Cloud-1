FROM debian:bookworm

RUN apt-get update && \
    apt-get install -y mariadb-server

COPY tools/script.sh /script.sh

RUN chmod +x /script.sh

ENTRYPOINT [ "/script.sh" ]
