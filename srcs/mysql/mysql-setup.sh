#!/bin/sh

rm -rf /var/cache/apk/* /etc/my.cnf*

mysql_install_db -u root
exec /usr/bin/mysqld -u root --console &
sleep 5

if ! mysql -u root -e 'USE wordpress';
then
	mysql -u root -e 'CREATE DATABASE wordpress;'
	mysql -u root wordpress < wordpress.sql
fi

mysql -u root -e "USE $DB_NAME; CREATE USER 'admin'@'%' IDENTIFIED BY 'psswd'; GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION; USE $DB_NAME; FLUSH PRIVILEGES;"
sleep infinite
