FROM ubuntu:16.04 
RUN apt-get update && apt-get -y upgrade 
RUN apt-get -y install git
RUN apt-get -y install mariadb-server