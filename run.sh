#!/bin/sh

wait_mysqld_process()
{
while ! netstat -ntl | grep -q :3306; do
sleep 2
done
}

test ! -d /var/lib/mysql/mysql && mysql_install_db --user=mysql
mysqld_safe &
MARIADB_PID=$!
wait_mysqld_process

echo "Set MariaDB root password"
mysql -e "create user root@'%' identified by '${MARIADB_ROOT_PASSWORD:-admin}'"
if [ ! -z "$MARIADB_USER" ] && [ ! -z "$MARIADB_DATABASE" ]; then
echo "Create user and database"
mysql -e "create database $MARIADB_DATABASE"
mysql -e "grant all on ${MARIADB_DATABASE}.* to ${MARIADB_USER}@'%' identified by '${MARIADB_PASSWORD:-password}'"
mysql -e "flush privileges"
elif [ ! -z "$MARIADB_USER" ]; then
echo "Create user"
mysql -e "create user ${MARIADB_USER}@'%' identified by '${MARIADB_PASSWORD:-password}'"
fi

wait $MARIADB_PID 2>/dev/null
