# Useful functions for iTerm2 tmux integration. iTerm2 integration opens a new tab for each tmux
# window.

# Start a local tmux session with control channel or connect to one that
# already exists with the same name

function tstart {
    tmux -CC new-session -A -s $1
}
export -f tstart

# In a new tmux window (iTerm2 tab) rename the window so the tab title is the name of the
# host before ssh-ing to that host..

function tssh {
    host=$1
    tmux renamew $host
    ssh -A $host
}
export -f tssh

# Rename the current tmux window (and iTerm2 tab). Must be executed on the host where tmux is
# running.

function trename {
    # tmux renamew -t current new
    tmux renamew $1
}
export -f trename

# If we have logged via a new tmux tab set our terminal to something useful

if [[ "tmux" = $TERM ]]; then
    export TERM=xterm-256color
    # The trename() function would not properly set the iTerm2 tab title without this
    export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"'
fi
