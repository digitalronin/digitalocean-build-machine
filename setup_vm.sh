#!/bin/bash

PACKAGES="
  build-essential
  git
  ruby2.7
  tmux
  neovim
"

main() {
  create_users
  apt-get update
  make_swap
  install_software
}

make_swap() {
  # Add 2G of swap memory
  fallocate -l 2G /swapfile
  chmod 600 /swapfile
  mkswap /swapfile
  swapon /swapfile
}

install_software() {
  # install docker
  wget -nv -O - https://get.docker.com/ | sh

  for package in ${PACKAGES}; do
    apt-get install -y ${package}
  done
}

create_users() {
  local readonly username=david

  useradd -m -U -s /bin/bash -G sudo ${username}
  mkdir /home/${username}/.ssh
  cp /root/.ssh/authorized_keys /home/${username}/.ssh/
  chown -R ${username}:${username} /home/${username}/.ssh
}

main

# set password for 'david' user
