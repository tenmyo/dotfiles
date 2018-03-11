# ~/.profile: exec on login shell(generic)
# environment variables
echo .profile

# interactive shell setup file
# (however, bash uses ~/.bashrc instead $ENV)
export ENV=$HOME/.shrc

type -P vim >/dev/null 2>&1 &&
  export EDITOR=vim

# less
# http://linux.101hacks.com/ps1-examples/prompt-color-using-tput/
# http://unix.stackexchange.com/questions/108699/documentation-on-less-termcap-variables
export PAGER=less
export LESS='--ignore-case --LONG-PROMPT --RAW-CONTROL-CHARS'
type src-hilite-lesspipe.sh >/dev/null 2>&1         &&
  export LESSOPEN='| src-hilite-lesspipe.sh "%s"'
# export LESS_TERMCAP_DEBUG=1
export LESS_TERMCAP_mb=$(tput rev)                  # start blink
export LESS_TERMCAP_md=$(tput bold; tput setaf 4)   # start bold(blue)
export LESS_TERMCAP_me=$(tput sgr0)                 # turn off bold, blink, underline
export LESS_TERMCAP_so=$(tput smso; tput setaf 3)   # start standout(yellow)
export LESS_TERMCAP_se=$(tput sgr0)                 # stop standout
export LESS_TERMCAP_us=$(tput smul; tput setaf 2)   # start underline(green)
export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)      # stop underline
# export LESS_TERMCAP_mr=$(tput rev)
# export LESS_TERMCAP_mh=$(tput dim)
# export LESS_TERMCAP_ZN=$(tput ssubm)
# export LESS_TERMCAP_ZV=$(tput rsubm)
# export LESS_TERMCAP_ZO=$(tput ssupm)
# export LESS_TERMCAP_ZW=$(tput rsupm)
export COLORFGBG="15;0"

# ~/.local
[ -d "$HOME/.local" ] &&
  export CMAKE_PREFIX_PATH="$HOME/.local${CMAKE_PREFIX_PATH+:}$CMAKE_PREFIX_PATH"
[ -d "$HOME/.local/bin" ] &&
  export PATH="$HOME/.local/bin:$PATH"
[ -d "$HOME/.local/man" ] &&
  export MANPATH="$HOME/.local/man:$MANPATH"
[ -d "$HOME/.local/info" ] &&
  export INFOPATH="$HOME/.local/info:$INFOPATH"
[ -d "$HOME/.local/lib" ] &&
  export LD_LIBRARY_PATH="$HOME/.local/lib${LD_LIBRARY_PATH+:}$LD_LIBRARY_PATH"
[ -d "$HOME/.local/lib/pkgconfig" ] &&
  export PKG_CONFIG_PATH="$HOME/.local/lib/pkgconfig${PKG_CONFIG_PATH+:}$PKG_CONFIG_PATH"

# golang
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export PATH="$GOBIN:$PATH"

# ccache
type -P ccache >/dev/null 2>&1          &&
  export USE_CCACHE=1                   &&
  export CCACHE_DIR="$HOME/.cache/ccache"

:

