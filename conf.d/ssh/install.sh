#!/bin/bash

log_message "** Installing ssh config"

backup_file $HOME/.ssh/config
cp ssh_config $HOME/.ssh/config
