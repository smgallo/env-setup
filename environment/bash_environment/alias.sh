# Projects
alias p-tas="cd ~/Documents/projects/tas"
alias p-impact="cd /data/projects/grant_search"
alias p-redfly="cd ~/Documents/projects/redfly"
alias p-iitg="cd ~/Documents/projects/suny_iitg_2013"
# Aliases
alias emacs="emacs -geometry 120x70"
alias ls="/bin/ls -FxC"
alias rm="/bin/rm -i"
alias h-wingsadm="ssh wingsadm.acsu.buffalo.edu"
alias h-tgcdb-mirror="ssh 128.205.41.164"
alias h-xalt="ssh 199.109.195.72"
alias h-sciimpact="ssh 199.109.192.233"
alias h-smgallo-cloud-dev="ssh -A 199.109.192.5"
alias h-openxdmod-dev="ssh -A 199.109.192.28"
alias h-redflydev="ssh -A 199.109.193.135"
x()
{
	gnome-terminal --geometry=100x35 -e "ssh -X $1"
}

