#!/bin/bash

log_message "** Configuring git options"

git config --global user.name "Steve Gallo"
git config --global user.email "smgallo@buffalo.edu"
git config --global credential.helper cache

exit 0
