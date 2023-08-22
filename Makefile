all : up

up :  
	@docker-compose -f ./srcs/docker-compose.yml up -d

down : 
	@docker-compose -f ./srcs/docker-compose.yml down
	@rm -rf /home/iobba/data/mariadb/*
	@rm -rf /home/iobba/data/wordpress/*
	@rm -f ./srcs/db.sql

stop : 
	@docker-compose -f ./srcs/docker-compose.yml stop

start : 
	@docker-compose -f ./srcs/docker-compose.yml start

status : 
	@docker ps
