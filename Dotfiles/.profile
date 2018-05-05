# ~/.profile: exec on login shell(generic)
# environment variables
echo .profile

# interactive shell setup file
# (however, bash uses ~/.bashrc instead $ENV)
export ENV=$HOME/.shrc

# ~/.local
export CMAKE_PREFIX_PATH="$HOME/.local${CMAKE_PREFIX_PATH+:}$CMAKE_PREFIX_PATH"
export PATH="$HOME/.local/bin:$PATH"
export MANPATH="$HOME/.local/man:$MANPATH"
export INFOPATH="$HOME/.local/info:$INFOPATH"
export LD_LIBRARY_PATH="$HOME/.local/lib${LD_LIBRARY_PATH+:}$LD_LIBRARY_PATH"
export PKG_CONFIG_PATH="$HOME/.local/lib/pkgconfig${PKG_CONFIG_PATH+:}$PKG_CONFIG_PATH"

# golang
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export PATH="$GOBIN:$PATH"

# ccache
export USE_CCACHE=1
export CCACHE_DIR="$HOME/.cache/ccache"

:

