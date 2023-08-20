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
RUN wget