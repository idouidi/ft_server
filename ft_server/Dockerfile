FROM debian:buster

RUN apt-get update && apt-get install -y systemd nginx vim  mariadb-server \
mariadb-client php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli \
php7.3-common php7.3-json php7.3-opcache php7.3-readline php-mbstring wget

RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN wget https://fr.wordpress.org/latest-fr_FR.tar.gz
RUN tar -zxvf latest-fr_FR.tar.gz && tar -zxvf phpMyAdmin-4.9.0.1-all-languages.tar.gz

RUN mv wordpress /var/www/html/wordpress
RUN mv phpMyAdmin-4.9.0.1-all-languages /var/www/html/phpMyAdmin

RUN rm phpMyAdmin-4.9.0.1-all-languages.tar.gz && rm latest-fr_FR.tar.gz
RUN chown -R www-data:www-data /var/www/html/wordpress/
RUN chmod -R 755 /var/www/html/wordpress/
RUN rm var/www/html/index.nginx-debian.html && rm /var/www/html/wordpress/wp-config-sample.php

ADD  ./srcs/init.sh ./
ADD ./srcs/./ssl.sh ./
ADD ./srcs/db ./
RUN rm -rf /var/www/html/phpMyAdmin/config.sample.inc.php
ADD ./srcs/config.inc.php /var/www/html/phpMyAdmin/
ADD ./srcs/default.conf /etc/nginx/sites-available/default
RUN rm -rf /etc/nginx/sites-enabled/default
RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default
ADD ./srcs/wp-config.php ./var/www/html/wordpress/wp-config.php
ADD ./srcs/info.php /usr/share/nginx/html/info.php


CMD bash init.sh && tail -f /dev/null

#################
# creer l'image #
#################
# docker build -t mon_image .

#######################
# lancer le container #
#######################
# docker run -it -p 80:80 -p 443:443 mon_image

###############################
# supprimer toutes les images #
###############################
# docker rmi -f $(docker images -a -q)

#################################
# supprimer tous les containers #
#################################
# docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)

#########################
# entrer dans container #
#########################
# docker exec -it id_container bash

#################################################
# verifiier ler erreur ngninx dans le conatiner #
#################################################
# cat /var/log/nginx/error.log
