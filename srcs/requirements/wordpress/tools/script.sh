#!/bin/bash

sleep 10

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
sed -i -r "s/database_name_here/db2/1"   wp-config.php
sed -i -r "s/username_here/db222/1"  wp-config.php
sed -i -r "s/password_here/db12345/1"    wp-config.php
sed -i -r "s/localhost/mariadb/1"    wp-config.php

chmod +x wp-config.php

echo "Wordpress: start creating the admin..."
#the wordpress site
wp core install --url=iobba.42.fr --title=creative_ai --admin_user=ai_obba --admin_password=123456789 --admin_email=ismail.obba@gmail.com --skip-email --allow-root

# the user account
echo "Wordpress: start creating the user..."
wp user create ioooobba iobba@1337.com --role=author --user_pass=19_75 --allow-root

echo "Wordpress has been set up! Successfuly!"
 
sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

mkdir /run/php





/usr/sbin/php-fpm7.3 -F