FROM debian:buster

RUN apt-get update && apt-get -y upgrade && \
    apt-get install -y nginx dumb-init

RUN apt-get install -y openssl
    
RUN rm /etc/nginx/sites-enabled/default

RUN openssl req -x509 -newkey rsa:2048 -nodes -subj /C=FR -keyout /etc/ssl/mgolinva.42.fr.key -out /etc/ssl/mgolinva.42.fr.crt

COPY    ./conf/nginx.conf /etc/nginx/sites-available/mgolinva.42.fr.conf

RUN		ln -s /etc/nginx/sites-available/mgolinva.42.fr.conf /etc/nginx/sites-enabled/mgolinva.42.fr.conf

EXPOSE 443


ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]

CMD ["nginx", "-g", "daemon off;"]