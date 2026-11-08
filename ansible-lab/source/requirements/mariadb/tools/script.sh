#!/bin/bash

chown -R mysql:mysql /var/lib/mysql
service mariadb start

until mariadb-admin ping --silent; do
    sleep 1
done

mariadb -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`"

mariadb -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}'"

mariadb -e "GRANT ALL ON ${DB_NAME}.* TO '${DB_USER}'@'%';"

mariadb -e "FLUSH PRIVILEGES;"

mysqladmin shutdown -u root

exec mysqld_safe --bind-address=0.0.0.0 --port=3306 --user=root
