FROM	alpine:3.14

RUN 	apk update && \
        apk add nginx dumb-init openssl

RUN     adduser -D -g 'www' www 

RUN     mkdir /www && \
        chown -R www:www /var/lib/nginx 

RUN     chown -R www:www /www

RUN     mkdir -p /etc/nginx/ssl && \
        openssl req -new -newkey rsa:4096 -days 3650 -nodes -x509 -subj "/C=MA/ST=KHOURIBGA/L=KHOURIBGA/O=1337/CN=hlimouni.42.fr" \
        -keyout /etc/nginx/ssl/key.pem -out /etc/nginx/ssl/cert.pem 

COPY	tools/nginx.conf /etc/nginx/nginx.conf 

ENTRYPOINT	["/usr/bin/dumb-init", "--"]

CMD		["nginx", "-g", "daemon off;"]