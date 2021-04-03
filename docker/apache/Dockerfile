FROM debian:buster-slim

RUN apt-get update && apt-get install -y apache2
RUN a2enmod proxy_fcgi

# COPY ./httpd.conf /etc/apache2/sites-available/000-default.conf

CMD /usr/sbin/apache2ctl -D FOREGROUND

# FROM httpd:2.4
# COPY ./httpd.conf /usr/local/apache2/conf/extra/httpd-vhosts.conf

# RUN mkdir -p /var/log/apache2/ \
# 	&& chmod -R 744 /var/log/apache2/

# CMD bash && tail -f /dev/null