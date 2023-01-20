mysql_install_db --user=mysql --datadir=/var/lib/mysql
mkdir /run/mysqld && chmod 777 /run/mysqld
mysqld --user=mysql --datadir=/var/lib/mysql &
mysql -u root
FLUSH PRIVILEGES;
GRANT ALL PRIVILEGES ON *.* TO 'test'@'localhost' IDENTIFIED BY 'test';
mysql -u test -p
CREATE DATABASE db_name;




#
mariadbd-safe avec option 