
NAME = inception

DOCKER_USERNAME = max


all: $(NAME)
	build
	push

build: 
	docker build --tag $(DOCKER_USERNAME)/$(NAME)

push:
	docker push $(DOCKER_USERNAME)/$(NAME)
