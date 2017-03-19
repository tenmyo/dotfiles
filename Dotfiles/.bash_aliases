alias df='df -h'
alias du='du -h'
alias whence='type -a'                        # where, of a sort
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour

alias ls='ls -hF --color=tty'                  # classify files in colour
alias ll='ls -al'                              # long list
alias la='ls -A'                               # all but . and ..

# Vagrant
alias vu='vagrant up'
alias vr='vagrant reload'
alias vh='vagrant halt'
alias vs='vagrant status'
alias vg='vagrant global-status'
alias vt='vagrant teraterm'
alias vsc='vagrant ssh -c "screen -xRR"'

function open {
	explorer $(cygpath -w "$1")
}

alias down='curl -LO'
alias plist='pacman -Ss'
alias pinst='pacman -S'
alias tolower='tr "[A-Z]" "[a-z]"'
alias toupper='tr "[a-z]" "[A-Z]"'
alias reload='exec $SHELL'
