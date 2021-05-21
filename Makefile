NAME = fothe
CONTAINER_NAME = php mysql pma

all: build up

build:
	docker-compose build

up:
	docker-compose up -d --remove-orphans
	docker exec php_symfony sh -c 'mkdir -p var && chown -R 33:33 ./var'
	docker exec php_symfony sh -c 'composer install --no-scripts --prefer-dist && rm -rf "$(composer config cache-dir)" "$(composer config data-dir)"'
# docker exec php_symfony sh -c 'yarn install'
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

yarn:
	docker exec php_symfony sh -c 'yarn install'

migration:
	docker exec php_symfony sh -c 'php bin/console doctrine:migration:migrate'

.PHONY: all build up exec stop rm clean fclean re