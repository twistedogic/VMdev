#!/bin/bash

sudo [ -f /root/.installed ] && exit 0
sudo touch /root/.installed
sudo aptitude update
sudo apt-get -y install build-essential default-jdk ant python-dev git
sudo git clone https://github.com/floodlight/floodlight.git
sudo bash -c "cd floodlight && ant"


