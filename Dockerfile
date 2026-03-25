FROM dunglas/frankenphp:1.12.1-php8.5

# Installe les outils nécessaires pour gérer les archives ZIP
RUN apt-get update && \
    apt-get install -y --no-install-recommends unzip p7zip-full && \
    rm -rf /var/lib/apt/lists/*

# Copie Composer
COPY --from=composer/composer:latest-bin /composer /usr/bin/composer

# Installe les extensions PHP nécessaires
RUN install-php-extensions zip

WORKDIR /app

EXPOSE 80
EXPOSE 443

COPY . /app/public/