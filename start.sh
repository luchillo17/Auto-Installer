#!/bin/bash -x
clear
#export DEBIAN_FRONTEND=noninteractive
# Exit on error
set -o errexit

# Here's inverted commilla just in case `

if ![[ rails -v &> /dev/null =~ 'rails' ]]; then
  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
  \curl -sSL https://get.rvm.io | bash -s stable --rails
  source ~/.rvm/scripts/rvm
fi