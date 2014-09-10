#!/bin/bash

#packageManager=("$(which apt-get)" "install" "-y")
#
#sudo ${packageManager[@]} vim vim-gtk git

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

git pull

mv -f vimrc ~/.vimrc || exit

vim +:BundleClean +q +q
vim +:BundleInstall +q +q

