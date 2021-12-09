#!/bin/bash

sudo apt update -y
sudo apt install net-tools -y
sudo apt install gcc gnupg2 -y
gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
cd ~
\curl -L https://get.rvm.io | bash -s stable
source /usr/local/rvm/scripts/rvm
rvm install 3.0.2
cd /opt
sudo git clone https://github.com/kumcp/db-syncing.git
sudo chown ubuntu. -R db-syncing
cd db-syncing
sudo apt-get install mysql-client libmysqlclient-dev -y
bundle install
sudo apt install nodejs npm -y
sudo npm install --global yarn
bundle exec rake webpacker:install
rails server -b $(ip a s|sed -ne '/127.0.0.1/!{s/^[ \t]*inet[ \t]*\([0-9.]\+\)\/.*$/\1/p}') -p 3000 
