#!/bin/bash

log_message "** Installing vim config"

backup_file $HOME/.vimrc
cp vimrc $HOME/.vimrc

make_dir $HOME/.vim
if [ 0 -ne $? ]; then exit 1; fi

# Install the Solarized color scheme

clone_git_repo https://github.com/altercation/vim-colors-solarized.git
if [ 0 -eq $? ]; then
    make_dir $HOME/.vim/colors
    cp $SRC_DIR/vim-colors-solarized/colors/solarized.vim $HOME/.vim/colors
fi

# Install a vim add-on manager 

dpkg -l vim-addon-manager >/dev/null
if [ 0 -ne $? ]; then
    sudo apt-get install -y vim-addon-manager
fi

# Install plugins

vim-addon-manager status | grep -i installed | grep -i markdown> /dev/null

if [ 0 -eq $? ]; then
    log_message "Plugin 'markdown' already installed"
else
    clone_git_repo https://github.com/plasticboy/vim-markdown.git
    if [ 0 -eq $? ]; then
        cd $SRC_DIR/vim-markdown
        sudo make install
    fi
    vim-addon-manager install markdown
fi



vim-addon-manager list | grep -i markdown | grep -i gnupg > /dev/null

if [ 0 -eq $? ]; then
    log_message "Plugin 'gnupg' already installed"
else
    # We can copy the plugin to ~/.vim/plugins directly but will use the addon-manager since
    # vim-markdown already does

    clone_git_repo https://github.com/jamessan/vim-gnupg.git
    if [ 0 -eq $? ]; then
        cd $SRC_DIR/vim-gnupg
        sudo install -o root -g root -m 644 plugin/gnupg.vim /usr/share/vim/addons/plugin/gnupg.vim
        sudo sh -c 'cat<<EOF >/usr/share/vim/registry/gnupg.yaml
addon: gnupg
description: "See https://github.com/jamessan/vim-gnupg"
files:
  - plugin/gnupg.vim
EOF
'
    fi

    vim-addon-manager install gnupg

fi

exit 0
