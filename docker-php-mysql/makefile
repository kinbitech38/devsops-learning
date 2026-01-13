build:
     docker network create app-network

test:
    cd mysql && ./script.sh
	cd php &&& ./script.sh

plan:
     docker push -t kinbi/mysql-app:1.0
     docker push -t kinbi/php-app:1.0

clean:
     docker network rm app-network
     docker rm -f mysql-app-test php-app-test
     docker rm -f mysql-app php-app

all: build test push clean 