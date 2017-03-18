export PAGER=less
export LESS='-i -M -R -S -W -z-4'
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline
export LESS_TERMCAP_ue=$'\E[0m'           # end underline

[ -d "${HOME}/.local" ] && \
  export CMAKE_PREFIX_PATH=$HOME/.local:${CMAKE_PREFIX_PATH:=}
[ -d "${HOME}/.local/bin" ] && \
  export PATH="${HOME}/.local/bin:${PATH}"
[ -d "${HOME}/.local/man" ] && \
  export MANPATH="${HOME}/.local/man:${MANPATH}"
[ -d "${HOME}/.local/info" ] && \
  export INFOPATH="${HOME}/.local/info:${INFOPATH}"
[ -d "${HOME}/.local/lib" ] && \
  export LD_LIBRARY_PATH=$HOME/.local/lib:${LD_LIBRARY_PATH:=}
[ -d "${HOME}/.local/lib/pkgconfig" ] && \
  export PKG_CONFIG_PATH=$HOME/.local/lib/pkgconfig:${PKG_CONFIG_PATH:=}

type ccache >/dev/null 2>&1             &&
  export USE_CCACHE=1                   &&
  export CCACHE_DIR=$HOME/tmp/ccache

