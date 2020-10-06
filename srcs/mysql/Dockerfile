# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: asablayr <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/05/28 12:31:40 by asablayr          #+#    #+#              #
#    Updated: 2020/10/06 16:04:05 by asablayr         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine

RUN	apk update
RUN 	apk add mysql mysql-client --update --no-cache
RUN	mkdir -p /run/mysqld && rm etc/my.cnf

ENV	DB_NAME='wordpress'
ENV	DB_USER='admin'
ENV	DB_PASSWORD='psswd'

COPY	mysql-setup.sh .
COPY	my.cnf /etc/mysql/
COPY	wordpress.sql .

RUN	chmod 777 mysql-setup.sh

VOLUME	[ "/var/lib/mysql"]

expose	3306

ENTRYPOINT	./mysql-setup.sh
