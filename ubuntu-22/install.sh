#!/bin/sh

sudo apt install -y terminator
sudo apt install -y git git-gui gitk

sudo apt install -y python3-pip
sudo -H pip3 install --upgrade pip
sudo pip3 install virtualenv

sudo apt install -y curl
sudo apt install -y alacarte

# Docker
sudo apt install -y docker.io
# https://docs.docker.com/engine/install/linux-postinstall
sudo groupadd docker
sudo usermod -aG docker $USER

# Docker Compose
mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/latest/download/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose

# corretto 17 jdk
wget -O- https://apt.corretto.aws/corretto.key | sudo apt-key add - 
sudo add-apt-repository -y 'deb https://apt.corretto.aws stable main'
sudo apt update
sudo apt install -y java-17-amazon-corretto-jdk

# gradle
wget -O /tmp/gradle.zip https://services.gradle.org/distributions/gradle-8.5-bin.zip
sudo unzip /tmp/gradle.zip -d /opt/gradle
echo 'export PATH="$PATH:/opt/gradle/gradle-8.5/bin"' >> ~/.bash_profile

# terraform
git clone --depth=1 https://github.com/tfutils/tfenv.git ~/.tfenv
echo 'export PATH="$PATH:$HOME/.tfenv/bin"' >> ~/.bash_profile

# awscli v2
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip"
unzip /tmp/awscliv2.zip -d /tmp
sudo /tmp/aws/install --update

# samcli
wget -O /tmp/aws-sam-cli.zip https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip
unzip /tmp/aws-sam-cli.zip -d /tmp/aws-sam-cli
sudo /tmp/aws-sam-cli/install --update

# session manager
curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o "/tmp/session-manager-plugin.deb"
sudo dpkg -i /tmp/session-manager-plugin.deb

# go
wget -O /tmp/golang.tar.gz https://go.dev/dl/go1.21.6.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf /tmp/golang.tar.gz
echo 'export PATH="$PATH:/usr/local/go/bin"' >> ~/.bash_profile

# mongodb
curl -fsSL https://pgp.mongodb.com/server-6.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-6.0.gpg \
   --dearmor
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-6.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list
sudo apt update
sudo apt install -y mongodb-org
sudo systemctl enable mongod
sudo systemctl start mongod

# PostgreSQL : https://www.postgresql.org/download/linux/ubuntu/
sudo sh -c 'echo "deb https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt update
sudo apt install -y postgresql

# Kubernetes
curl -Lo /tmp/kubectl "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install /tmp/kubectl /usr/local/bin/kubectl

curl -Lo /tmp/minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install /tmp/minikube /usr/local/bin/minikube

curl -Lo /tmp/eksctl.tar.gz "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_Linux_amd64.tar.gz"
tar -xzf /tmp/eksctl.tar.gz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin

curl -Lo /tmp/helm.tar.gz "https://get.helm.sh/helm-v3.12.3-linux-amd64.tar.gz"
tar -zxvf /tmp/helm.tar.gz -C /tmp
sudo mv /tmp/linux-amd64/helm /usr/local/bin