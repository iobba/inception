# Use Debian Buster as the base image
FROM debian:buster

# Update the package manager
RUN apt-get update -y

# Install MariaDB server
RUN apt-get install mariadb-server -y

# Change bind-address in the configuration file
RUN sed -i 's/bind-address = 127.0.0.1/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

# Start the MySQL service
CMD service mysql start

# Create the database and user, and grant privileges
COPY setup.sql /docker-entrypoint-initdb.d/

# Flush privileges
RUN service mysql restart && mysql -u root < /docker-entrypoint-initdb.d/setup.sql

# Expose the default MariaDB port
EXPOSE 3306