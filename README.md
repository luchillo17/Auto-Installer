# Auto-Installers

This repository brings an app that allow you to select installing some packages automatically, mostly for development, also allow to chain multiple installs, so you can select what to install as well as the config options of installation, start installing selected installs and then relax, get a cup of coffee or go to sleep meanwhile.
I recommend using alongside with systemback or similar in your OS just to be careful in case it breaks something.

# Disclaimer

Use with care, i tested in Ubuntu 15.10 but i'm no pro bash scripter, test in Virtual Box before or use Systemback as precaution, i don't make responsible if this breaks something just because you didn't look what it does.

# Instructions

Run `start.sh` and it will ask you for a sudo password, most likely will be the root password.

``` bash
sudo bash start.sh
```
This will set some configs for your terminal as well as install some dependencies listed later in this file, then opens a browser window/tab that allow you to chose what to install as well as the install options for it, if you don't know anything about the configs you can leave the defaults and change later manually.

# Dependencies auto-installed

RVM, ruby, rails and sub-dependencies, also HomeBrew if on OSX.
Take note that RVM use after being installed require the default profile to set the profile config variable for `Run command as a login shell` to true, the start shell set it by default but if you don't want it (i hardly belive you even care about that) you can disable manually, also if using rvm yourself close and open the terminal after installing or source the rvm file with `$HOME/.rvm/scripts/rvm &> /dev/null || /usr/local/rvm/scripts/rvm`. Refer to https://rvm.io/integration/gnome-terminal

## Known issues

Some times the rails install will output some errors, try this:
1. Use `gem install rails -- --use-system-libraries`
2. Check this stack overflow post: [Error with compiling Nokogiri to install Rails](http://stackoverflow.com/questions/27762456/error-with-compiling-nokogiri-to-install-rails)
3. Check this stack overflow post if previous not worked and on OS X: [Error to install Nokogiri on OSX 10.9 Maverick](http://stackoverflow.com/questions/19643153/error-to-install-nokogiri-on-osx-10-9-maverick/19807558#19807558)

# Reset.sh

Use `sudo bash reset.sh` in case you get an error about PATH or something related to RVM, this file will wipe out RVM, you should comment out or delete any lines refering rvm in the files stated at the output of the script and try again the `start.sh`.


# License

In this same folder is the license file, basically released under an MIT license.