# FROM: from the base image
# RUN: launches the commands (update, installation of nginx pe)
# ENV: define env variables
# EXPOSE: exhibits container ports
# VOLUME: definition of volumes
# COPY: copy elements between host and container
# ENTRYPOINT: master process

ARG DB_NAME
ARG DB_USER
ARG DB_PASS
ARG WP_DOMAIN_NAME
ARG WP_SITE_TITLE
ARG WP_ADMIN_USER
ARG WP_ADMIN_MAIL
ARG WP_ADMIN_PASSWORD
ARG WP_USER
ARG WP_USER_EMAIL
ARG WP_USER_PASSWORD



FROM debian:latest

RUN apt-get update && apt-get upgrade -y && apt-get install -y wordpress php php-fpm php-mysql curl less php-mysql php-mysqli mariadb-client

#install the command handling of wordpress (wp cmd)

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

#use wp command to install wordpress
RUN wp core download --path="/var/www/html/wordpress" --allow-root && \
    wp config create --path="/var/www/html/wordpress" --allow-root --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS && \
    wp core install --path="/var/www/html/wordpress" --allow-root --url=$DOMAIN_NAME --title=$WP_SITE_TITLE --admin_user=$WP_ADMIN_USER --admin_email=$WP_ADMIN_MAIL --admin_password=$WP_ADMIN_PASSWORD && \
    wp plugin update --allow-root --all && \
    wp user create --path="/var/www/html/wordpress" --allow-root $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD && \
    chown www-data:www-data /var/www/html/wordpress/wp-content/uploads -R

EXPOSE 9000

COPY ./wp-install-script.sh ./wp-install-script.sh

CMD ["bash", "./wp-install-script.sh"]

# docker build -t mgolinva-wp . && docker run --env-file ../.env --rm -d --name mgolinva-wp -p 443:443 mgolinva-wp
    
