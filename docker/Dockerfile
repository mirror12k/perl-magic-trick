#!/usr/bin/env -S bash -c "docker run -v \${PWD}:/app -it \$(docker build docker >&2 && docker build -q docker) \$@"
FROM ubuntu:22.04

WORKDIR /app

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get install -y nodejs perl cpanminus git nano zip python2 gcc g++ \
    && apt-get install -y python3 python3-dev libpython3.10-dev openjdk-17-jdk \
    && apt autoclean \
    && apt autoremove \
    && apt clean

CMD bash




