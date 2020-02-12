FROM php:7.3-apache

RUN docker-php-ext-install pdo pdo_mysql mysqli

RUN a2enmod rewrite

COPY rest_api.conf /etc/apache2/rest_api.conf
RUN echo "Include /etc/apache2/rest_api.conf" \
    >> /etc/apache2/apache2.conf
