#!/bin/bash

# Gerenciador de pacotes, se esta setado no array ele sera usado.
# Sempre use:
# packageManager=("$(which gerenciador)" "arg de instalacao" 
#                   "yes automatico do gerenciador"), exemplos:
# packageManager=("$(which apt-qet)" "install" "-y")
# packageManager=("$(which yum)" "install" "-y")
# packageManager=("$(which zypper)" "install" "-y")
# Ou, packageManager=(""), para que ele nao seja usado.
#
packageManager=("$(which apt-get)" "install" "-y")

sudo ${packageManager[@]} vim vim-gtk gvim git

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

git clone https://github.com/willyrgf/vimfiles ~/


