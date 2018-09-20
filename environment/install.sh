#!/bin/bash

log_message "** Installing bash environment"

backup_file $HOME/.bash_init_env
backup_file $HOME/.bashrc

if [ ! -f $HOME/.bash_init_env ]; then
    cat <<'ENV' >>$HOME/.bashrc

# Read environment files

if [ -f $HOME/.bash_init_env ]; then
    . $HOME/.bash_init_env
fi
ENV
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
if [ ! -d $HOME/.bash_environment ]; then
    mkdir $HOME/.bash_environment
fi
cp -a bash_environment/* $HOME/.bash_environment

exit 0
