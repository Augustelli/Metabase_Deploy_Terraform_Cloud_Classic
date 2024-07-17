#!/bin/bash
cd /home/ubuntu

sudo apt-get update
sudo apt-get install -y openjdk-21-jre-headless
sudo export MB_DB_TYPE=mysql
sudo export MB_DB_DBNAME=google
sudo export MB_DB_PORT=3306
sudo export MB_DB_USER=root
sudo export MB_DB_PASS=root
sudo export MB_DB_HOST=${db_ip}
sudo wget https://downloads.metabase.com/v0.50.10/metabase.jar
nohup java -jar metabase.jar &