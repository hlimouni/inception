FROM alpine

# Environment vars

ARG MYSQL_USER

ARG MYSQL_DATABASE

ARG MYSQL_PASSWORD

# Install dependencies

RUN apk update && \
    apk add --no-cache openrc dumb-init && \
    apk add mariadb mariadb-client

# Upload mariadb config

COPY tools/my.cnf /etc/my.cnf

# Config privileges mysql> scripts

RUN mkdir /etc/scripts

COPY /tools/configbase.sql /etc/scripts

# Setup MariaDB

COPY /tools/init_db.sh /

RUN sh init_db.sh

EXPOSE 3306

ENTRYPOINT	["/usr/bin/dumb-init", "--"]

CMD ["mysqld_safe"]