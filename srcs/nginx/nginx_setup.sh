ADMIN_USER="admin" && ADMIN_PWORD="psswd"
adduser -D $ADMIN_USER
echo "$ADMIN_USER:$ADMIN_PWORD" | chpasswd
cd /etc/ssh && ssh-keygen -A && cd ~
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/CN=$M_IP"
openssl dhparam -dsaparam -out /etc/ssl/certs/dhparam.pem 2048
/usr/sbin/sshd && /usr/sbin/nginx -g 'daemon off;'
