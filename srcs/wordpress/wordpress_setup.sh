ADMIN_USER="admin" && ADMIN_PWORD="psswd" && ADMIN_GROUP="admin"
adduser -D $ADMIN_USER
addgroup $ADMIN_USER $ADMIN_GROUP
echo "$ADMIN_USER:$ADMIN_PWORD" | chpasswd
php-fpm7 && /usr/sbin/nginx -g 'daemon off;' 
