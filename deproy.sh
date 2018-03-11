#!/bin/sh

echo '~/'
for f in $(dirname $(realpath $0))/Dotfiles/.??* ; do
  [ -f "$f" ] || continue
  ln -sfT $f ~/$(basename $f)
  echo "  $(basename $f)"
done

echo '~/.config'
mkdir -p ~/.config
for f in $(dirname $(realpath $0))/config/* ; do
  ln -sfT $f ~/.config/$(basename $f)
  echo "  $(basename $f)"
done

echo '~/.local/bin'
for f in $(dirname $(realpath $0))/bin/* ; do
  ln -sfT $f ~/.local/bin/$(basename $f)
  echo "  $(basename $f)"
done

echo $(tput setaf 2)Deploy dotfiles complete!.$(tput sgr0)

