FROM centos:7

MAINTAINER Alexandr Zayats <alexandr@zayats.org>

RUN yum -y update && yum install -y nginx

RUN echo "UTC" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata 

ADD nginx.conf /etc/nginx/
ADD sites.conf /etc/nginx/sites-available/

RUN ln -s /etc/nginx/sites-available/sites.conf /etc/nginx/sites-enabled/sites.conf
RUN rm /etc/nginx/sites-enabled/default

RUN echo "upstream php-upstream { server php:9000; }" > /etc/nginx/conf.d/upstream.conf

RUN usermod -u 1000 www-data
COPY conf.d/* /etc/nginx/conf.d/
CMD ["nginx"]

WORKDIR /var/www/html
EXPOSE 80
EXPOSE 443
