#!/bin/bash

# ------------------------------------------------------------------------------------------
# Global variables

export VERBOSE=1
export OS=ubuntu
export SRC_DIR=$HOME/src
export LOG_FILE=$0.log

. functions.sh

# ------------------------------------------------------------------------------------------
# Perform the installs

# Get the password up front

sudo -v

# Ensure any necessary files or directories exist

make_dir $SRC_DIR
if [ 0 -ne $? ]; then exit 1; fi

>$LOG_FILE

# Run all install files

find . -name install.sh |
while read installer ; do
    dir=`dirname $installer`
    file=`basename $installer`

    # Only run executable installers

    if [ -x $installer ]; then
        echo "Running installer: $installer"
        ( cd $dir && bash $file ) >>$LOG_FILE 2>&1
    fi

done

exit 0
