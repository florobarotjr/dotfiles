#!/usr/bin/env bash

E='\033[1;30m[exists]'
I='\033[1;32m[installed]'
R='\033[0m'

install () {
  if [ -e "$HOME/$2" ]; then
    echo $2 $E$R
    read -q "CONFIRM?Replace existing? (y/n) "
    echo
  fi
  if ([ ! -e "$HOME/$2" ] || [[ $CONFIRM =~ ^[Yy]$ ]]); then
    rm -r $HOME/$2 > /dev/null 2>&1
    ln -s `pwd`/$1 $HOME/$2 && echo $2 $I$R
  fi
  echo
}