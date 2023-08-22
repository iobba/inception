#!/bin/bash

echo "CREATE DATABASE $DB_NAME;" > db.sql
echo "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';" >> db.sql
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';" >> db.sql
echo "FLUSH PRIVILEGES;" >> db.sql

echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD';" >> db.sql

service mysql start
mysql < db.sql
mysqld
