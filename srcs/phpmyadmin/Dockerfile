# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: asablayr <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/05/28 12:31:40 by asablayr          #+#    #+#              #
#    Updated: 2020/11/16 12:17:02 by asablayr         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine

RUN	apk update
RUN	apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/

RUN	apk add php7 php7-fpm php7-opcache php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session
RUN	wget https://files.phpmyadmin.net/phpMyAdmin/4.9.2/phpMyAdmin-4.9.2-all-languages.tar.gz && \
	tar -xzvf phpMyAdmin-4.9.2-all-languages.tar.gz
RUN	mkdir -p /www && mv phpMyAdmin-4.9.2-all-languages /www/phpmyadmin && rm -rf phpMyAdmin-4.9.2-all-languages.tar.gz
RUN	ln -s /www/phpmyadmin /www/phpmyadmin/phpmyadmin

COPY	phpmyadmin_setup.sh .
COPY	telegraf.conf /etc/telegraf/telegraf.conf
COPY	config.inc.php /www/phpmyadmin

RUN	chmod 777 phpmyadmin_setup.sh

ENTRYPOINT	./phpmyadmin_setup.sh

EXPOSE	5000
