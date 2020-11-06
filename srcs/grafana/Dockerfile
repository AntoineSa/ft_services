# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: asablayr <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/05/28 12:31:40 by asablayr          #+#    #+#              #
#    Updated: 2020/11/06 12:18:09 by asablayr         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine

RUN	apk update
RUN	apk add grafana --repository http://dl-3.alpinelinux.org/alpine/edge/testing/
COPY	telegraf.conf /etc/telegraf/telegraf.conf

ARG	M_IP
ENV	M_IP=$M_IP


WORKDIR	/usr/share/grafana

COPY	grafana_setup.sh .

RUN	chmod 777 ./grafana_setup.sh

ENTRYPOINT	./grafana_setup.sh

EXPOSE	3000
