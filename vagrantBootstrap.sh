#!/bin/sh

mkdir build

sudo apt-get update

# install curl
sudo apt-get -y install curl

# and the latest nodejs
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs

# install the other stuff I want on this box
sudo apt-get -y install gcc make git git-core

# and ruby stuff
sudo apt-get -y install zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

sudo apt-get -y install rbenv

git clone https://github.com/rbenv/rbenv.git ~/.rbenv
cd ~/.rbenv && src/configure && make -C src
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> /etc/profile
echo 'eval "$(rbenv init -)"' >> /etc/profile

git clone https://github.com/rbenv/ruby-build.git
cd ruby-build
./install.sh
exec $SHELL

rbenv install 2.3.1
rbenv global 2.3.1
rbenv rehash

echo "gem: --no-ri --no-rdoc" > ~/.gemrc
sudo gem install bundler

# install jekyll, too
sudo gem install jekyll
