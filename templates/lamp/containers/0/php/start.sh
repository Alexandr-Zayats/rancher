#!/usr/bin/env bash

mysql -uroot -p${MYSQL_ROOT_PASSWORD} -h ${MYSQL_HOST} -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE}  CHARACTER SET utf8; \
    GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

case "${ContainerType}" in
service)
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
