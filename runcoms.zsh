#! /usr/bin/zsh
#

#
setopt EXTENDED_GLOB
#
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -f -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

