#!/bin/sh
touch $MYSQL_PASSWORD;
mysql_install_db --user=mysql --datadir=/var/lib/mysql;
touch $DATABASE_NAME;
/usr/bin/mysqld --user=mysql  --bootstrap << EOF
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;
USE $DATABASE_NAME;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $DATABASE_NAME TO '$MYSQL_USER'@'%';
FLUSH PRIVILEGES;
EOF

touch ouiouoi;
/usr/bin/mysqld;
