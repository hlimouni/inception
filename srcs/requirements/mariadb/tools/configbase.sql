CREATE DATABASE $MYSQL_DATABASE;
CREATE USER '$MYSQL_USER'@'%';
SET PASSWORD FOR '$MYSQL_USER'@'%' = password('$MYSQL_PASSWORD');
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
FLUSH PRIVILEGES;