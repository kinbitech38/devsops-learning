#  Use apache image as Base
FROM php:8.2-apache
# Install system and required packages
RUN docker-php-ext-install mysqli
# Copy application code into container
COPY . /var/www/html/
# Expose port 80
EXPOSE 80