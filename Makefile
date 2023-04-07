
DOCKER_COMPOSE :=  docker-compose -f srcs/docker-compose.yaml


all: up

up:
	$(DOCKER_COMPOSE) up -d --build
# create containers, network, volumes and images
# -d ->detach run cointainers in the background, up usualy stop container once the cmd is executed /// --build -> builds image before starting containers

build: 
	$(DOCKER_COMPOSE) build
# build builds a docker images from a Dockerfile and a "context", context are found in docker compose files if i'm not mistaken

start:
	$(DOCKER_COMPOSE) start
# start services

restart:
	$(DOCKER_COMPOSE) restart
# restarts all services, stopped and runnings

stop:
	$(DOCKER_COMPOSE) stop
#well

down:
	$(DOCKER_COMPOSE) down --rmi all --volumes --remove-orphans
# removes containers, network, volumes and images created by up
# --rmi -> rempoves all images used by service, not only the ones tagged "local"
# --volunes removed named volumes declared in compose file and anonymous volumes attached to containers
# --remove-orphans remove containers for services not defined in the Compose file.

ps:
	$(DOCKER_COMPOSE) ps
# do as bash ps but with containers
	
images:
	docker images
# The default docker images will show all top level images, their repository and tags, and their size.

volune:
	docker volumes ls
# List all volumes known by docker

clean:
	down

fclean:
	clean
	sudo rm -rf /home/$(USER)/data/wordpress/*
	sudo rm -rf /home/$(USER)/data/mariadb/*

push:
	docker push $(DOCKER_USERNAME)/$(NAME)

prune:	fclean
		sudo docker system prune -f -a

re: fclean all


.PHONY: all up build start restart stop down ps images volume clean fclean prune re 