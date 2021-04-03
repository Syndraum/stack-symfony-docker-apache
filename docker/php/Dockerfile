# ./docker/php/Dockerfile

FROM php:7.4-fpm

RUN apt-get update && \
	apt-get install -y \
	libzip-dev

RUN docker-php-ext-install pdo_mysql

RUN docker-php-ext-install zip

COPY --from=composer:1 /usr/bin/composer /usr/local/bin/composer

WORKDIR /usr/src/app

COPY --chown=1000:1000 apps /usr/src/app

RUN PATH=$PATH:/usr/src/app/vendor/bin:bin

RUN composer install --no-scripts --prefer-dist \
	&& rm -rf "$(composer config cache-dir)" "$(composer config data-dir)"
