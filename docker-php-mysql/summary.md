# These are what i used for my docker folder when creating a docker LMAP local-hosting for php and mysql 

### The technologies are 
- Docker
- Php
- Mysql
- Apache

### The tools are 
- Docker File
- Docker Image
- Docker Container
- Docker Network

### The commands i ran 
`Mkdir docker-php-mysql` ( to create the php-mysql folder)
`Mkdir docker-php-mysql/mysql && mkdir docker-php-mysql/php` ( to create mysql & php folder )
`Touch docker-php-mysql/mysql/Dockerfile && touch docker-php-mysql/mysql/init.sql` ( to create dockerfile & init.sql file )
`Touch docker-php-mysql/php/Dockerfile && touch docker-php-mysql/php/config.php && touch docker-php-mysql/php/login.php && touch docker-php-mysql/php/index.php` ( to create 4 files )
`Sudo apt install tree` ( to show the tree stucture)
`Docker build -t custom-mysql .` ( to build the docker image )
`Docker run -d \ --name mysql-container \ --network app-network \ -p 3306:3306 \ inti-mysql` ( to run the docker container )
`Docker build -t php-frontend .` ( to build the docker image )
`Docker run -d \ --name php-container \ --network app-network \ -p 8080:80 \ php-frontend` ( to run the docker container )

### The dockerfile i used for mysql
```
 FROM mysql:8.0 ( this is the base image )
 ENV MYSQL_ROOT_PASSWORD=root
 ENV MYSQL_DATABASE=testdb
 ENV MYSQL_USER=testuser
 ENV MYSQL_PASSWORD=testpass ( to set the MYSQL environment variable )
 COPY init.sql /docker-entrypoint-initdb.d/ (to Copy application code into container )
 ```

### The dockerfile i used for php
```
 FROM php:8.2-apache  ( this is the base image )
 RUN docker-php-ext-install mysqli  ( this is what to run) 
 COPY . /var/www/html/ (to Copy application code into container )
 EXPOSE 80 (to expose the port to the host )
```
### The inti.sql file i used
```
USE testdb;
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(50)
 );

 INSERT INTO users (username, password)
 VALUES ('admin', '12345');
 ```

### The config.php file i used
```
<?php
 $host = "mysql-container";  // container name
 $user = "testuser";
 $password = "testpass";
 $db = "testdb";
 $conn = new mysqli($host, $user, $password, $db);
 if ($conn->connect_error) {
  die("Database connection failed");
 }
 ?>
```
### The login.php file i wrote
```
 <?php
 session_start();
 include "config.php";
 if ($_SERVER["REQUEST_METHOD"] == "POST") {
 $username = $_POST["username"];
 $password = $_POST["password"];
 $sql = "SELECT * FROM users WHERE username='$username' AND password='$password'";
 $result = $conn->query($sql);
 if ($result->num_rows == 1) {
  $_SESSION["user"] = $username;
  header("Location: index.php");
   } else {
    echo "Invalid login";
    }
    }
 ?>
    <form method="POST">
    <h2>Login</h2>
    <input name="username" placeholder="Username" required><br><br>
    <input name="password" type="password" placeholder="Password" required><br><br>
    <button type="submit">Login</button>`
    </form>
```
### The index.php file i used
``` 
<?php
 session_start();
 if (!isset($_SESSION["user"])) {
       header("Location: login.php");
        }
 ?>
<h1>Welcome <?php echo $_SESSION["user"]; ?></h1>`
<p>Login successful</p>
```
### I tested the app via localhost URL
```  
http//localhost:8080/login.php (By running this url on any web browers)
 
 Login Credentials
 Username: admin
 Password: 12345 (input this details to verify)

```





