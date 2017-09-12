# alpine-mariadb
```
Docker image for MariaDB on Alpine Linux

Usage:
$ docker -d pikado/alpine-mariadb
$ docker -d -e MARIADB_USER=john -e MARIADB_DATABASE=johndb -e MARIADB_PASSWORD=johnpwd -e MARIADB_ROOT_PASSWORD=rootpwd -P pikado/alpine-mariadb

By default MARIADB_ROOT_PASSWORD=admin and for new user (specify in MARIADB_USER variable) the password is "password" (MARIADB_PASSWORD variable)
```