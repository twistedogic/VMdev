#!/usr/bin/env bash
sudo [ -f /root/.installed ] && exit 0
sudo touch /root/.installed

sudo apt-get update
sudo apt-get install -y git curl tree socat git
sudo apt-get update
cd ~
git clone https://github.com/aurora/rmate.git
cd ~/rmate
sudo mv rmate /usr/local/bin/
cd ~
sudo rm -rf rmate

cd /
git clone https://github.com/openstack-dev/devstack.git
cd /devstack
mv /devstack/samples/local.conf localrc
echo VIRT_DRIVER=docker >> localrc
chmod u+x tools/create-stack-user.sh 
tools/create-stack-user.sh 
chown -R stack:stack /devstack
cd /
git clone https://github.com/dotcloud/openstack-docker.git
su stack
/devstack/tools/docker/install_docker.sh