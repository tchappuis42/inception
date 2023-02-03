#!/bin/sh
sleep 10
mv wp-config.php /var/www/html/
mv wordpress/* /var/www/html/
#cd /var/www/html;
#wget http://wordpress.org/latest.tar.gz;
#tar -xzvf latest.tar.gz;
#rm -rf latest.tar.gz
#chmod 777 wordpress
#mv wordpress/* .
rm -rf wordpress/ latest.tar.gz
./usr/sbin/php-fpm7 -F;
