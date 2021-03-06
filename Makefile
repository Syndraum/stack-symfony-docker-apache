NAME = fothe
CONTAINER_NAME = php mysql pma

all: build up

build:
	docker-compose build

up:
	docker-compose up -d --remove-orphans
	docker exec php_symfony sh -c 'mkdir -p var && chown -R 33:33 ./var && composer install --no-scripts --prefer-dist && rm -rf "$(composer config cache-dir)" "$(composer config data-dir)"'
# sudo chown -R $$(whoami):$$(whoami) ./apps

exec:
	docker exec -ti $(c)_symfony bash

stop:
	docker-compose stop

rm: stop
	docker-compose rm

# db_reset:
# 	sudo rm -rf ./docker/mysql/*

clean:
	docker-compose down

fclean:
	docker-compose down -v

re: rm all

.PHONY: all build up exec stop rm clean fclean re