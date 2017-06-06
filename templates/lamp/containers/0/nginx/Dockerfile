FROM debian:jessie

MAINTAINER Alexandr Zayats ,alexandr@zayats.org>

RUN apt-get update && apt-get install -y \
    nginx

RUN echo "UTC" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

ADD nginx.conf /etc/nginx/
ADD sites-enabled/sites.conf /etc/nginx/sites-enabled/

RUN rm /etc/nginx/sites-enabled/default
COPY custom.d /etc/nginx/custom.d
COPY conf.d/ /etc/nginx/conf.d/

RUN echo "upstream php-upstream { server php:9000; }" > /etc/nginx/conf.d/upstream.conf

RUN usermod -u 1000 www-data

CMD ["nginx"]

EXPOSE 80
EXPOSE 443

