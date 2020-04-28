# Bash Environment

- `*_init_env` Checks for executable files in the environment directory and sources them
- `environment` Contains individual sourceable files to modify aspects of the environment

## Tmux Notes

See [tmux.1](http://manpages.ubuntu.com/manpages/xenial/man1/tmux.1.html)

In order for an iTerm2 tab to be set to the title of the tmux pane title the following options may
need to be set in `~/.tmux.conf`

```
set-option -g set-titles on
set-option -g set-titles-string "#T"
set-option -g automatic-rename on
```
