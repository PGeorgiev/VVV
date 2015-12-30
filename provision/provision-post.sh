#!/bin/bash

# TODO: You need to manually add `source` commands to the default .bashrc file in order to load .bashrc, .bash_aliases and .bash_prompt
# That's the best way, so that you don't have to modify any of VVV's tracked files

HOME_DIR="/home/vagrant"
DOTFILES_DIR="$HOME_DIR/dotfiles"

# Enable/disable PHP extensions
sudo php5enmod xdebug
sudo php5enmod imap
sudo service php5-fpm restart

# Setup Dotfiles
if [ ! -d $DOTFILES_DIR ]; then
	git clone https://github.com/iandunn/dotfiles.git $DOTFILES_DIR
else
	git -C $DOTFILES_DIR pull origin master
fi

ln -sf "$DOTFILES_DIR/.gitconfig"        "$HOME_DIR/.gitconfig"
ln -sf "$DOTFILES_DIR/.gitignore_global" "$HOME_DIR/.gitignore_global"

sudo chown -R vagrant:vagrant "$HOME_DIR/.subversion"
cp "$DOTFILES_DIR/.subversion/config" "$HOME_DIR/.subversion/config"
cp "$DOTFILES_DIR/.ssh/config"        "$HOME_DIR/.ssh/config"

# todo what to do about .subversion/servers ? append to existing?

# Install Ubuntu updates
sudo apt-get update
sudo apt-get upgrade --yes
#todo sudo apt-get autoremove ?
