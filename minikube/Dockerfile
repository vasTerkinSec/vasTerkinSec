FROM php:7.4-apache

RUN apt-get update && apt-get install -y default-mysql-client
RUN docker-php-ext-install mysqli
RUN mkdir -p /var/www/html
COPY index.php /var/www/html/index.php
