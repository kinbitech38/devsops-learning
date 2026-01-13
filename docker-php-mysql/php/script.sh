#!/usr/bin/env

echo " Logging in to Docker Hub..."
docker login

echo "Verify my Image"
docker ls

echo " Building the Docker image..."
docker build -t kinbi/php-app:1.0 .

echo " Tagging the image (latest)..."
docker tag php-app:1.0 php-app:latest

echo " Running the container..."
docker run -d  --name php-app-test --network app-network -p 3306:3306 php-app

echo "Verify my Image"
docker ls

echo " Pushing images to Docker Hub..."
docker push kinbi/php-app:latest

echo " All done! Build, tag, run, and push completed 
