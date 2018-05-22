#!/bin/sh
set -eu
. Dotfiles/.profile

sudo pacman-mirrors -c Japan
sudo pacman -Syu
sudo pacman -S --needed yay

yay -S --needed --noconfirm base-devel ccache cmake extra/go ninja
yay -S --needed --noconfirm git tmux vim vimpager curl bash-completion
yay -S --needed --noconfirm fcitx-mozc fcitx-configtool fcitx-gtk3 fcitx-qt5
yay -S --needed --noconfirm tree lsof jq the_platinum_searcher-bin
yay -S --needed --noconfirm xorg-xwininfo compton meld xsel

yay -S --needed --noconfirm aur/ttf-myricam aur/visual-studio-code-bin

# peco
arch=linux_amd64
mkdir -p ~/.local/bin
url=$(curl -s https://api.github.com/repos/peco/peco/releases/latest | \
  jq -r ".assets[] | select(.name|test(\"${arch}.tar.gz\")) | .browser_download_url")
curl -sL "${url}" | tar -zx -O "peco_${arch}/peco" > ~/.local/bin/peco
chmod u+x ~/.local/bin/peco

go get -u github.com/motemen/ghq

