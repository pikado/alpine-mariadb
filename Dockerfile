FROM alpine:latest
MAINTAINER Pika Do <pokido99@gmail.com>

# Proxy settings if necessary
# ENV http_proxy=http://proxy:8080
# ENV https_proxy=http://proxy:8080
# ENV no_proxy="127.0.0.1,localhost,.mydomain.com"

# Install MariaDB
RUN apk --no-cache --update add mariadb mariadb-client

ADD run.sh /
EXPOSE 3306 

# Define default command
CMD ["/run.sh"]
