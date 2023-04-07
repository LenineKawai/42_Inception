# FROM: from the base image
# RUN: launches the commands (update, installation of nginx pe)
# ENV: define env variables
# EXPOSE: exhibits container ports
# VOLUME: definition of volumes
# COPY: copy elements between host and container
# ENTRYPOINT: master process

FROM debian:buster

ARG DB_NAME
ARG DB_USER
ARG DB_USER_PSWD
ARG DB_ROOT_PSWD

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y mariadb-server && \
    mkdir -p /var/run/mysql && \
    chown -R mysql:mysql /var/run/mysql && \

RUN service mysql start

RUN mysql -u root -e    "CREATE DATABASE IF NOT EXISTS $DB_NAME; \
                        ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PSWD'; \
                        GRAND ALL PRIVILGEGES $DB_NAME.* TO '$DB_USER'@'localhost' IDENTIFIED BY '$DB_USER_PSWD'; \
                        GRAND ALL PRIVILGEGES $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PSWD'; \
                        FLUSH PRIVILGEGES;"

COPY ./50-server.cnf ./etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

CMD ["mysqld", "--bind-adress=0.0.0.0"]