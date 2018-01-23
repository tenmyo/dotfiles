# ~/.bash_aliases
echo .bash_aliases

# confirm
alias cp='cp -i'
alias mv='mv -i'

# human readable
alias df='df -h'
alias du='du -h'
alias free='free -h'
alias grep='grep --color'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias ls='ls --color=auto'

alias ..='cd ..'
alias ...='cd ../..'
alias -- -='cd -'

alias l='ls -F'
alias la='ls -A'
alias ll='ls -A -l --time-style="+%F %T"'

alias whence='type -a'
alias relogin='exec $SHELL -l'
alias re=relogin
alias reload='exec $SHELL'

# use vim
alias vi='vim'
alias view='vim -R'
alias nvim='vim -N -u NONE -i NONE'

# Vagrant
alias vu='vagrant up'
alias vr='vagrant reload'
alias vh='vagrant halt'
alias vs='vagrant status'
alias vg='vagrant global-status'
alias vt='vagrant teraterm'
alias vsc='vagrant ssh -c "screen -xRR"'

alias down='curl -LO'
alias plist='pacman -Ss'
alias pinst='pacman -S'
alias tolower='tr "[A-Z]" "[a-z]"'
alias toupper='tr "[a-z]" "[A-Z]"'

# git
alias gd='git diff'
alias gdw='git diff --color-words'
alias gdc='git diff --cached'
alias sts='git status --short --branch'
alias gt='git log --graph --all --format="%x09%C(cyan bold)%an%Creset%x09%C(yellow)%h%Creset %C(magenta reverse)%d%Creset %s"'
alias glogps='git log -p --stat'
