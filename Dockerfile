FROM php:7.4-apache

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Install mysqli
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Copy code (if not using volume)
COPY . /var/www/html

# Set working directory
WORKDIR /var/www/html

# Set permissions for CodeIgniter
RUN chown -R www-data:www-data /var/www/html
