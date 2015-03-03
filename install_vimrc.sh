#!/bin/bash
# @author Willy Romao
# @version 1.0 02/2015
# @email willyr.goncalves@gmail.com
#

# Faz o clone do repositorio do vundle, o gerenciador de plugins
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# Atualiza este repositorio.
git pull

# Cria o link simbolico do 'vimrc' deste repositorio para o seu home '~/.vimrc'
ln -s $(pwd)/vimrc ~/.vimrc || exit

# Instala todos os plugins utilizados, ignore os erros
vim +:BundleClean +q +q && vim +:BundleInstall +q +q


