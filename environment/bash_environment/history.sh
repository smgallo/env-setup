# Keep history files on a per-host basis, especially when using a home directory shared
# across multiple hosts.
HISTFILE=$HOME/.bash_history_$HOSTNAME
MYSQL_HISTFILE=$HOME/.mysql_history_$HOSTNAME
