
FROM debian:buster

RUN apt-get update && apt-get upgrade -y && apt-get install -y wordpress php php-fpm php-mysql curl less php-mysql php-mysqli mariadb-client dumb-init


RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

RUN	mkdir -p /var/www/html/wordpress

EXPOSE 9000

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

COPY ./wp-install-script.sh ./wp-install-script.sh

RUN chmod +x wp-install-script.sh

ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]

CMD [ "sh", "./wp-install-script.sh" ]