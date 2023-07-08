CREATE DATABASE mydatabase;
CREATE USER 'myuser'@'%' IDENTIFIED BY 'mypassword';
GRANT ALL PRIVILEGES ON mydatabase.* TO 'myuser'@'%';
FLUSH PRIVILEGES;