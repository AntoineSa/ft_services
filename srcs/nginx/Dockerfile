# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: asablayr <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/05/28 12:31:40 by asablayr          #+#    #+#              #
#    Updated: 2020/11/07 12:16:30 by asablayr         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine

RUN	apk update
RUN	apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/

ARG	M_IP
ENV	M_IP=$M_IP

RUN	apk add nginx openssh openssl && \
	mkdir -p /run/nginx /etc/ssl/certs /etc/ssl/private && \
	cp /var/lib/nginx/html/index.html /var/www/index.html

COPY	nginx.conf /etc/nginx/
COPY	ssl_params.conf etc/nginx/
COPY	telegraf.conf /etc/telegraf/telegraf.conf
COPY	nginx_setup.sh .

RUN	chmod 777 nginx_setup.sh

ENTRYPOINT	./nginx_setup.sh

EXPOSE	80 443
