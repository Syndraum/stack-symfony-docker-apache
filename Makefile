NAME = fothe
CONTAINER_NAME = php mysql pma

all: build up

build:
	docker-compose build

up:
	docker-compose up -d --remove-orphans
	docker exec php_symfony sh -c 'composer install'

stop:
	docker stop php_symfony pma_symfony mysql_symfony

rm: stop
	docker rm php_symfony pma_symfony mysql_symfony

clean:
	docker system prune -a

re: rm all

.PHONY: all build up stop rm clean re