# Use MYSQL image as base
FROM mysql:8.0
# Set MYSQL environment variable
ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=testdb
ENV MYSQL_USER=testuser
ENV MYSQL_PASSWORD=testpass
# Copy application code into container
COPY init.sql /docker-entrypoint-initdb.d/