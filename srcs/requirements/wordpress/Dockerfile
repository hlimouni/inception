FROM alpine

RUN apk update && \
    apk add php php-mysql php-fpm php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip dumb-init

RUN	echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf

ENTRYPOINT	["/usr/bin/dumb-init", "--"]

CMD		["/usr/sbin/php-fpm7.3", "-F"]