# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: asablayr <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/05/28 12:31:40 by asablayr          #+#    #+#              #
#    Updated: 2020/10/08 13:13:21 by asablayr         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine

RUN	apk update
RUN	apk add php7 php7-fpm php7-opcache php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session --update --no-cache
RUN 	apk add php-cli php7-opcache php7-gd --update --no-cache
RUN	wget https://wordpress.org/latest.tar.gz
RUN	mkdir -p var/www && mv latest.tar.gz var/www/ && \
	cd var/www/ && tar -xzvf latest.tar.gz && rm -rf latest.tar.gz

COPY	wp-config.php var/www/wordpress

RUN	rm var/www/wordpress/wp-config-sample.php

ENTRYPOINT	php -S 0.0.0.0:5050 -t /var/www/wordpress/

EXPOSE	5050
