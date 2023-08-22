FROM debian:buster

RUN apt update; \
    apt install -y nginx openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx.key \
    -out $CERTS_ \
    -subj "/C=MO/ST=BE/L=1337/O=1337/OU=student/CN=iobba.42.fr"

COPY ./conf/default etc/nginx/sites-enabled/default

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]