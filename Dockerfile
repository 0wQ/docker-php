FROM php:7.3.5-fpm-alpine3.9
RUN set -xe \
    && apk add --no-cache --virtual .phpize-deps $PHPIZE_DEPS \
    && apk add --no-cache libpng-dev \
    && pecl install -o -f redis  \
    && echo 'extension=redis.so' > /usr/local/etc/php/conf.d/redis.ini \
    && docker-php-ext-install \
        pdo \
        pdo_mysql \
        mysqli \
        mbstring \
        opcache \
        gd \
    && docker-php-source delete \
    && rm -rf /usr/share/php \
    && rm -rf /tmp/* \
    && apk del .phpize-deps \
    && rm -rf /var/cache/apk/*
