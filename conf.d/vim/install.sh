#!/bin/bash

log_message "** Installing vim config"

backup_file $HOME/.vimrc
cp vimrc $HOME/.vimrc

make_dir $HOME/.vim
if [ 0 -ne $? ]; then exit 1; fi

# Install a vim plugin manager
# https://github.com/junegunn/vim-plug

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if [ 0 -ne $? ]; then
    log_message "Could not download plugin manager https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    exit 1
fi

# Install the plugins listed in the vimrc file

vim -c 'PlugStatus|q|q'

exit 0
