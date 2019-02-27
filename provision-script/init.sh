#!/bin/sh

cd /home/vagrant/

sudo apt-get update

mysqlFile=/home/vagrant/pro-mysql.lock
if [ ! -e $mysqlFile ]; then
		sudo apt-get install -y mysql-server
		sudo apt-get install -y libmysqlclient-dev
		sudo mysql < /home/vagrant/provisioner/provisioner.sql
		
		touch $mysqlFile
fi

rubyFile=/home/vagrant/pro-ruby.lock
if [ ! -e $rubyFile ]; then
		git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
		git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
		echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.profile
		echo 'eval "$(rbenv init -)"' >> ~/.profile
		export PATH="$HOME/.rbenv/bin:$PATH"
		eval "$(rbenv init -)"
		sudo apt-get install -y libssl1.0-dev gcc
		rbenv install 2.4.1
		rbenv rehash
		rbenv global 2.4.1

		touch $rubyFile
fi

nodeFile=/home/vagrant/pro-node.lock
if [ ! -e $nodeFile ]; then
		sudo apt-get install -y nodejs npm
		sudo npm cache clean
		sudo npm install n -g
		sudo n stable
		sudo ln -sf /usr/local/bin/node /usr/bin/node
		
		touch $nodeFile
fi

virtuosoFile=/home/vagrant/pro-virtuoso.lock
if [ ! -e $virtuosoFile ]; then
		sudo apt-get install -y autoconf libtool bison flex gperf libssl1.0-dev
		git clone https://github.com/openlink/virtuoso-opensource.git
		cd /home/vagrant/virtuoso-opensource
		git checkout stable/7
		git pull origin stable/7
		sudo ./autogen.sh
		CFLAGS="-O2"
		export CFLAGS
		./configure --prefix=/usr/local/virtuoso
		make
		sudo make install
		cd /home/vagrant/
		echo 'export PATH="/usr/local/virtuoso/bin:$PATH"' >> ~/.profile
		export PATH="/usr/local/virtuoso/bin:$PATH"

	

		touch $virtuosoFile
fi


railsFile=/home/vagrant/pro-rails.lock
if [ ! -e $railsFile ]; then
		sudo apt-get install -y graphviz
		gem install bundler
		gem install rails --version="5.2.1"
		
		touch $railsFile
fi




