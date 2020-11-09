# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: asablayr <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/05/28 12:31:40 by asablayr          #+#    #+#              #
#    Updated: 2020/11/07 15:14:06 by asablayr         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine

RUN	apk update
RUN	apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/

ARG	M_IP
ENV	M_IP=$M_IP

COPY	telegraf.conf /etc/telegraf/telegraf.conf
RUN	apk add grafana --repository http://dl-3.alpinelinux.org/alpine/edge/testing/
WORKDIR	/usr/share/grafana

COPY	grafana_setup.sh .
COPY	grafana.db ./data/

RUN	chmod 777 ./grafana_setup.sh

ENTRYPOINT	./grafana_setup.sh

EXPOSE	3000
