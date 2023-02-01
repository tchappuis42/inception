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
FLUSH PRIVILEGES;"
#touch /var/lib/mysql/$MYSQL_ROOT_PASSWORD
#touch /var/lib/mysql/$DATABASE_NAME
#touch /var/lib/mysql/$MYSQL_USER
#touch /var/lib/mysql/1$MYSQL_PASSWORD

mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown
#mariadbd-safe
