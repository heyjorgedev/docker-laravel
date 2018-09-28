#
# PHP Dependencies
#
FROM shippingdocker/php-composer:latest as vendor
WORKDIR /app

COPY htdocs/composer.json composer.json
COPY htdocs/composer.lock composer.lock

COPY htdocs/database/ database/

RUN composer install \
    --ignore-platform-reqs \
    --no-interaction \
    --no-plugins \
    --no-scripts \
    --prefer-dist

#
# Frontend
#
FROM node:8.11 as frontend

WORKDIR /app
RUN mkdir -p /app/public

COPY htdocs/package.json htdocs/webpack.mix.js /app/
RUN yarn install

COPY htdocs/resources/ /app/resources/
RUN yarn production

#
# Application
#
FROM php:7.2-apache-stretch


RUN apt-get update && apt-get install -y \
      libicu-dev \
      libpq-dev \
      zlib1g-dev \
    && rm -r /var/lib/apt/lists/* \
    && docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd \
    && docker-php-ext-install \
      intl \
      mbstring \
      pcntl \
      pdo_mysql \
      pdo_pgsql \
      pgsql \
      zip \
      opcache

COPY docker/application/laravel.conf /etc/apache2/sites-available/laravel.conf
RUN a2dissite 000-default.conf && a2ensite laravel.conf && a2enmod rewrite

RUN mkdir -p /var/www/html/storage/logs

COPY --from=vendor /app/vendor/ /var/www/html/vendor/
COPY --from=frontend /app/public/js/ /var/www/html/public/js/
COPY --from=frontend /app/public/css/ /var/www/html/public/css/
COPY --from=frontend /app/mix-manifest.json /var/www/html/mix-manifest.json

COPY --chown=www-data:www-data htdocs /var/www/html

# Cache Laravel layers
RUN php artisan view:cache && php artisan config:cache
# RUN php artisan route:cache
