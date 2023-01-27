#!/bin/sh

sleep 10
mv wp-config.php /var/www/html/
cd /var/www/html;
wget http://wordpress.org/latest.tar.gz;
tar -xzvf latest.tar.gz;
rm latest.tar.gz;
chmod 777 wordpress
mv wordpress/* .
#rm -rf wordpress

/usr/sbin/php-fpm7 -F;
