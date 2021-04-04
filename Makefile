NAME = fothe
CONTAINER_NAME = php mysql pma

all: build up

build:
	docker-compose build

up:
	docker-compose up -d --remove-orphans
	docker exec php_symfony sh -c 'chown -R 33:33 ./ && composer install --no-scripts --prefer-dist && rm -rf "$(composer config cache-dir)" "$(composer config data-dir)"'

stop:
	docker-compose stop

rm: stop
	docker-compose rm

db_reset:
	sudo rm -rf ./docker/mysql/*

clean:
	docker-compose down

fclean:
	docker-compose down -v

re: rm all

.PHONY: all build up stop rm clean fclean re