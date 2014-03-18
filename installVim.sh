#!/bin/bash

packageManager=("$(which apt-get)" "install" "-y")

sudo ${packageManager[@]} vim vim-gtk git

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

rm -rf /tmp/vimfiles

git clone https://github.com/willyrgf/vimfiles /tmp/vimfiles || exit

mv -f /tmp/vimfiles/gvimrc ~/.gvimrc || exit
mv -f /tmp/vimfiles/vimrc ~/.vimrc || exit

vim +:BundleClean +q +q
vim +:BundleInstall +q +q



