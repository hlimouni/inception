
#!/bin/sh

rc-service mysql start
rc-service mysql stop
/usr/sbin/mysqld -u root