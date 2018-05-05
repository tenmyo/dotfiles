#!/bin/sh
set -eu

[ -f ~/.ssh/id_ed25519.pub ] || ssh-keygen -t ed25519 -C "tenmyo@gmail.com"
cat ~/.ssh/id_ed25519.pub
read -p upload to github

dotfiles=~/src/github.com/tenmyo/dotfiles
[ -e "${dotfiles}" ] || git clone git@github.com:tenmyo/dotfiles.git "${dotfiles}"

