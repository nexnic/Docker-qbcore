# syntax=docker/dockerfile:1
## ubuntu Server
FROM ubuntu:latest
## Work Dir 
#WORKDIR /srv/app
## Installing 
RUN \
    sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y build-essential && \
    apt-get install -y software-properties-common && \
    apt-get install -y byobu curl git htop man unzip vim wget && \

    ENV HOME /root

    WORKDIR /root
##apt-get update && apt-get install -y \
##git \
##wget



## Make new folder
## GET Artifacts Fivem 
##ARG FIVEM_VER=5848-4f71128ee48b07026d6d7229a60ebc5f40f2b9db
##RUN wget https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/${FIVEM_VER}/fx.tar.xz

## Open Port 
EXPOSE 30120 

#Default to an empty CMD, so We can use it to add seperate args to the binary
CMD [""]