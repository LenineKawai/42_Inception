#!/bin/sh 
cd /var/www/html/wordpress
wp core download --path="/var/www/html/wordpress" --allow-root
wp config create --path="/var/www/html/wordpress" --allow-root --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_ROOT_PASSWORD --dbhost=$DB_HOST --dbprefix=wp_
wp core install --path="/var/www/html/wordpress" --allow-root --url=$WP_DOMAIN_NAME --title=$WP_SITE_TITLE --admin_user=$WP_ADMIN_USER --admin_email=$WP_ADMIN_MAIL --admin_password=$WP_ADMIN_PASSWORD
wp plugin update --allow-root --all
wp user create --path="/var/www/html/wordpress" --allow-root $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD
chown www-data:www-data /var/www/html/wordpress/wp-content/uploads -R
mkdir -p /run/php
php-fpm7.4 -F