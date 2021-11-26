FROM php:fpm-alpine

RUN apk add --no-cache tzdata

RUN docker-php-ext-configure opcache --enable-opcache \
    && docker-php-ext-install opcache \
    && docker-php-ext-install mysqli

COPY config/opcache.ini $PHP_INI_DIR/conf.d/
