# syntax=docker/dockerfile:1
# Ubuntu Server
FROM ubuntu:latest
ARG DEBIAN_FRONTEND=noninteractive



## Work Dir 
## WORKDIR /srv/app

##WORKDIR /app



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
    wget https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/5848-4f71128ee48b07026d6d7229a60ebc5f40f2b9db/fx.tar.xz && \
    tar -xf fx.tar.xz && \ 
    rm fx.tar.xz && \
    ulimit -n 2048
#ARG FIVEM_VER=
#RUN wget https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/5848-4f71128ee48b07026d6d7229a60ebc5f40f2b9db/fx.tar.xz

EXPOSE 3000

ENTRYPOINT ["/fivem/run.sh"]