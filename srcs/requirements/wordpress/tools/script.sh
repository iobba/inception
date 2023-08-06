#!/bin/bash



# create directory to use in nginx container later and also to setup the wordpress conf
mkdir /var/www/
mkdir /var/www/html

cd /var/www/html


echo "Wordpress: setting uuuuuuuuup..."
# install the WP-CLI tool
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar .

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

# downloading wordpress
wp core download --allow-root

mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

mv /wp-config.php /var/www/html/wp-config.php

chown -R www-data:www-data /var/www/html

find /var/www/html -type d -exec chmod 755 {} \

find /var/www/html -type f -exec chmod 644 {} \

# connect with the database
sed -i -r "s/database_name_here/$db_name/1"   wp-config.php
sed -i -r "s/username_here/$db_user/1"  wp-config.php
sed -i -r "s/password_here/$db_pwd/1"    wp-config.php

echo "Wordpress: start creating users..."
#the wordpress site
wp core install --url=$domain_name/ --title=$wp_title --admin_user=$wp_admin_user --admin_password=$wp_admin_pwd --admin_email=$wp_admin_email --skip-email --allow-root

# the user account
wp user create $wp_user $wp_email --role=author --user_pass=$wp_pwd --allow-root

echo "Wordpress has been set up! Successfuly!"
 
sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

mkdir /run/php





/usr/sbin/php-fpm7.3 -F