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

RUN	apk update && apk add nginx wget php-cli php-curl php-gd php-intl php-fpm openrc && \
	wget -q -O mkcert https://github.com/FiloSottile/mkcert/releases/download/v1.4.1/mkcert-v1.4.1-linux-amd64 && \
	chmod +x mkcert && mv mkcert /usr/local/bin/
#	mkdir -p etc/nginx/sites-available && mkdir -p etc/nginx/sites-enabled && mkdir -p etc/nginx/snippets

VOLUME	["/sys/fs/cgroup"]

#COPY	./monsite.com /etc/nginx/sites-available/
#COPY	./index.nginx-debian.html /var/www/html/

#RUN	ln -s /etc/nginx/sites-available/monsite.com etc/nginx/sites-enabled/

ENTRYPOINT	mkcert -install && mkcert localhost && \
		mv localhost.pem /etc/ssl/certs/ && \
		mv localhost-key.pem /etc/ssl/private/ && \
		openrc default && \
		rc-service nginx start && \
		bin/sh
