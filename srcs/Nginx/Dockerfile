# FROM: from the base image
# RUN: launches the commands (update, installation of nginx pe)
# ENV: define env variables
# EXPOSE: exhibits container ports
# VOLUME: definition of volumes
# COPY: copy elements between host and container
# ENTRYPOINT: master process

FROM debian:buster

RUN apt-get update && apt-get -y upgrade && \
    apt-get install -y nginx

RUN apt-get install -y openssl
    
RUN rm /etc/nginx/sites-enabled/default

#generate key

RUN openssl req -x509 -newkey rsa:2048 -nodes -subj /C=FR -keyout /etc/ssl/mgolinva.42.fr.key -out /etc/ssl/mgolinva.42.fr.crt

# Copy the custom Nginx configuration file to the container

COPY    ./conf/nginx.conf /etc/nginx/sites-available/mgolinva.42.fr.conf

RUN		ln -s /etc/nginx/sites-available/mgolinva.42.fr.conf /etc/nginx/sites-enabled/mgolinva.42.fr.conf

# Copy the index.html file to the default web directory

# COPY index.html /var/www/html/

# Expose the default HTTP port

EXPOSE 443

# Start the Nginx server

CMD ["nginx", "-g", "daemon off;"]

#To lauch this container indivudualy
# docker build -t mgolinva-nginx . && docker run --rm -d --name mgolinva-nginx -p 443:443 mgolinva-nginx
