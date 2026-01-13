#!/usr/bin/env
set -e
set -x

echo " Logging in to Docker Hub..."
docker login

echo "Verify my Image"
docker ls

echo " Building the MySQL image..."
docker build -t kinbi/mysql-app:1.0 .

echo " Tagging the image (latest)..."
docker tag mysql-app:1.0 mysql-app:latest

echo "Verify my Image"
docker ls

echo " Running the container..."
docker run -d --name mysql-app-test --network app-network -p 3306:3306 mysql-app

echo " Pushing images to Docker Hub..."
docker push kinbi/mysql-app:latest

echo " All done! Build, tag, run, and push completed 

