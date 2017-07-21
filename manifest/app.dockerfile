FROM alpine:3.6

RUN \
  apk update; \
  apk add php7 php7-bcmath php7-common \
  php7-ctype php7-curl php7-dom php7-fileinfo \
  php7-fpm php7-gd php7-iconv php7-intl \ 
  php7-json php7-mbstring php7-mcrypt php7-pdo \
  php7-pdo_mysql php7-openssl php7-session \
  php7-zip

RUN \
  mkdir -p /var/www/html; \
  adduser -s /sbin/nologin -h /var/www/html -H -D php

COPY ./app/www.conf /etc/php7/php-fpm.d/www.conf

WORKDIR /var/www/html

CMD [ "php-fpm7", "--nodaemonize", "-c /etc/php7" ]
