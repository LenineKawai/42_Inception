
DOCKER_COMPOSE :=  docker-compose -f srcs/docker-compose.yml


all:
	mkdir -p /home/$(USER)/data/mariadb
	mkdir -p /home/$(USER)/data/wordpress
	$(DOCKER_COMPOSE) up -d --build

up:
	$(DOCKER_COMPOSE) up -d --build
# create containers, network, volumes and images
# -d ->detach run cointainers in the background, up usualy stop container once the cmd is executed /// --build -> builds image before starting containers

restart:
	$(DOCKER_COMPOSE) restart

stop:
	$(DOCKER_COMPOSE) stop
#well

down:
	$(DOCKER_COMPOSE) down --rmi all --volumes --remove-orphans

clean: down

fclean: clean
	sudo rm -rf /home/$(USER)/data/*

prune:	fclean
		sudo docker system prune -f -a

re: fclean all

.PHONY: all up build start restart stop down ps images volume clean fclean prune re 