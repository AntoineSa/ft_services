# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: asablayr <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/05/28 12:31:40 by asablayr          #+#    #+#              #
#    Updated: 2020/10/08 13:07:20 by asablayr         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine

RUN	apk add php7 php7-fpm php7-opcache php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session --update --no-cache
RUN	wget https://files.phpmyadmin.net/phpMyAdmin/4.9.2/phpMyAdmin-4.9.2-all-languages.tar.gz && tar -xzvf phpMyAdmin-4.9.2-all-languages.tar.gz
RUN	mkdir -p /www && mv phpMyAdmin-4.9.2-all-languages /www/phpmyadmin && rm -rf phpMyAdmin-4.9.2-all-languages.tar.gz

COPY	phpmyadmin_setup.sh .
COPY	config.inc.php /www/phpmyadmin

RUN	chmod 777 phpmyadmin_setup.sh

ENTRYPOINT	./phpmyadmin_setup.sh

EXPOSE	5000
