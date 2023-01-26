#!/bin/sh
mv wp.config.php /var/www/hmtl/
cd /var/www/html;
wget http://wordpress.org/latest.tar.gz;
tar -xzvf latest.tar.gz;
rm latest.tar.gz;

/usr/sbin/php-fpm7 -F;
