FROM alpine:3.14

#installing php7

RUN apk update && \
apk add php7-fpm  php7-mcrypt  php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json \
	php7-dom  php7-pdo  php7-zip  php7-mysqli  php7-sqlite3  php7-apcu  php7-pdo_pgsql \
	php7-bcmath  php7-gd   php7-odbc   php7-pdo_mysql  php7-pdo_sqlite   php7-gettext  \
	php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib php7-curl php7-ctype \
	dumb-init wget

RUN echo "listen = 9000" >> /etc/php7/php-fpm.d/www.conf

#installing wordpress

RUN wget https://wordpress.org/latest.tar.gz \
	&& mkdir -p /www \
	&& tar -xzf latest.tar.gz --strip-components=1 -C /www \
	&& rm -rf *tar.gz 
	#&& chown -R www:www /www/wordpress

COPY tools/wp-config.php /www/wp-config.php

ENTRYPOINT	["/usr/bin/dumb-init", "--"]

CMD		["/usr/sbin/php-fpm7", "-F"]