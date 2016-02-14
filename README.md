# Auto-Installers

This repository brings an app that allow you to select installing some packages automatically, mostly for development, also allow to chain multiple installs, so you can select what to install as well as the config options of installation, start installing selected installs and then relax, get a cup of coffee or go to sleep meanwhile.
I recommend using alongside with systemback or similar in your OS just to be careful in case it breaks something, run with 'sudo bash _file_.sh' .

# Disclaimer

Use with care, i tested in Ubuntu 15.10 but i'm no pro bash scripter, test in Virtual Box before or use Systemback as precaution, i don't make responsible if this breaks something just because you didn't look what it does.

# Instructions

Run with `sudo bash start.sh`, it will set some configs for your terminal as well as install some dependencies listed later in this file, then opens a browser window/tab that allow you to chose what to install as well as the install options for it, if you don't know anything about the configs you can leave the defaults and change later manually.

# Dependencies auto-installed

RVM, ruby, rails and sub-dependencies, also HomeBrew if on OSX.
Take note that RVM use after being installed require the default profile to set the profile config variable for `Run command as a login shell` to true, the start shell set it by default but if you don't want it (i hardly belive you even care about that) you can disable manually, also if using rvm yourself close and open the terminal after installing or source the rvm file with `$HOME/.rvm/scripts/rvm &> /dev/null || /usr/local/rvm/scripts/rvm`. Refer to https://rvm.io/integration/gnome-terminal

# Reset.sh

Use `sudo bash reset.sh` in case you get an error about PATH or something related to RVM, this file will wipe out RVM, you should comment out or delete any lines refering rvm in the files stated at the output of the script and try again the `start.sh`.

# License

In this same folder is the license file, basically released under an MIT license.