# ./docker/php/Dockerfile

FROM php:7.3-apache

COPY src/ /var/www/html/
# ENV PATH_PROJECT /var/www/html

# RUN apt-get update && \
# 	apt-get install -y \
# 	libzip-dev

# RUN docker-php-ext-install pdo_mysql

# RUN docker-php-ext-install zip

# COPY --from=composer:1 /usr/bin/composer /usr/local/bin/composer

# WORKDIR $PATH_PROJECT

# COPY --chown=1000:1000 apps $PATH_PROJECT

# RUN PATH=$PATH:$PATH_PROJECT/vendor/bin:bin

# RUN composer install --no-scripts --prefer-dist \
# 	&& rm -rf "$(composer config cache-dir)" "$(composer config data-dir)"

# CMD bash && tail -f /dev/null
