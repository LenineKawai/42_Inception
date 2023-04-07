# FROM: from the base image
# RUN: launches the commands (update, installation of nginx pe)
# ENV: define env variables
# EXPOSE: exhibits container ports
# VOLUME: definition of volumes
# COPY: copy elements between host and container
# ENTRYPOINT: master process

FROM debian:latest

RUN apt-get update && apt-get upgrade -y &&apt-get install -y wordpress && \
    apt-get install -y php && \
    apt-get install -y php-fpm && \
    apt-get install -y php-mysql && \
# OLD and NEW driver for mysql, seems to be allready present from previous installs, check if needed
    apt-get install -y php-mysql && \ 
    apt-get install -y php-mysqli && \
    apt-get install -y mariadb-client 
#install the command handling of wordpress (wp cmd)
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

#use wp command to install wordpress
RUN wp core download --path="/var/www/html/wordpress" --allow-root && \
    wp config create --dbname=$(DBNAME) --dbuser=$(DBUSER) --dbpass=$(DBPASS) --allow-root && \
    wp de create
