#!/bin/sh

# https://github.com/willyrgf/vimfiles

# pre-requisites
needed="vim git ctags curl make"
for b in $(echo "${needed}" | xargs -n 1) ; do
    if ! command -v "${b}" 2> /dev/null; then
        echo "command ${b} is not found"
        exit 1
    fi
done

# copy vimrc's
if ! cp -av rcs/.vimrc* ~/; then
    echo "error on copy the vimrcs to home"
    exit 1
fi

mkdir -p ~/.vim
# copy plugins_settings
if ! cp -av plugins_settings/* ~/.vim/; then
    echo "error on copy the plugins_settings to ~/.vim/"
    exit 1
fi

if ! vim +:PlugInstall +q +q && vim +:VimBootstrapUpdate +q +q; then
    echo "error on install vim plugins"
    exit 1
fi

if ! mkdir -p ~/.vim/backup/; then
    echo "error on create vim backup directory"
    exit 1
fi
