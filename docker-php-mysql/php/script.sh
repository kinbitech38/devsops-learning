#!/usr/bin/env
echo "Login to docker hub"
docker login

echo "Build the php"
docker build -t kinbi/php:1.0 .

echo "push the image"
docker push kinbi/php-app:1.0

