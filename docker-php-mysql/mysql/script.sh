#!/usr/bin/env
echo "Login to docker hub"
docker login

echo "Build the mysql"
docker build -t kinbi/mysql:1.0 .

echo "push the image"
docker push kinbi/mysql-app:1.0
