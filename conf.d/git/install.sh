#!/bin/bash

log_message "** Configuring git options"

git config --global user.name "Steve Gallo"
git config --global user.email "smgallo@buffalo.edu"
git config --global credential.helper cache

if [ -d $HOME/.bash_environment ]; then
    cp git.sh $HOME/.bash_environment/git.sh
fi

exit 0
