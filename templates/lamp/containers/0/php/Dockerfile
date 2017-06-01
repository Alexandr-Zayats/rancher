FROM php:7.1-fpm

MAINTAINER Alexandr Zayats <alexandr@zayats.org>

ENV init /lib/systemd/systemd
ENV MYSQL_HOST='db' \
    MYSQL_ROOT_PASSWORD='test' \
    MYSQL_DATABASE='db' \
    MYSQL_USER='test' \
    MYSQL_PASSWORD='test'

RUN apt-get update && apt-get install -y git systemd libpcre3-dev supervisor mysql-client cron vim libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libpng12-dev libpcre3-dev && \
    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install opcache mysqli pdo pdo_mysql gd && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    mkdir -p /var/log/supervisor && \
    mkdir -p /etc/supervisor/conf.d

# Set timezone
RUN echo UTC >/etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata \
    && echo 'date.timezone=UTC' >> /usr/local/etc/php/conf.d/timezone.ini

COPY .build/opcache.ini /usr/local/etc/php/conf.d/opcache.ini
COPY .build/error.ini /usr/local/etc/php/conf.d/errors.ini
COPY .build/www.conf /usr/local/etc/php-fpm.d/www.conf

WORKDIR /var/www/html

ADD start.sh /usr/bin/
RUN chmod +x /usr/bin/start.sh

CMD ["/bin/bash", "/usr/bin/start.sh"]
