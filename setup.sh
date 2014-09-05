#!/bin/bash
# Simple setup.sh for configuring CentOS 6.5 for VirtualBox 
# for headless setup. 

# Install emacs, mc, screen
sudo yum -y install emacs mc screen

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

