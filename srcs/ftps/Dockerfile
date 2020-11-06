FROM alpine

RUN apk update

ARG M_IP
ENV M_IP=$M_IP

RUN apk add openssl
RUN apk add pure-ftpd --update --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted
#RUN apk add telegraf --update --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

#COPY telegraf.conf /etc/telegraf/
COPY ftps_setup.sh .

RUN chmod 777 ftps_setup.sh

ENTRYPOINT ./ftps_setup.sh

EXPOSE 21 21000
