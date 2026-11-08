FROM debian:bookworm

RUN apt-get update && \ 
    apt-get install -y curl tar

WORKDIR /opt/portainer

RUN curl -L "https://github.com/portainer/portainer/releases/download/2.45.3/portainer-2.45.3-linux-amd64.tar.gz" -o "/tmp/portainer.tar.gz" \
    && tar -xzf "/tmp/portainer.tar.gz" -C /opt \
    && rm /tmp/portainer.tar.gz

ENTRYPOINT [ "/opt/portainer/portainer", "-H", "unix:///var/run/docker.sock" ]
