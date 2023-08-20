## ubuntu Server
FROM ubuntu:22.04
## Work Dir 
WORKDIR /usr/src/app
## Installing 
RUN apt-get update && apt-get install -y \
    git \
    wget

## Make new folder
RUN cd srv/

ADD text.txt srv/
## GET Artifacts Fivem 
ARG FIVEM_VER=5848-4f71128ee48b07026d6d7229a60ebc5f40f2b9db
RUN wget https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/${FIVEM_VER}/fx.tar.xz

## Open Port 
EXPOSE 30120 

#Default to an empty CMD, so We can use it to add seperate args to the binary
CMD [""]