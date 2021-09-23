FROM alpine:3.14

#installing php7

ARG WP_USER
ARG WP_USER_PASSWORD
ARG WP_ADMIN_PASSWORD
ARG WP_ADMIN
ARG MYSQL_USER
ARG MYSQL_DATABASE
ARG MYSQL_PASSWORD
ARG MYSQL_ROOT_PASSWORD


RUN apk update && \
apk add php php-phar php7-fpm  php7-mcrypt  php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json \
	php7-dom  php7-pdo  php7-zip  php7-mysqli  php7-sqlite3  php7-apcu  php7-pdo_pgsql \
	php7-bcmath  php7-gd   php7-odbc   php7-pdo_mysql  php7-pdo_sqlite   php7-gettext  \
	php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib php7-curl php7-ctype \
	dumb-init wget curl

RUN echo "listen = 9000" >> /etc/php7/php-fpm.d/www.conf

#installing wordpress

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &&\
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp && \
	wp core download --path='/www'

COPY tools/wp-config.php /

RUN rm /www/wp-config-sample.php && mv wp-config.php /www
	# --path='/www' &&\
	# wp core config --dbhost=mariadb:3306 --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD}

# RUN chmod 644 /www/wp-config.php && sleep 10 && wp core install --path=/www --url=hlimouni.42.fr --title="Inception" --admin_name=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=hlimouni@student.1337.ma --skip-email &&\
#  	wp user create $WP_USER wp_user@wordpress.com --path=/www --role=subscriber --user_pass=$WP_USER_PASSWORD



# RUN wget https://wordpress.org/latest.tar.gz \
# 	&& mkdir -p /www \
# 	&& tar -xzf latest.tar.gz --strip-components=1 -C /www \
# 	&& rm -rf *tar.gz 


ENTRYPOINT	["/usr/bin/dumb-init", "--"]

# CMD		["/usr/sbin/php-fpm7", "-F"]
