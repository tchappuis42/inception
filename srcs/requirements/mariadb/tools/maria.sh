mysql_install_db --user=mysql --datadir=/var/lib/mysql
mkdir /run/mysqld && chmod 777 /run/mysqld
mysqld --user=mysql --datadir=/var/lib/mysql &
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;
USE $DATABASE_NAME;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON *$DATABASE_NAME.* TO '$MYSQL_USER'@'%' IDENTIFIED BY 'test';

mariadbd-safe