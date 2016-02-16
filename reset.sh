#!/bin/bash -x
user=$(whoami)
echo -n Password:
read -s password

for x in `gem list --no-versions`; do gem uninstall $x -a -x -I; done

echo 'yes' | rvm implode
gem uninstall rvm

echo $password | sudo -v -S &> /dev/null
sudo rm -rf $HOME/.rvm $HOME/.rvmrc /etc/rvmrc /etc/profile.d/rvm.sh /usr/local/rvm /usr/local/bin/rvm
sudo groupdel rvm
echo "RVM is removed. Please check all .bashrc|.bash_profile|.profile|.zshrc for RVM source lines and delete or comment out if this was a Per-User installation."