# syntax=docker/dockerfile:1
# Ubuntu Server
# https://hub.docker.com/_/ubuntu
FROM ubuntu:latest
# Removing Desktop Kernal
ARG DEBIAN_FRONTEND=noninteractive

# Variable
## USER For SERVER
ARG USERNAME='admin_test'

## FIVEM VERSION NUMBER 
## https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/ 
ARG FIVEM_VER='6683-9729577be50de537692c3a19e86365a5e0f99a54'

## GIT 
ARG GIT_USERNAME='Test Paris'
ARG GIT_EMAIL='testparis@gmail.com'
## Folders
ARG SSHKEYFOLDER='SSHKEY'
ARG FIVEMFOLDER='fivem'



## Updating Ubuntu 

RUN \
    sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y build-essential && \
    apt-get install -y software-properties-common && \
    apt-get install -y byobu curl git htop man unzip vim wget && \
    rm -rf /var/lib/apt/lists/*

## Install GIT SCM

RUN \
    apt-get install -y git && \
    git config --global user.name $GIT_USERNAME && \
    git config --global user.email $GIT_EMAIL

## SSH Install 
RUN \
    apt-get install -y && \
        openssh-server \
        libmysqlclient-dev


    

## Fivem Install 

RUN mkdir /fivem && \
    useradd -d /$FIVEMFOLDER -s /bin/bash $USERNAME && \
    chown -R $USERNAME /$FIVEMFOLDER && \
    cd /FIVEMFOLDER && \ 
    wget https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/$FIVEM_VER/fx.tar.xz && \
    tar -xf fx.tar.xz && \ 
    rm fx.tar.xz && \
    ulimit -n 2048

EXPOSE 3000

ENTRYPOINT ["/fivem/run.sh"]