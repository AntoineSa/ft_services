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

RUN	apk update && apk add nginx openssh openssl && \
	mkdir -p /run/nginx /etc/ssl/certs /etc/ssl/private && \
	cp /var/lib/nginx/html/index.html /var/www/index.html

#COPY	nginx.conf /etc/nginx/
#COPY	ssl_params.conf etc/nginx/

ENTRYPOINT	cd /etc/ssh && ssh-keygen -A && cd ~ && \
		/usr/sbin/nginx -g 'daemon off;'

EXPOSE	80 443 22
