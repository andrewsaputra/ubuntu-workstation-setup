#!/bin/bash

# terraform
wget -O /tmp/terraform11.zip https://releases.hashicorp.com/terraform/0.11.14/terraform_0.11.14_linux_amd64.zip
mkdir -p ~/.terraform/0.11.14
unzip /tmp/terraform11.zip -d ~/.terraform/0.11.14/
sudo ln -s ~/.terraform/0.11.14/terraform /usr/local/bin/terraform


extraPaths=""

# ansible
mkdir ~/.ansible
cd ~/.ansible
virtualenv .
source bin/activate
pip3 install ansible==2.5.8.0
deactivate
extraPaths="$extraPaths:~/.ansible/bin"


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

aws configure
