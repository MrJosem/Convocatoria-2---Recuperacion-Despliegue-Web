FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
  apt-get install -y apache2 & \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

EXPOSE 80 443

COPY apache2.conf /etc/apache2/apache2.conf
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
COPY ca.cer /etc/ssl/certs/ca.cer
COPY joseapache.work.gd.key /etc/ssl/private/joseapache.work.gd.key
COPY joseapache.work.gd.cer /etc/ssl/certs/joseapache.work.gd.cer
COPY error404.html /var/www/html

RUN a2ensite my-ssl.conf
RUN a2enmod ssl

CMD [ "usr/sbin/apachectl", "-D", "FOREGROUND" ]