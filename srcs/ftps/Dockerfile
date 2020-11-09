FROM	alpine

RUN 	apk update
RUN	apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/

ARG 	M_IP
ENV 	M_IP=$M_IP

RUN 	apk add openssl
RUN 	apk add pure-ftpd --update --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

COPY	ftps_setup.sh .
COPY	telegraf.conf /etc/telegraf/telegraf.conf

RUN	chmod 777 ftps_setup.sh

ENTRYPOINT	./ftps_setup.sh

EXPOSE	21 21000
