#!/usr/bin/env bash

THIS_DIR=$(cd $(dirname $0); pwd)
cd $THIS_DIR

install() {
  sudo add-apt-repository ppa:ubuntu-toolchain-r/test
  sudo apt-get update
  sudo apt-get upgrade
  sudo apt-get dist-upgrade
  sudo ppa-purge
  chmod 777 tg
  RED='\033[0;31m'
  NC='\033[0m'
  CYAN='\033[0;36m'
  echo -e "${RED}Pease Enter You Telegram ID : ${NC}"
  read TLGID
  redis-cli set tabchi:1:fullsudo $TLGID
  echo -e "${CYAN}Installation Completed! Run You Bot With $0 ${NC}"
  exit
}

if [ "$1" = "install" ]; then
  install
else
  if [ ! -f tg ]; then
    echo "tg not found"
    echo "Run $0 install"
    exit
  fi
  ./tg -p tabchi -s tabchi.lua
fi
