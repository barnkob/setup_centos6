#!/bin/bash
# Simple setup.sh for configuring CentOS 6.5 for VirtualBox 
# for headless setup. 

# Install emacs, mc, screen
sudo yum -y install emacs mc screen

# Install nvm: node-version manager
# https://github.com/creationix/nvm
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.18.0/install.sh | bash

# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install stable
nvm use stable

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
npm install -g jshint

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo yum -y install rlwrap

# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles_centos6/ ]; then
    mv dotfiles_centos6 dotfiles.old
fi
if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
fi
git clone https://github.com/barnkob/dotfiles_centos6.git

ln -sb dotfiles_centos6/.screenrc .
ln -sb dotfiles_centos6/.bash_profile .
ln -sb dotfiles_centos6/.bashrc .
ln -sb dotfiles_centos6/.bashrc_custom .
ln -sf dotfiles_centos6/.emacs.d .

