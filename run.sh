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

password_arg="identified by '${DB_PASS:-password}'"
if [ ! -z "$DB_USER" ] && [ ! -z "$DB_NAME" ]; then
mysql -e "create database $DB_NAME"
mysql -e "grant all on ${DB_NAME}.* to ${DB_USER}@'%' $password_arg"
elif [ ! -z "$DB_USER" ]; then
mysql -e "create user ${DB_USER}@'%' $password_arg"
fi

wait $MARIADB_PID 2>/dev/null
