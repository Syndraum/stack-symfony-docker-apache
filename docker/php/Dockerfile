# ./docker/php/Dockerfile

FROM php:7.3-apache

ENV PATH_PROJECT /var/www/html

#install libs
RUN apt-get update && \
	apt-get install -y \
	libzip-dev libpng-dev libjpeg-dev zlib1g-dev libicu-dev g++ git vim

RUN apt-get install nodejs npm && npm install -g yarn

# Extension
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install zip 
RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl
RUN docker-php-ext-install exif
RUN docker-php-ext-configure gd --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install gd

RUN git config --global user.email "roms2111@gmail.com" \
	&& git config --global user.name "Syndraum" \
	&& git config --global editor.core "vim"

COPY --from=composer:1 /usr/bin/composer /usr/local/bin/composer

RUN a2enmod rewrite

COPY ./docker/php/000-default.conf /etc/apache2/sites-available/000-default.conf
COPY ./docker/php/my.ini /usr/local/etc/php/conf.d/my.ini

WORKDIR $PATH_PROJECT

RUN PATH=$PATH:$PATH_PROJECT/vendor/bin:bin


