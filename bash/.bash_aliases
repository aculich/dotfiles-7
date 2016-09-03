alias l='ls -hAlF'

alias ..='cd ..'
alias ocd='cd "$OLDPWD"'

alias wcd='cd /var/www/'

# DOCKER
alias dm='docker-machine'
alias dmip='docker-machine ip devbox'
alias denv='docker-machine env devbox --shell bash'

alias dp='docker ps -a'
alias dps='docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Command}}\t{{.Ports}}\t{{.Names}}"'
alias dpa='docker ps -a --format "table {{.ID}}\t{{.Image}}\t{{.Command}}\t{{.Ports}}\t{{.Names}}"'

alias dlo='docker logs'

alias dRmf='docker rm -f'
# alias dRaf='docker rm -f $(docker ps -a -q)'

alias dat=attach_terminal
attach_terminal() { docker exec -it "$1" bash; }

alias dim='docker images'

alias ds='docker start'
alias dS='docker stop'
alias dsa='docker start $(docker ps -a -q)'
alias dSa='docker stop $(docker ps -a -q)'

alias dssh='ssh docker@192.168.99.100'



##################################### GIT #####################################


if [ -f ~/.dotfiles/prezto/modules/git/alias.zsh ]; then
    source ~/.dotfiles/prezto/modules/git/alias.zsh 2> /dev/null
    alias vgp='vi ~/.dotfiles/prezto/modules/git/alias.zsh'
fi 

if [ -f ~/.dotfiles/git/aliases.zsh ]; then
    source ~/.dotfiles/git/aliases.zsh
    alias vgg='vi ~/.dotfiles/git/aliases.zsh'
fi

alias backup='tar -cvzf ~/backups/www.tar.gz /var/www/'

alias up='sudo apt-get update && time sudo apt-get dist-upgrade'

alias sqldump='mysqldump --socket=/home/mysql/mysql.sock --user wordpress --password=raeh3AVaeche wordpress > ~/backups/starfish.sql'

alias sqlstart='sudo service mysql start'

if [ -f ~/.aliases ]; then
    source .aliases
fi
