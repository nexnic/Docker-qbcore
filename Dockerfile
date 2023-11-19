# syntax=docker/dockerfile:1
# Ubuntu Server
# https://hub.docker.com/_/ubuntu
FROM ubuntu:latest
# Removing Desktop 
ARG DEBIAN_FRONTEND=noninteractive
ARG FIVEM_VER='5848-4f71128ee48b07026d6d7229a60ebc5f40f2b9db'
## Installing 
RUN \
    sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y build-essential && \
    apt-get install -y software-properties-common && \
    apt-get install -y byobu curl git htop man unzip vim wget && \
    rm -rf /var/lib/apt/lists/*


RUN mkdir /fivem && \
    useradd -d /fivem -s /bin/bash admin_keh && \
    chown -R admin_keh /fivem && \
    cd /fivem && \ 
    wget https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/$FIVEM_VER/fx.tar.xz && \
    tar -xf fx.tar.xz && \ 
    rm fx.tar.xz && \
    #ToDO
    #iptables -A INPUT -p tcp --dport 3306 -j ACCEPT && \
    ulimit -n 2048

#
#RUN wget https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/5848-4f71128ee48b07026d6d7229a60ebc5f40f2b9db/fx.tar.xz

EXPOSE 4120

ENTRYPOINT ["/fivem/run.sh"]