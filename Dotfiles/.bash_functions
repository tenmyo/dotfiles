# ~/.bash_functions
echo .bash_functions

function open {
  explorer $(cygpath -w "$1")
}

tmux() {
  if [[ $# == 0 ]] && tmux has-session 2>/dev/null; then
    command tmux attach-session
  else
    command tmux "$@"
  fi
}

# peco
function g {
  local dir="$(ghq list -p | peco)"
  [[ -n "$dir" ]] && cd "$dir"
}
function gh {
  #local dir="$(ghq list | peco | cut -d / -f 2,3)"
  local dir="$(ghq list | peco)"
  [[ -n "$dir" ]] && cd "$(ghq list --exact --full-path $dir)"
}
function peco-select-history() {
  #cmd=$(HISTTIMEFORMAT='' history | sed -e 's/^[ \t]*[0-9]*[ \t]*//' | sort -u | peco --query "${READLINE_LINE}")
  cmd=$(fc -lnr 1 -0 | sed -e 's/^[ \t]*//' | peco --query "${READLINE_LINE}")
  if [[ -n "${cmd}" ]]; then
    READLINE_LINE="${cmd}"
    READLINE_POINT=${#cmd}
  fi
}
function peco-buffer() {
  buf=$(eval "${READLINE_LINE}" | peco)
  if [[ -n "${buf}" ]]; then
    READLINE_LINE="${buf}"
    READLINE_POINT=0
  fi
}

function ptvim() {
  cmd=$(pt $@ | peco | awk -F : '{print "-c " $2 " " $1}')
  if [[ -n "${cmd}" ]]; then
    vim $cmd
  fi
}

# vi: et sw=2 sts=2 syntax=sh

