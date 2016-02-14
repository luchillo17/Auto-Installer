#!/bin/bash -x
clear
#export DEBIAN_FRONTEND=noninteractive
# Exit on error
set -o errexit

# Here's inverted commilla just in case `
if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then
  # First try to load from a user install
  source "$HOME/.rvm/scripts/rvm"
elif [[ -s "/usr/local/rvm/scripts/rvm" ]] ; then
  # Then try to load from a root install
  source "/usr/local/rvm/scripts/rvm"
fi

if ! [[rails -v &> /dev/null =~ 'rails']]; then
  echo 'Installing Rails'
  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
  \curl -sSL https://get.rvm.io | bash -s stable --ruby --rails
fi

if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then
  # First try to load from a user install
  source "$HOME/.rvm/scripts/rvm"
elif [[ -s "/usr/local/rvm/scripts/rvm" ]] ; then
  # Then try to load from a root install
  source "/usr/local/rvm/scripts/rvm"
else
  printf "ERROR: An RVM installation was not found.\n"

fi

ruby_latest = curl 'http://ftp.ruby-lang.org/pub/ruby/' 2> /dev/null | ruby -e "puts STDIN.each_line.map { |x| /ruby-\d\.\d\.\d/.match(x) }.compact.last[0].chomp '/'"

rvm install $ruby_latest --default
# rvm use $ruby_latest
echo "gem: --no-ri --no-rdoc" > ~/.gemrc
gem install bundler
gem update

exit 0