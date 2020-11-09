telegraf &
/usr/sbin/influxd &
sleep 5

if influx -execute "USE influx_db"
then
	influx -execute "CREATE DATABASE influx_db"
	influx -execute "CREATE USER influx_user WITH PASSWORD 'influx_psswd'"
	influx -execute "GRANT ALL ON influx_db TO influx_user"
	influx -execute "USE influx_db"
fi

sleep infinite
