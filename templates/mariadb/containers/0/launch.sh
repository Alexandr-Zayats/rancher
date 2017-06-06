#!/bin/bash
 
/usr/sbin/mysqld --basedir=/usr --datadir=/var/lib/mysql --plugin-dir=/usr/lib/mysql/plugin --user=mysql --skip-log-error --pid-file=/var/run/mysqld/mysqld.pid --socket=/var/run/mysqld/mysqld.sock --port=3306 &

mysql -uroot -p${MYSQL_ROOT_PASSWORD} -e \
    "CREATE DATABASE IF NOT EXISTS wordpress;"
#Checking if there is any file for restoring the DB dump
if [[ -n /dbdump/wordpress.sql ]]
then
    if [[ -f /dbdump/wordpress.sql ]]
    then
        echo "Checking if there is any file for restoring the DB dump"
        mysql -uroot -p${MYSQL_ROOT_PASSWORD} wordpress < /dbdump/wordpress.sql
        if [[ $? -eq 0 ]]
        then
          rm -f /dbdump/wordpress.sql #So that we dont accidentally dump again
        fi
    else
        echo >&2 "The dump file does not exist."
        exit 2
    fi
fi 
kill -9 $(cat /var/run/mysqld/mysqld.pid)
/usr/bin/mysqld_safe
