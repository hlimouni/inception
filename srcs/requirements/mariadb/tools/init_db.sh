#!/bin/sh

openrc
mkdir -p /run/openrc
touch /run/openrc/softlevel
/etc/init.d/mariadb setup
rc-service mariadb start
mysql < /etc/scripts/configbase.sql