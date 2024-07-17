#!/bin/bash

LOG_FILE="/var/log/db_init.log"

echo "Starting database initialization" >> $LOG_FILE

if ! sudo sed -i '/bind-address/s/127.0.0.1/0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf || ! sudo systemctl restart mysql; then
    echo "Failed to restart MySQL" >> $LOG_FILE
    exit 1
fi

if ! sudo mysql -e "CREATE DATABASE IF NOT EXISTS ${db_name};" || \
   ! sudo mysql -e "GRANT ALL PRIVILEGES ON ${db_name}.* TO '${db_user}'@'%' IDENTIFIED BY '${db_password}';"; then

    echo "Failed to create database or grant privileges" >> $LOG_FILE
    exit 1
fi

sudo mysql -e "FLUSH PRIVILEGES;"

echo "Downloading SQL file..." >> $LOG_FILE
if ! wget --no-check-certificate -O /tmp/google-mobility.sql "${sql_file_url}"; then
    echo "Failed to download SQL file" >> $LOG_FILE
    exit 1
fi

echo "Importing SQL file..." >> $LOG_FILE
if ! mysql -u"${db_user}" -p"${db_password}" "${db_name}" < /tmp/google-mobility.sql 2>>$LOG_FILE; then
    echo "Failed to import SQL file" >> $LOG_FILE
    exit 1
fi
rm /tmp/google-mobility.sql

echo "Database initialization completed successfully" >> $LOG_FILE