#!/bin/bash

# Add 2G of swap memory
fallocate -l 2G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile

# install docker
wget -nv -O - https://get.docker.com/ | sh

apt-get update
apt-get install -y build-essential git


