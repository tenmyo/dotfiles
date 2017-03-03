#!/bin/sh
for f in $(dirname $(realpath $0))/Dotfiles/.??* ; do
  ln -sf $f ~/$(basename $f)
done
echo $(tput setaf 2)Deploy dotfiles complete!.$(tput sgr0)
