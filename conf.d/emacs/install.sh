#!/bin/bash

log_message "** Installing emacs config"

backup_file $HOME/.emacs
cp emacs $HOME/.emacs

clone_git_repo https://github.com/ejmr/php-mode.git
clone_git_repo https://github.com/dholm/tabbar.git
clone_git_repo https://github.com/sellout/emacs-color-theme-solarized.git
