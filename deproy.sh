#!/bin/sh

echo '~/'
for f in $(dirname $(realpath $0))/Dotfiles/.??* ; do
  dst=~/$(basename $f)
  if [ -f "${dst}" -o -d "${dst}" ]; then
    [ -h "${dst}" ] ||  -mv "${dst}" "${dst}.bak"
  fi
  ln -sfT $f "${dst}"
  echo "  $(basename $f)"
done

echo '~/.config'
mkdir -p ~/.config
for f in $(dirname $(realpath $0))/config/* ; do
  dst=~/.config/$(basename $f)
  if [ -f "${dst}" -o -d "${dst}" ]; then
    [ -h "${dst}" ] ||  -mv "${dst}" "${dst}.bak"
  fi
  ln -sfT $f "${dst}"
  echo "  $(basename $f)"
done

echo '~/.local/bin'
mkdir -p ~/.local/bin
for f in $(dirname $(realpath $0))/bin/* ; do
  dst=~/.local/bin/$(basename $f)
  if [ -f "${dst}" -o -d "${dst}" ]; then
    [ -h "${dst}" ] ||  -mv "${dst}" "${dst}.bak"
  fi
  ln -sfT $f "${dst}"
  echo "  $(basename $f)"
done

echo $(tput setaf 2)Deploy dotfiles complete!.$(tput sgr0)

