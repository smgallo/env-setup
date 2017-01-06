#!/bin/bash

# ------------------------------------------------------------------------------------------
# Useful functions

# Backup a file

backup_file () {
    if [ -z "$1" ]; then
        return 1
    fi

    if [ -f $1 ]; then
        if [ -n "$VERBOSE" ]; then
            echo "Backing up $1 to $1-"
        fi
        cp $1 $1-
    fi
    
    return 0
}

# Clone a git repo if it does not already exist

clone_git_repo () {
    if [ -z "$1" ]; then
        return 1
    fi


    repo=$1
    dest=

    if [ ! -z "$2" ]; then
        dest=$2
    else
        dest=`basename $repo | sed 's/.git$//'`
    fi

    if [ -d $SRC_DIR/$dest ]; then
        echo "Repo already exists at $SRC_DIR/$dest, skipping."
        return 1
    fi

    if [ -n "$VERBOSE" ]; then
        echo "Cloning repo $repo"
    fi

    ( cd $SRC_DIR && git clone $repo $dest)
    if [ 0 -ne $? ]; then return 1; fi

    return 0
}

# Create a directory

make_dir () {
    if [ -z "$1" ]; then
        return 1
    fi

    if [ ! -d $1 ]; then
        if [ -n "$VERBOSE" ]; then
            echo "Creating source directory $SRC_DIR"
        fi
        mkdir $1
        if [ 0 -ne $? ]; then return 1; fi
    fi

    return 0
}

# Provide log messages

log_message () {
    if [ -z "$1" ]; then
        return 1
    elif [ -n "$VERBOSE" ]; then
        echo "$1"
    fi
    
    return 0
}

export -f backup_file
export -f clone_git_repo
export -f make_dir
export -f log_message
