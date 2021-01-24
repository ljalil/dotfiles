#!/bin/bash

shell_shortcuts=$HOME/.dotfiles/bash/.shortcuts.sh
ranger_shortcuts=$HOME/.dotfiles/ranger/.config/ranger/shortcuts.conf

awk '{ print "alias " $1 "=\"cd " $2"\""}' "shortcuts" > $shell_shortcuts
awk '{ print "map g" $1 " cd " $2}' "shortcuts" > $ranger_shortcuts

cd ~/.dotfiles
stow bash
