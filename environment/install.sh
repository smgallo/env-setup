#!/bin/bash

log_message "** Installing bash environment"

backup_file $HOME/.bash_init_env
backup_file $HOME/.bashrc

cp bash_init_env $HOME/.bash_init_env
cp -a bash_environment $HOME/.bash_environment

cat <<ENV >>$HOME/.bashrc
if [ -f $HOME/.bash_init_env ]; then
    . $HOME/.bash_init_env
fi
ENV

exit 0
