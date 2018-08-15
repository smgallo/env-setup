#!/bin/bash

log_message "** Installing bin directory"

make_dir $HOME/bin
if [ 0 -ne $? ]; then exit 1; fi

ME=$(basename $0)
for f in `ls -1 | grep -v $ME`; do
    log_message "Installing $HOME/bin/$f"
    if [ -e $HOME/bin/$f ]; then
        backup_file $HOME/bin/$f
    fi
    cp -p $f $HOME/bin
done

exit 0
