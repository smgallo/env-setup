alias git-prune-remotes="git remote update origin --prune"
alias git-show-files="git show --pretty='' --name-only"
alias git-php-lint="git status|grep 'modified:' | awk '{print \$2;}' | xargs -I} php -l }"
alias git-phpcs="git status|grep 'modified:' | awk '{print \$2;}' | xargs -I} ~/bin/phpcs --standard=~/src/xdmod/phpcs.xml }"
