# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: asablayr <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/05/28 12:31:40 by asablayr          #+#    #+#              #
#    Updated: 2020/11/07 12:22:14 by asablayr         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine

RUN	apk update
RUN	apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/

RUN	apk add influxdb 

COPY	influxdb_setup.sh .
COPY	telegraf.conf /etc/telegraf/telegraf.conf

RUN	chmod 777 influxdb_setup.sh

ENTRYPOINT	./influxdb_setup.sh

EXPOSE	8086
