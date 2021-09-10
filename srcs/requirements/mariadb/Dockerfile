FROM alpine

# Environment vars

ARG MYSQL_USER

ARG MYSQL_DATABASE

ARG MYSQL_PASSWORD

RUN apk update && \
    apk add --no-cache openrc dumb-init && \
    apk add mariadb mariadb-client

COPY tools/my.cnf /etc/my.cnf


RUN mkdir /etc/scripts

COPY /tools/configbase.sql /etc/scripts

# Setup MariaDB

COPY /tools/init_db.sh /

RUN sh init_db.sh

EXPOSE 3306

ENTRYPOINT	["/usr/bin/dumb-init", "--"]

CMD ["mysqld_safe"]