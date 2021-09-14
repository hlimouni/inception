#!/bin/sh

openrc
mkdir -p /run/openrc
touch /run/openrc/softlevel
/etc/init.d/mariadb setup
rc-service mariadb start
# mysql_secure_installation <<EOF

# y
# secret
# secret
# y
# y
# y
# y
# EOF
mysql < /etc/scripts/configbase.sql
# mysql <<EOF
# ALTER USER 'root'@'localhost' IDENTIFIED BY 'new_password';
# EOF
# mysql -e \
# ALTER USER 'root'@'localhost' IDENTIFIED BY 'new_password';
# EOF