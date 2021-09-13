#!/bin/sh

openrc
mkdir -p /run/openrc
touch /run/openrc/softlevel
/etc/init.d/mariadb setup
rc-service mariadb start
mysql_secure_installation <<EOF

y
secret
secret
y
y
y
y
EOF
rc-service mariadb restart
mysql < /etc/scripts/configbase.sql
# mysql -sfu root <<EOS
#   UPDATE mysql.user SET Password=PASSWORD('') WHERE User='root';
#   DELETE FROM mysql.user WHERE User='';
#   DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('mariadb');
#   DROP DATABASE IF EXISTS test;
#   DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
#   FLUSH PRIVILEGES;
# EOS

# MYSQL_ROOT_PASSWORD=abcd1234

# SECURE_MYSQL=$(expect -c "
# set timeout 10
# spawn mysql_secure_installation
# expect \"Enter current password for root (enter for none):\"
# send \"\r\"
# expect \"Switch to unix_socket authentication\"
# send \"n\r\"
# expect \"Change the root password?\"
# send \"y\r\"
# expect "New password:"
# send \"$MYSQL_ROOT_PASSWORD\r\"
# expect \"Re-enter new password:\"
# send \"$MYSQL_ROOT_PASSWORD\r\"
# expect \"Remove anonymous users?\"
# send \"y\r\"
# expect \"Disallow root login remotely?\"
# send \"y\r\"
# expect \"Remove test database and access to it?\"
# send \"y\r\"
# expect \"Reload privilege tables now?\"
# send \"y\r\"
# expect eof
# ")

# echo "$SECURE_MYSQL"
