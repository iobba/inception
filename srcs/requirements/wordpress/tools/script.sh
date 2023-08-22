#!/bin/bash

sleep 15

# create directory to use in nginx container later and also to setup the wordpress conf
cd /var/www/html


echo "Wordpress: setting uuuuuuuuup..."
# install the WP-CLI tool
rm /usr/local/bin/wp

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar


chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

# downloading wordpress
wp core download --allow-root

mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

mv /wp-config.php /var/www/html/wp-config.php

# connect with the database
sed -i -r "s/database_name_here/$DB_NAME/1"   wp-config.php
sed -i -r "s/username_here/$DB_USER/1"  wp-config.php
sed -i -r "s/password_here/$DB_PASSWORD/1"    wp-config.php
sed -i -r "s/localhost/mariadb/1"    wp-config.php

chmod +x wp-config.php

echo "Wordpress: start creating the admin..."
#the wordpress site
wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

# the user account
echo "Wordpress: start creating the user..."
wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$DB_PWD --allow-root

echo "Wordpress has been set up! Successfuly!"
 
sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

mkdir /run/php





/usr/sbin/php-fpm7.3 -F
