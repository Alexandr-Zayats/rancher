#!/usr/bin/env bash

mysql -uroot -p${MYSQL_ROOT_PASSWORD} -h ${MYSQL_HOST} -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE}  CHARACTER SET utf8; \
    GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

case "${ContainerType}" in
service)

    php /var/www/drakeroll.com/bin/console d:s:u --force && \
    php /var/www/drakeroll.com/bin/console d:f:l --append && \
    php /var/www/drakeroll.com/bin/console swagger:export web/public/ -e dev --force && \
    chmod -R 0777 /var/www/drakeroll.com/var/cache/ && \
    chmod -R 0777 /var/www/drakeroll.com/var/logs/ && \
    chmod -R 0777 /var/www/drakeroll.com/web/public/swagger.json && \
    rm -Rf /var/www/drakeroll.com/var/cache/*
    /usr/local/sbin/php-fpm -y /usr/local/etc/php-fpm.conf
    ;;
scheduler)
    cp crontab /etc/cron.d/rolls 
    cp supervisor.conf /etc/supervisor/conf.d/
    supervisord
    ;;
*)
    /bin/true
esac
