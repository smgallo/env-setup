#!/bin/bash
#
# Compare files in 2 directories. List which files do not exist and which files are
# different.

SOURCE_DIR=$1
DEST_DIR=$2

if [ ! -d $SOURCE_DIR ]; then
    echo "Source directory $SOURCE_DIR does not exist"
    exit 1
elif [ ! -d $DEST_DIR ]; then
    echo "Desintation directory $DEST_DIR does not exist"
    exit 1
fi

for file in $(ls -1 $SOURCE_DIR); do
    DEST_FILE=$DEST_DIR/$file
    SOURCE_FILE=$SOURCE_DIR/$file

    if [ ! -f $DEST_FILE ]; then
        echo "File in source not found in destination: $file"
    else
        diff -q $SOURCE_FILE $DEST_FILE
        if [ $? -ne 0 ]; then
            echo "$SOURCE_FILE"
        fi
    fi
done

exit 0

