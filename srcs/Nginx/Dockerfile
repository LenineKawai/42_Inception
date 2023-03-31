# FROM: from the base image
# RUN: launches the commands (update, installation of nginx pe)
# ENV: define env variables
# EXPOSE: exhibits container ports
# VOLUME: definition of volumes
# COPY: copy elements between host and container
# ENTRYPOINT: master process

FROM        debian:latest

RUN         sudo apt-get -y update && sudo apt-get -y upgrade && sudo apt-get install nginx

RUN         docker run --name mynginx1 -p 80:80 -d nginx