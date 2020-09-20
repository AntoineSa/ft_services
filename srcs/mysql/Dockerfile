# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: asablayr <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/05/28 12:31:40 by asablayr          #+#    #+#              #
#    Updated: 2020/05/28 12:52:09 by asablayr         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine

RUN	apk update
RUN 	apk add mysql mysql-client --update --no-cache
RUN	mkdir -p /run/mysqld

ENV	DB_NAME wordpress
ENV	DB_USER admin
ENV	DB_PASSWORD pass

COPY	mysql-setup.sh .

RUN	chmod 777 mysql-setup.sh

VOLUME	[ "/var/lib/mysql"]

expose	3306

ENTRYPOINT	./mysql-setup.sh
