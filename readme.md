# Environment Setup

This is used to set up a consistend development environment across filesystems and cloud images.

Run `bootstrap.sh`

## Directory Structure

- sources: Misc git repositories to install
- environment: Bash environment files
- conf.d: Subdirectories for various applications and components

## bootstrap.sh

`bootstrap.sh` defines functions, performs initial setup, and finds all executable `install.sh` files and executes them. To disable a particular component, simply set the file to non-executable with `chmod a-x <file>`

Inspired by https://github.com/plessbd/setup
