#!/usr/bin/env bash
sudo [ -f /root/.installed ] && exit 0
sudo touch /root/.installed

sudo apt-get update
sudo apt-get install -y git curl tree
sudo apt-get update
sudo apt-get install -y python-software-properties python g++ make
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo add-apt-repository ppa:ondrej/php5-oldstable
sudo apt-get update
sudo apt-get install -y nodejs
sudo apt-get update
sudo apt-get install -y apache2
sudo apt-get install -y php5 libapache2-mod-php5 php5-mcrypt

node -v

sudo apt-get install -y ruby1.9.1 ruby1.9.1-dev \
  rubygems1.9.1 irb1.9.1 ri1.9.1 rdoc1.9.1 \
  build-essential libopenssl-ruby1.9.1 libssl-dev zlib1g-dev

sudo update-alternatives --install /usr/bin/ruby ruby /usr/bin/ruby1.9.1 400 \
         --slave   /usr/share/man/man1/ruby.1.gz ruby.1.gz \
                        /usr/share/man/man1/ruby1.9.1.1.gz \
        --slave   /usr/bin/ri ri /usr/bin/ri1.9.1 \
        --slave   /usr/bin/irb irb /usr/bin/irb1.9.1 \
        --slave   /usr/bin/rdoc rdoc /usr/bin/rdoc1.9.1

sudo update-alternatives --config ruby
sudo update-alternatives --config gem
ruby -v
sudo gem install compass 
sudo npm install -g yo
sudo gem install rhc
cd ~
git clone https://github.com/aurora/rmate.git
cd ~/rmate
sudo mv rmate /usr/local/bin/
cd ~
sudo rm -rf rmate
