# ./docker/php/Dockerfile

FROM php:7.3-apache

ENV PATH_PROJECT /var/www/html

RUN apt-get update && \
	apt-get install -y \
	libzip-dev git vim

RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install zip

RUN git config --global user.email "roms2111@gmail.com" \
	&& git config --global user.name "Syndraum" \
	&& git config --global editor.core "vim"

COPY --from=composer:1 /usr/bin/composer /usr/local/bin/composer

RUN sed -i 's|/var/www/html|/var/www/html/public|g' /etc/apache2/sites-available/000-default.conf

WORKDIR $PATH_PROJECT

RUN PATH=$PATH:$PATH_PROJECT/vendor/bin:bin


