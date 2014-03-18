#!/bin/bash

packageManager=("$(which apt-get)" "install" "-y")

sudo ${packageManager[@]} vim vim-gtk gvim git

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

git clone https://github.com/willyrgf/vimfiles ~/ || exit

mv ~/gvimrc ~/.gvimrc || exit
mv ~/vimrc ~/.vimrc || exit

vim +:BundleClean +q +q
vim +:BundleInstall +q +q



