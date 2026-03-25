FROM dunglas/frankenphp:1.12.1-php8.5

COPY --from=composer/composer:latest-bin /composer /usr/bin/composer

WORKDIR /app

EXPOSE 80
EXPOSE 443

COPY app/ /app/public/