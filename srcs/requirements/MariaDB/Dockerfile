FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y mariadb-server dumb-init && \
    mkdir -p /var/run/mysql && \
    chown -R mysql:mysql /var/run/mysql


# RUN service mysql start && \
#     mysql -u root -e    "CREATE DATABASE IF NOT EXISTS $DB_NAME; \
#     ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD'; \
#     CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASSWORD'; \
#     GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASSWORD'; \
#     FLUSH PRIVILEGES;"

COPY ./conf/50-server.cnf ./etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./config_script.sh ./config_script.sh

RUN chmod +x config_script.sh

EXPOSE 3306

ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]

CMD [ "./config_script.sh" ]

# CMD ["bash", "./config_script.sh"]