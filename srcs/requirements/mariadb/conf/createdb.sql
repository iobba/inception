CREATE DATABASE $mariadb_name;
CREATE USER '$mariadb_user'@'%' IDENTIFIED BY '$mariadb_pwd';
GRANT ALL PRIVILEGES ON $mariadb_name.* TO '$mariadb_user'@'%';  
FLUSH PRIVILEGES;

ALTER USER 'root'@'localhost' IDENTIFIED BY '$new_root_pwd';