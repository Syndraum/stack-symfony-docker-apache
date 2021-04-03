FROM debian:buster-slim

RUN apt-get update && apt-get install -y apache2
RUN a2enmod proxy_fcgi ssl rewrite proxy proxy_balancer proxy_http proxy_ajp

COPY ./vhost.conf /etc/apache2/sites-available/000-default.conf

CMD /usr/sbin/apache2ctl -D FOREGROUND -e info