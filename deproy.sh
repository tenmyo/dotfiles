#!/bin/sh

mkdir -p ~/.config
for f in $(dirname $(realpath $0))/config/* ; do
  ln -sfT $f ~/.config/$(basename $f)
done

for f in $(dirname $(realpath $0))/Dotfiles/.??* ; do
  ln -sf $f ~/$(basename $f)
done
echo $(tput setaf 2)Deploy dotfiles complete!.$(tput sgr0)
