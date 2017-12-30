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
  local dir="$(ghq list | peco | cut -d / -f 2,3)"
  [[ -n "$dir" ]] && cd "$(ghq list --exact --full-path $dir)"
}

# vi: et sw=2 sts=2

