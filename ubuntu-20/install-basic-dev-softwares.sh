#!/bin/bash

sudo apt install -y terminator
sudo apt install -y git git-gui gitk

sudo apt install -y python3-pip
sudo -H pip3 install --upgrade pip
sudo pip3 install virtualenv

#for backward compatibility with some older projects which are not compatible with python3
sudo apt -y install python2

sudo apt install -y curl
sudo apt install -y php7.4 php7.4-dev php7.4-curl
sudo apt install -y openjdk-8-jdk
sudo apt install -y openjdk-11-jdk
sudo apt install -y ruby
sudo apt install -y alacarte


# MongoDB 3.6
# require custom installation for libssl1.0.0 which is last available by default on ubuntu 18.04
# https://docs.mongodb.com/v3.6/tutorial/install-mongodb-on-ubuntu/
echo "deb http://security.ubuntu.com/ubuntu bionic-security main" | sudo tee /etc/apt/sources.list.d/bionic.list
wget -qO - https://www.mongodb.org/static/pgp/server-3.6.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.6 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.6.list
sudo apt update
sudo apt install -y libssl1.0.0
sudo apt install -y mongodb-org
