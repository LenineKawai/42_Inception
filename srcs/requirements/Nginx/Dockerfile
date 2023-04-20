# FROM: from the base image
# RUN: launches the commands (update, installation of nginx pe)
# ENV: define env variables
# EXPOSE: exhibits container ports
# VOLUME: definition of volumes
# COPY: copy elements between host and container
# ENTRYPOINT: master process

FROM debian:buster

RUN apt-get update && apt-get -y upgrade && \
    apt-get install -y nginx dumb-init

RUN apt-get install -y openssl
    
RUN rm /etc/nginx/sites-enabled/default

#generate key

RUN openssl req -x509 -newkey rsa:2048 -nodes -subj /C=FR -keyout /etc/ssl/mgolinva.42.fr.key -out /etc/ssl/mgolinva.42.fr.crt

# Copy the custom Nginx configuration file to the container

COPY    ./conf/nginx.conf /etc/nginx/sites-available/mgolinva.42.fr.conf

RUN		ln -s /etc/nginx/sites-available/mgolinva.42.fr.conf /etc/nginx/sites-enabled/mgolinva.42.fr.conf

EXPOSE 443


ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]

CMD ["nginx", "-g", "daemon off;"]