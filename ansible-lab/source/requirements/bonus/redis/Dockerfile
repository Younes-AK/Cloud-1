FROM debian:bookworm

RUN apt-get update && apt-get install -y \
    redis-server

COPY ./tools/setup.sh /setup.sh

RUN chmod +x /setup.sh

RUN /setup.sh

ENTRYPOINT [ "redis-server", "--protected-mode", "no" ]
