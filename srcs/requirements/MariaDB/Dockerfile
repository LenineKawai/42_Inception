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
ARG DB_USER_PASSWORD
ARG DDB_ROOT_PASSWORD

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y mariadb-server dumb-init && \
    mkdir -p /var/run/mysql && \
    chown -R mysql:mysql /var/run/mysql


RUN /etc/init.d/mysql start && \
    mysql -u root -e    "CREATE DATABASE IF NOT EXISTS $DB_NAME; \
    ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}'; \
    CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_USER_PASSWORD}'; \
    GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_USER_PASSWORD}'; \
    FLUSH PRIVILEGES;"

COPY ./conf/50-server.cnf ./etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]

CMD ["mysqld", "--bind-address=0.0.0.0"]