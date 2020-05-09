#!/bin/sh
set -eu
. "$(dirname $0)/Dotfiles/.profile"

LANGUAGE=en /usr/bin/xdg-user-dirs-update --force

sudo pacman-mirrors -c Japan
sudo pacman -Syu --noconfirm
sudo pacman -S --needed --noconfirm yay

yay -S --needed --noconfirm \
  base-devel \
  ccache \
  clang \
  cmake \
  go \
  ninja \

yay -S --needed --noconfirm git tmux vim vimpager curl bash-completion code
yay -S --needed --noconfirm fcitx-mozc fcitx-configtool fcitx-gtk3 fcitx-qt5
yay -S --needed --noconfirm tree lsof jq the_platinum_searcher-bin
yay -S --needed --noconfirm xorg-xwininfo compton meld xsel

yay -S --needed --noconfirm aur/ttf-myricam aur/ttf-hackgen

# peco
arch=linux_amd64
mkdir -p ~/.local/bin
url=$(curl -s https://api.github.com/repos/peco/peco/releases/latest | \
  jq -r ".assets[] | select(.name|test(\"${arch}.tar.gz\")) | .browser_download_url")
curl -sL "${url}" | tar -zx -O "peco_${arch}/peco" > ~/.local/bin/peco
chmod u+x ~/.local/bin/peco

go get -u github.com/x-motemen/ghq

