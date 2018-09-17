# Connect to a host using Eternal Terminal with a control channel for iTerm2 integration
# Usage: etmux hostname sessionname

function etmux {
    host=$1
    session=$2
    title="tmux: $2"
    echo -ne "\033]0;$title\007"
    et $host -c "tmux -CC new-session -A -s $session"
}

alias updatedb="/usr/libexec/locate.updatedb"
