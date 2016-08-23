#!/bin/bash -x
clear

# Get user and password without echoing it.
user=$(whoami)
echo -n 'Sudo Password:'
read -s password

profile=$(gsettings get org.gnome.Terminal.ProfilesList default)
profile=${profile:1:-1} # remove leading and trailing single quotes
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" login-shell true
#export DEBIAN_FRONTEND=noninteractive
# Exit on error
# set -o errexit
#
sudo -k
echo $password | sudo -v -S &> /dev/null

if [[ $? -ne 0 ]]; then
  echo 'Wrong sudo password'
  exit $?
fi

# Here's inverted commilla just in case `
if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then
  # First try to load from a user install
  source "$HOME/.rvm/scripts/rvm"
elif [[ -s "/usr/local/rvm/scripts/rvm" ]] ; then
  # Then try to load from a root install
  source "/usr/local/rvm/scripts/rvm"
fi

type rvm | head -1 | grep -iq 'rvm is a function'
if [[ $? -ne 0 ]]; then
  echo 'Installing Rails'
  echo progress-bar > ~/.curlrc
  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
  echo $password | \curl -sSL https://get.rvm.io | bash -s stable --ruby
fi

if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then
  # First try to load from a user install
  source "$HOME/.rvm/scripts/rvm"
elif [[ -s "/usr/local/rvm/scripts/rvm" ]] ; then
  # Then try to load from a root install
  source "/usr/local/rvm/scripts/rvm"
else
  echo "ERROR: An RVM installation was not found.\n"
  exit 1
fi

ruby_latest=$(curl 'http://ftp.ruby-lang.org/pub/ruby/' 2> /dev/null | ruby -e "puts STDIN.each_line.map { |x| /ruby-\d\.\d\.\d/.match(x) }.compact.last")

rvm install $ruby_latest --default
# rvm use $ruby_latest
gem install bundler
gem install rails -v 5.0.0.1
# gem install rails --pre

gem update
if ! grep -Fxq "gem: --no-ri --no-rdoc" ~/.gemrc; then
  # Reset time pollicy for sudo command
  # sudo -k
  echo $password | sudo -v -S &> /dev/null
  echo "gem: --no-ri --no-rdoc" | sudo -S tee -a ~/.gemrc > /dev/null
fi

exit $?