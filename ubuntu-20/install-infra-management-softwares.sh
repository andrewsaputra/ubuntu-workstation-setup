#!/bin/bash

# terraform
wget -O /tmp/terraform11.zip https://releases.hashicorp.com/terraform/0.11.14/terraform_0.11.14_linux_amd64.zip
mkdir -p ~/.terraform/0.11.14
unzip /tmp/terraform11.zip -d ~/.terraform/0.11.14/
sudo ln -s ~/.terraform/0.11.14/terraform /usr/local/bin/terraform
sudo gem install terraform_landscape


extraPaths=""


# aws-google-auth
mkdir ~/.aws-google-auth
cd ~/.aws-google-auth
virtualenv .
source bin/activate
pip3 install aws-google-auth
deactivate
extraPaths="$extraPaths:~/.aws-google-auth/bin"


# awsudo
mkdir ~/.awsudo
cd ~/.awsudo
virtualenv .
source bin/activate
pip3 install git+https://github.com/makethunder/awsudo.git
deactivate
extraPaths="$extraPaths:~/.awsudo/bin"


# awscli
mkdir ~/.awscli
cd ~/.awscli
virtualenv .
source bin/activate
pip3 install awscli
deactivate
extraPaths="$extraPaths:~/.awscli/bin"


echo "export PATH=$PATH$extraPaths" >> ~/.bashrc


# install session manager plugin
curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o "/tmp/session-manager-plugin.deb"
sudo dpkg -i /tmp/session-manager-plugin.deb

printf "\nReload terminal or run \"source ~/.bashrc\" to reload environment variables.
After that, run \"aws configure\" to do basic aws configuration\n"
