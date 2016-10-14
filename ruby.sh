#!/bin/bash
#https://gorails.com/setup/ubuntu/16.04
#Instalar ruby
sudo apt-get update
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev
cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo "\n" >> ~/.bashrc
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL
rbenv install 2.3.1
rbenv global 2.3.1
ruby -v
gem install bundler
rbenv rehash
#Configurando git
git config --global color.ui true
read -p "user.name: " username
git config --global user.name "$username"
username=""
read -p "user.email: " useremail
git config --global user.email "$useremail"
ssh-keygen -t rsa -b 4096 -C "$useremail"
useremail=""
echo "Pega el contendido en la web que se abre"
sensible-browser https://github.com/settings/ssh
cat ~/.ssh/id_rsa.pub
echo "Presiona una tecla para continuar" ;read -p ""
ssh -T git@github.com
#Instalar Nodejs
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get install -y nodejs
