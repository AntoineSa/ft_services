#!/bin/sh

mysql_install_db -u root
exec /usr/bin/mysqld -u root --console --datadir=./data &
#echo "CREATE DATABASE $DB_NAME;" >> tmp_file
#echo "CREATE USER \'$DB_USER\'@'%' IDENTIFIED BY \'$DB_PASSWORD\';" >> tmp_file
#echo "GRANT ALL ON \'$DB_NAME\' TO \'$DB_USER\'@'%' WITH GRANT OPTION;" >> tmp_file
#echo "USE $DB_NAME;" >> tmp_file
#echo "FLUSH PRIVILEGES;" >> tmp_file
#cat tmp_file
sleep 5
mysql -u root -e "CREATE DATABASE $DB_NAME; CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD'; GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' WITH GRANT OPTION; USE $DB_NAME; FLUSH PRIVILEGES;"
#mysql -u root -e < tmp_file
#rm -f tmp_file
sleep infinite
