#!/bin/bash

sudo apt update  -y
sudo apt install -y software-properties-common mariadb-server mariadb-client
sudo sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf
sudo systemctl restart mariadb
sudo systemctl enable mariadb
password=somepassword
sudo mysql -e "CREATE DATABASE test;"
sudo mysql -e "GRANT ALL PRIVILEGES ON test.* TO 'user1'@'%' IDENTIFIED BY '$password';"
sudo mysql -e "flush privileges;"
