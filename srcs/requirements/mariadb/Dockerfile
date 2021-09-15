FROM alpine:3.14

# Environment vars

ARG MYSQL_USER

ARG MYSQL_DATABASE

ARG MYSQL_PASSWORD

ARG MYSQL_ROOT_PASSWORD

RUN apk update && \
    apk add --no-cache openrc dumb-init && \
    apk add mariadb mariadb-client

COPY tools/my.cnf /etc/my.cnf

RUN openrc &&\
    mkdir -p /run/openrc &&\
    touch /run/openrc/softlevel &&\
    /etc/init.d/mariadb setup &&\
    rc-service mariadb start &&\
    echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql &&\
    echo "CREATE DATABASE $MYSQL_DATABASE;" | mysql &&\
    echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE . * TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql &&\
    echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';FLUSH PRIVILEGES;" | mysql


ENTRYPOINT	["usr/bin/dumb-init", "--"]

CMD ["mysqld_safe"]