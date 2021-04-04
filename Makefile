NAME = fothe
CONTAINER_NAME = php mysql pma

all: build up

build:
	docker-compose build

up:
	docker-compose up -d --remove-orphans
	docker exec php_symfony sh -c 'composer install --no-scripts --prefer-dist && rm -rf "$(composer config cache-dir)" "$(composer config data-dir)"'

stop:
	docker-compose stop

rm: stop
	docker-compose rm

clean:
	docker-compose down -v

re: rm all

.PHONY: all build up stop rm clean re