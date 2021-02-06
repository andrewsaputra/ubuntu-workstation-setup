#!/bin/bash

sudo apt install -y terminator
sudo apt install -y git git-gui gitk

sudo apt install -y python3-pip
sudo -H pip3 install --upgrade pip
sudo pip3 install virtualenv

sudo apt install -y curl
sudo apt install -y php7.2 php7.2-dev php7.2-curl
sudo apt install -y openjdk-8-jdk
sudo apt install -y openjdk-11-jdk
sudo apt install -y ruby
sudo apt install -y alacarte


# MongoDB 3.6
# https://docs.mongodb.com/v3.6/tutorial/install-mongodb-on-ubuntu/
wget -qO - https://www.mongodb.org/static/pgp/server-3.6.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.6 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.6.list
sudo apt update
sudo apt install -y mongodb-org
