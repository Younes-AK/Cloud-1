
FROM debian:bookworm

RUN apt-get update && apt-get install -y \
    vsftpd curl

COPY ./tools/setup.sh .

RUN chmod +x /setup.sh

ENTRYPOINT [ "/setup.sh" ]
