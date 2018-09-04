#!/bin/sh
set -eu

[ -f ~/.ssh/id_ed25519.pub ] || ssh-keygen -t ed25519 -C "${USER}@$(hostname)"
cat ~/.ssh/id_ed25519.pub
read -p "please upload to github https://github.com/settings/keys"

dotfiles=/data/git/github.com/${USER}/dotfiles
read -p "git clone to [${dotfiles}]: " dotdir
dotdir=${dotdir:=${dotfiles}}
[ -e "${dotdir}" ] || git clone git@github.com:${USER}/dotfiles.git "${dotdir}"

