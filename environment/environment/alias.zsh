# Projects
alias p-tas="cd ~/Documents/projects/tas"
# Aliases
alias ls="/bin/ls -FxC"
alias ll="/bin/ls -lFxC"
alias rm="/bin/rm -i"
# Show full command line
alias top="top -c"
# Ignore case unless capitals are present in search
alias less="less -i"
alias gen-ctags="ctags -R -o .tags --exclude=.git --exclude=vendor --exclude=.diff --exclude=logs --fields=+KSn"
# SSH
alias s-xdcdb-backup="ssh -A xdcdb-backup.ccr.xdmod.org"
# OSX
alias updatedb="/usr/libexec/locate.updatedb"
alias gvim="/usr/local/Cellar/macvim/8.1-151/MacVim.app/Contents/MacOS/Vim -g -f"

# Set the window or tab title (zsh)

function settitle {
    echo -ne "\e]1;$1\a"
}
