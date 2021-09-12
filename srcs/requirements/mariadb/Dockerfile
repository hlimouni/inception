FROM alpine:3.14

# Environment vars

ARG MYSQL_USER

ARG MYSQL_DATABASE

ARG MYSQL_PASSWORD

RUN apk update && \
    apk add --no-cache openrc dumb-init && \
    apk add mariadb mariadb-client expect

COPY tools/my.cnf /etc/my.cnf


RUN mkdir /etc/scripts

COPY /tools/configbase.sql /etc/scripts

# Setup MariaDB

COPY /tools/init_db.sh /

# RUN sh init_db.sh

EXPOSE 3306

ENTRYPOINT	["sh", "init_db.sh"]
# ENTRYPOINT	["/usr/bin/dumb-init", "--"]

CMD ["mysqld_safe"]