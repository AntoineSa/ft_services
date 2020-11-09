# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: asablayr <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/05/28 12:31:40 by asablayr          #+#    #+#              #
#    Updated: 2020/11/07 12:16:57 by asablayr         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine

RUN	apk update
RUN	apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/

RUN	apk add php7 php7-fpm php7-opcache php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session
RUN 	apk add php-cli php7-cgi php7-gd --update --no-cache
RUN	apk add nginx
RUN	wget https://wordpress.org/latest.tar.gz
RUN	mkdir -p var/www /run/nginx var/run/php run/php && mv latest.tar.gz var/www/ && \
	cd var/www/ && tar -xzvf latest.tar.gz && rm -rf latest.tar.gz

COPY	wp-config.php var/www/wordpress
COPY	nginx.conf etc/nginx/
COPY	wordpress_setup.sh .
COPY	www.conf etc/php7/php-fpm.d/
COPY	telegraf.conf /etc/telegraf/telegraf.conf

RUN	rm var/www/wordpress/wp-config-sample.php && \
	chmod 777 wordpress_setup.sh && \
	chmod 777 /run/php/ && \
	chmod 777 var/run/php

ENTRYPOINT	./wordpress_setup.sh

EXPOSE	5050
