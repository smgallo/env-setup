#!/bin/bash

REPO_FILE=repo_list.txt

if [ ! -f $REPO_FILE -o -s $REPO_FILE ]; then
    log_message "** No repositories listed in $REPO_FILE"
    exit 0
elif [ -n "$VERBOSE" ]; then
    log_message "** Installing sources from $REPO_FILE"
fi

cat $REPO_FILE |
while read repo; do
    clone_git_repo $repo
done

exit 0
