#!/bin/sh
mysql_install_db --user=mysql --datadir=/var/lib/mysql
mariadbd-safe --no-watch
mysql --user=root -p$MYSQL_ROOT_PASSWORD -e "
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;
USE $DATABASE_NAME;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $DATABASE_NAME TO '$MYSQL_USER'@'%';
FLUSH PRIVILEGES;
"
mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown
mariadbd-safe
