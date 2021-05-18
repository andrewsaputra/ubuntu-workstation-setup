#!/bin/bash

# terraform
wget -O /tmp/terraform12.zip https://releases.hashicorp.com/terraform/0.12.31/terraform_0.12.31_linux_amd64.zip
mkdir -p ~/.terraform/0.12.31
unzip /tmp/terraform12.zip -d ~/.terraform/0.12.31/
sudo ln -sf ~/.terraform/0.12.31/terraform /usr/local/bin/terraform

# for backward compatibility with older modules
wget -O /tmp/terraform11.zip https://releases.hashicorp.com/terraform/0.11.15/terraform_0.11.15_linux_amd64.zip
mkdir -p ~/.terraform/0.11.15
unzip /tmp/terraform11.zip -d ~/.terraform/0.11.15/
sudo ln -sf ~/.terraform/0.11.15/terraform /usr/local/bin/terraform11

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
