#!/bin/bash
#
# Backup files to a remote directory via ssh

function show_help {
    cat<<HELP
Usage $0
    -r <remote_host>
        The destination host
    -d <remote_directory>
        The destination directory on the remote host
    -b <directory_to_backup>
        Multiple -b options may be specified
    -p
        Prompt for encryption password to override the default value
    -x <exclude_pattern>
        Pattern to exclude from backups
    -h
        Display help
HELP
}

REMOTE_HOST=rush
REMOTE_DIR=/projects/ccrstaff/smgallo/dave_backups
BACKUP_DIRS=
PROMPT_FOR_PASSWORD=
EXCLUDE_PATTERNS=
EXCLUDE_FILE=/tmp/tar_exclude
MYFIFO=/tmp/myfifo
# Optionally set a default password
PASSWD=

while getopts "h?r:d:b:x:p" opt; do
    case "$opt" in
        h|\?)
            show_help
            exit 0
            ;;
        b)  BACKUP_DIRS=${BACKUP_DIRS}${BACKUP_DIRS:+" "}$OPTARG
            ;;
        d)  REMOTE_DIR=$OPTARG
            ;;
        p)  PROMPT_FOR_PASSWORD=1
            ;;
        r)  REMOTE_HOST=$OPTARG
            ;;
        x)  EXCLUDE_PATTERNS=${EXCLUDE_PATTERNS}${EXCLUDE_PATTERNS:+"\n"}$OPTARG
            ;;
    esac
done

if [[ -z $REMOTE_HOST ]]; then
    echo "Must specify remote host (-r)"
    exit 1
fi

if [[ -z $REMOTE_DIR ]]; then
    echo "Must specify remote directory (-d)"
    exit 1
fi

if [[ -z $BACKUP_DIRS ]]; then
    echo "Must specify at least one directory to backup (-b)"
    exit 1
fi

if [[ -z $PASSWD || 1 -eq $PROMPT_FOR_PASSWORD ]]; then
    echo -n "Encryption password: "
    read -s PASSWD
    echo
    echo -n "Verify encryption password: "
    read -s VPASSWD
    if [[ $PASSWD != $VPASSWD ]]; then
        echo
        echo "Passwords do not match"
        exit 1
    fi
    echo
fi

if [[ ! -z $EXCLUDE_PATTERNS ]]; then
    echo "Excluding patterns:"
    echo -e $EXCLUDE_PATTERNS
    echo -e $EXCLUDE_PATTERNS > $EXCLUDE_FILE
else
    touch $EXCLUDE_FILE
fi

echo "To extract encrypted files use the backup password provided: gpg -d File.tar.gz.gpg > File.tar.gz"

# Use a fifo to get the password to gpg on FD 3

if [ -e $MYFIFO ]; then
    rm $MYFIFO
fi

mkfifo $MYFIFO
exec 3<> $MYFIFO

# tar and gzip each directory
DATE=`date "+%Y-%m-%d"`
for dir in $BACKUP_DIRS; do
    BACKUPFILE=$(echo $dir | sed 's@^/@@' | tr \/ _)_${DATE}.tar.gz.gpg
    if [ ! -d $dir ]; then
        echo "Backup directory not found: $dir. Skipping."
        continue
    else
        echo "Backing up $dir to $REMOTE_HOST:$REMOTE_DIR/$BACKUPFILE"
    fi

    echo $PASSWD >&3
    tar czf - $dir -X $EXCLUDE_FILE | gpg -c --cipher-algo AES256 --passphrase-fd 3 --batch | ssh -q $REMOTE_HOST "cat - > ${REMOTE_DIR}/${BACKUPFILE}"
done

# Back up dotfiles

cat >$EXCLUDE_FILE<< EXCLUDE
.cache
.Cloudstation
.cloud-ipc-socket
.composer
.dbus
.config
.dropbox
.local/share
.thunderbird
EXCLUDE

BACKUPFILE=dotfiles_${DATE}.tar.gz.gpg
echo "Backing up dotfiles to $REMOTE_HOST:$REMOTE_DIR/$BACKUPFILE"
echo $PASSWD >&3
(cd $HOME && tar czf - -X $EXCLUDE_FILE .??*) \
    | gpg -c --cipher-algo AES256 --passphrase-fd 3 --batch | ssh -q $REMOTE_HOST "cat - > ${REMOTE_DIR}/${BACKUPFILE}"

rm $EXCLUDE_FILE
rm $MYFIFO

exit 1
