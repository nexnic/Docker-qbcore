# syntax=docker/dockerfile:1
# Ubuntu Server
# https://hub.docker.com/_/ubuntu
FROM ubuntu:latest
# Removing Desktop Kernal
ARG DEBIAN_FRONTEND=noninteractive

# Variable
## FIVEM VERSION NUMBER 
## https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/ 
ARG FIVEM_VER='6683-9729577be50de537692c3a19e86365a5e0f99a54'

## Updating Ubuntu 
RUN \
    sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y build-essential && \
    apt-get install -y software-properties-common && \
    apt-get install -y byobu curl git htop man unzip vim wget && \
    rm -rf /var/lib/apt/lists/*

## Fivem Install 
RUN mkdir /fivem && \
    useradd -d /fivem -s /bin/bash admin_keh && \
    chown -R admin_keh /fivem && \
    cd /fivem && \ 
    wget https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/$FIVEM_VER/fx.tar.xz && \
    tar -xf fx.tar.xz && \ 
    rm fx.tar.xz && \
    ulimit -n 2048

EXPOSE 3000

ENTRYPOINT ["/fivem/run.sh"]