# ~/.bashrc: exec on interactive shell(bash-specific)
# alias, function, completion

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

echo .bashrc

# ===============================
# Load generic rcfile
# ===============================
if [[ -n "$ENV" && -r $ENV ]]; then
  . $ENV
elif [[ -f ~/.shrc  ]]; then
  . ~/.shrc
elif [[ -f ~/.shinit  ]]; then
  . ~/.shinit
fi


# ===============================
# Completion
# ===============================
# Load bash-completion
if [[ -r /etc/bash_completion ]]; then
  . /etc/bash_completion
elif [[ -r /usr/share/bash-completion/bash_completion ]]; then
  . /usr/share/bash-completion/bash_completion
fi
# Load git-completion
if [[ -r /usr/share/git/completion/git-completion.bash ]]; then
  . /usr/share/git/completion/git-completion.bash
fi


# ===============================
# Alias
# ===============================
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases


# ===============================
# Function
# ===============================
[[ -f ~/.bash_functions ]] && . ~/.bash_functions


# ===============================
# History
# ===============================
HISTCONTROL=ignoreboth
HISTSIZE=50000
HISTFILESIZE=50000
HISTTIMEFORMAT="[%F %T]: "


# ===============================
# Usefull escape sequenses
# ===============================
# text colors
readonly ESC_FG_BLACK=$(  tput setaf 0)
readonly ESC_FG_RED=$(    tput setaf 1)
readonly ESC_FG_GREEN=$(  tput setaf 2)
readonly ESC_FG_YELLOW=$( tput setaf 3)
readonly ESC_FG_BLUE=$(   tput setaf 4)
readonly ESC_FG_MAGENTA=$(tput setaf 5)
readonly ESC_FG_CYAN=$(   tput setaf 6)
readonly ESC_FG_WHITE=$(  tput setaf 7)
# background colors
readonly ESC_BG_BLACK=$(  tput setab 0)
readonly ESC_BG_RED=$(    tput setab 1)
readonly ESC_BG_GREEN=$(  tput setab 2)
readonly ESC_BG_YELLOW=$( tput setab 3)
readonly ESC_BG_BLUE=$(   tput setab 4)
readonly ESC_BG_MAGENTA=$(tput setab 5)
readonly ESC_BG_CYAN=$(   tput setab 6)
readonly ESC_BG_WHITE=$(  tput setab 7)
# attributes
readonly ESC_BOLD=$(      tput bold)
readonly ESC_BRIGHT=$(    tput dim)
readonly ESC_UL=$(        tput smul)
readonly ESC_REV=$(       tput rev)
# turn off all atributes
readonly ESC_SGR0=$(      tput sgr0)


# ===============================
# Prompt
# ===============================
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWCOLORHINTS=true
__git_ps1() {
  PS1="$1$2"
}
# Load git-prompt
if [[ -r /usr/share/git/git-prompt.sh ]]; then
  . /usr/share/git/git-prompt.sh
fi
prompt_command() {
  local ret=$?
  if [ "$ret" -ne 0 ]; then
    echo -en "\a${ESC_BOLD}${ESC_FG_RED}"
    echo -en "-------- exit(\$?) $ret --------"
    echo -e  "${ESC_SGR0}"
  fi
  __git_ps1 \
    "\[${ESC_BOLD}${ESC_FG_GREEN}\][\u@\h\${ESC_FG_WHITE} \W\[\${ESC_FG_GREEN}\]]\[${ESC_SGR0}\]" \
    "\n\D{%H:%M}\[${ESC_BOLD}${ESC_FG_GREEN}\]\$ \[${ESC_SGR0}\]"
}
PROMPT_COMMAND="prompt_command;$PROMPT_COMMAND"


# ===============================
# Shell Options
# ===============================
shopt -s autocd
shopt -s cdspell
shopt -s checkjobs
shopt -s dirspell


if [[ $(uname) == MINGW* ]]; then
  # https://help.github.com/articles/working-with-ssh-key-passphrases/
  env=~/.ssh/agent.env

  agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

  agent_start () {
    (umask 077; ssh-agent >| "$env")
    . "$env" >| /dev/null ;
  }

  agent_load_env

  # agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2= agent not running
  agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

  if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
    agent_start
    ssh-add
  elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
    ssh-add
  fi

  unset env
fi

# better yaourt colors
export YAOURT_COLORS="nb=1:pkg=1:ver=1;32:lver=1;45:installed=1;42:grp=1;34:od=1;41;5:votes=1;44:dsc=0:other=1;35"

if [[ (( -z "${VSCODE_PID}" ) && ( "${TERM_PROGRAM}" != "vscode")) && ( -z "${TMUX}" ) ]]; then
  type -P tmux >/dev/null 2>&1 &&
    tmux
fi


# ===============================
# Bind
# ===============================
if type -P peco >/dev/null ; then
  bind -x '"\C-r": peco-select-history'
  bind -x '"\ep" : peco-buffer'
fi
# vi: et sw=2 sts=2

