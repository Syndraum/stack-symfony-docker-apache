NAME = fothe
CONTAINER_NAME = php mysql pma

all: build up

build:
	docker-compose build

up:
	docker-compose up -d --remove-orphans
	docker exec fothe_php_1 sh -c 'composer install'

stop:
	docker stop fothe_php_1 fothe_pma_1 fothe_mysql_1

rm: stop
	docker rm fothe_php_1 fothe_pma_1 fothe_mysql_1

clean:
	docker system prune -a

re: rm all

.PHONY: all build up stop rm clean re