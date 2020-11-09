#!/bin/sh

rm -rf /var/cache/apk/* /etc/my.cnf*

#enable ssl
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/pure-ftpd.pem -out /etc/ssl/private/pure-ftpd.pem -subj "/CN=172.17.0.20"

#create ftp admin user
echo -e "psswd\npsswd" | adduser admin

telegraf &
/usr/sbin/pure-ftpd -Y 2 -p 21000:21000 -P 172.17.0.20 &
sleep infinite
