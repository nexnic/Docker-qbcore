ARG FIVEM_VER=5884-0db14f1bae27acc2010e8c3a68ac75127bb7e05f

FROM ubuntu:16.04 
RUN apt-get update && apt-get -y upgrade 

### Install GIT
RUN apt-get -y install git

### Install MariaDB
RUN apt-get -y install mariadb-server

### Install Wget 
RUN apt-get -y install wget

### ENV Path 
RUN cd /srv
RUN mkdir projectX
RUN cd /projectX
RUN wget -O- https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/5884-0db14f1bae27acc2010e8c3a68ac75127bb7e05f/fx.tar.xz
