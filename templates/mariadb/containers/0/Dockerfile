FROM wordpress:latest

COPY ./ /var/www/git
RUN chown -R www-data:www-data /var/www/git && \
    chown -R www-data:www-data /var/www/html

WORKDIR /var/www/html

COPY .devops/web/docker-entrypoint.sh /usr/local/bin/

