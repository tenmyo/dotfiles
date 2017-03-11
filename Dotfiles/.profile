export PAGER=less
export LESS='-i -M -R -S -W -z-4'
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline
export LESS_TERMCAP_ue=$'\E[0m'           # end underline


# User specific environment and startup programs

export PATH=$HOME/.local/bin:$HOME/bin:${PATH:=}

export CMAKE_PREFIX_PATH=$HOME/.local:${CMAKE_PREFIX_PATH:=}
export LD_LIBRARY_PATH=$HOME/.local/lib:${LD_LIBRARY_PATH:=}
export PKG_CONFIG_PATH=$HOME/.local/lib/pkgconfig:${PKG_CONFIG_PATH:=}
export MANPATH=$HOME/.local/man:${MANPATH:=}

export USE_CCACHE=1
export CCACHE_DIR=$HOME/tmp/ccache
