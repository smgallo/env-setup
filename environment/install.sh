#!/bin/bash

log_message "** Installing environment files"

backup_file $HOME/.bash_init_env
backup_file $HOME/.zsh_init_env
backup_file $HOME/.bashrc
backup_file $HOME/.zshenv

if [ ! -f $HOME/.bash_init_env ]; then
    cat <<'ENV' >>$HOME/.bashrc

# Read environment files

if [ -f $HOME/.bash_init_env ]; then
    . $HOME/.bash_init_env
fi
ENV
fi

if [ ! -f $HOME/.zsh_init_env && -f $HOME/.zshenv ]; then
    cat <<'ZSHENV' >>$HOME/.zshenv

# Read environment files

if [ -f $HOME/.zsh_init_env ]; then
    . $HOME/.zsh_init_env
fi
ZSHENV
fi

# The OSX terminal app sources .bash_profile rather than .bashrc

if [ "Darwin" = `uname` ]; then
    backup_file $HOME/.bash_profile
    cat <<'DARWIN' >>$HOME/.bash_profile
# OSX terminal executes .bash_profile on start
. ~/.bashrc
DARWIN
fi

cp bash_init_env $HOME/.bash_init_env
if [ ! -d $HOME/.environment ]; then
    mkdir $HOME/.environment
fi
cp -a environment/* $HOME/.environment

exit 0
