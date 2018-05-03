#!/bin/sh
set -eu

sudo pacman-mirrors -c Japan
sudo pacman -Syu
sudo pacman -S --needed yay

yay -S --needed --noconfirm base-devel ccache extra/go
yay -S --needed --noconfirm git tmux vim vimpager curl
yay -S --needed --noconfirm fcitx-mozc fcitx-configtool fcitx-gtk3 fcitx-qt5
yay -S --needed --noconfirm tree lsof jq
yay -S --needed --noconfirm xorg-xwininfo compton meld

yay -S --needed --noconfirm aur/ttf-myricam aur/visual-studio-code-bin

# peco
arch=linux_amd64
mkdir -p ~/.local/bin
url=$(curl -s https://api.github.com/repos/peco/peco/releases/latest | jq -r ".assets[] | select(.name|test(\"${arch}.tar.gz\")) | .browser_download_url")
curl -sL "${url}" | tar -zx -O "peco_${arch}/peco" > ~/.local/bin/peco
chmod u+x ~/.local/bin/peco

