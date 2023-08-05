FROM debian:buster

# update
RUN apt update -y 
#php-fpm and php-mysql
RUN apt install php-fpm php-mysql -y
#curl
RUN apt install curl -y


COPY ./tools/script.sh /
COPY ./tools/wp-config.php /


CMD [ "/script.sh" ]