#!/bin/bash

log_message "** Installing oracle config"

make_dir $HOME/.oracle
backup_file $HOME/.oracle/login.sql
cp login.sql $HOME/.oracle
