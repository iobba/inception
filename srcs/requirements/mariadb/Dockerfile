FROM debian:buster

RUN apt update; \
    apt install -y mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/createdb.sh /
RUN chmod +x createdb.sh

CMD [ "/createdb.sh"]
