# alpine-mariadb
Docker image for MariaDB on Alpine Linux
## Usage with docker command:
docker run -d [-e DB_USER=testuser [-e DB_PASS=testpass]] [-e DB_NAME=testdb] pikado/alpine-mariadb

If you don't specify  DB_PASS with DB_USER then you use the default password: password
