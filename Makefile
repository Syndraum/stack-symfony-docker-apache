NAME = fothe
CONTAINER_NAME = php mysql pma

all: build up

build:
	docker-compose build

up:
	docker-compose up -d --remove-orphans

clean:
	docker system prune -a