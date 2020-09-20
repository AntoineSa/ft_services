#!/bin/sh

chown -R mysql:mysql /var/lib/mysql
mysql_install_db --user=mysql > /dev/null
touch tmp_file
echo "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\` CHARACTER SET utf8 COLLATE utf8_general_ci;" >> tmp_file
echo "GRANT ALL ON \`$MYSQL_DATABASE\`.* to '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> tmp_file
echo 'FLUSH PRIVILEGES;' >> tmp_file
echo "USE $MYSQL_DATABASE" >> tmp_file
cat tmp_file
/usr/bin/mysqld --user=$MYSQL_USER --bootstrap --verbose=0 --datadir='./data' < tmp_file
rm -f tmp_file
sleep 5
exec /usr/bin/mysqld --user=mysql --console --datadir='./data'
