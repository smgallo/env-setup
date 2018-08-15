#!/bin/bash

# ------------------------------------------------------------------------------------------
# Global variables

VERBOSE=0
ONLY_LIST=0
ONLY_INSTALLER=

if [ -f functions.sh ]; then
    . ./functions.sh
fi

display_help () {
    cat<<EOF
$0 [-l] [-v] [-h] [-i <name>]
Where
  -l List available installers and their status
  -i <name> Run only the named installer
  -v Verbose mode
  -h Display this help
EOF
exit 0
}

# ------------------------------------------------------------------------------------------
# Global variables

while getopts i:lvh option
do
    case "${option}"
        in
        l) ONLY_LIST=1;;
        i) ONLY_INSTALLER=${OPTARG};;
        v) VERBOSE=1;;
        h) display_help
    esac
done

export VERBOSE
export ONLY_INSTALLER
export ONLY_LIST
export SRC_DIR=$HOME/src
export BIN_DIR=$HOME/bin
export LOG_FILE=$0.log

# ------------------------------------------------------------------------------------------
# Perform the installs

# Get the password up front

# sudo -v

# Ensure any necessary files or directories exist

make_dir $SRC_DIR
if [ 0 -ne $? ]; then exit 1; fi

make_dir $BIN_DIR
if [ 0 -ne $? ]; then exit 1; fi

>$LOG_FILE

# Run all install files

if [[ 1 -eq $VERBOSE ]]; then
    echo "Verbose message can be found in $LOG_FILE"
fi

find . -name install.sh |
while read installer ; do
    dir=`dirname $installer`
    file=`basename $installer`
    name=`basename $dir`
    if [ -x $installer ]; then
        enabled="enabled"
    else
        enabled="not enabled"
    fi

    # Only run executable installers
    # Use git update-index --chmod=+x <file> to preserve execute permissions

    if [ 1 -eq $ONLY_LIST ]; then
        echo "$name ($installer) $enabled"
    elif [ "$enabled" = "enabled" ]; then
        if [ -n "$ONLY_INSTALLER" -a $name = "$ONLY_INSTALLER" -o -z "$ONLY_INSTALLER" ]; then
            echo "Running installer: $name ($installer)"
            ( cd $dir && bash $file ) >>$LOG_FILE 2>&1
        fi
    fi

done

exit 0
