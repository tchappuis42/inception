#!/bin/sh
sleep 10

if [ ! -f /var/www/html/wp-config.php ] ; then
{
	wp core download --allow-root

	mv wordpress/* /var/www/html/
	rm -rf wordpress/ wordpress-6.0-fr_FR.tar.gz
	
	wp config create	--allow-root \
						--dbname=$DATABASE_NAME \
						--dbuser=$MYSQL_USER \
						--dbpass=$MYSQL_PASSWORD \
						--dbhost=$DB_HOST \
						--path='/var/www/html/' >> log.txt
	
	wp core install		--url="tchappui.42.fr" \
						--title="ft_containers" \
						--admin_user=$MYSQL_USER \
						--admin_password=$MYSQL_PASSWORD \
						--admin_email=test@gmail.com \
						--allow-root --path='/var/www/html/' >> log.txt

	wp user create		--allow-root --role=author \
						$USER2_LOGIN $USER2_MAIL --user_pass=$USER2_PASS \
						--path='/var/www/html/' >> /log.txt

#	wp plugin update --all --path='/var/www/html/wordpress' >> log.txt

#	wp theme install oceanwp --activate --path='/var/www/html/wordpress' >> log.txt
}
fi

./usr/sbin/php-fpm8 -F;
