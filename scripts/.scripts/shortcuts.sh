#!/bin/bash

shell_shortcuts=$HOME/.dotfiles/bash/.shortcuts.sh
ranger_shortcuts=$HOME/.dotfiles/ranger/.config/ranger/shortcuts.conf

# Loop through n>=2 fields and store them in VAR
# for fields n>2 append a space to the variable, so
# path with spaces preserve the spaces.
# For bash, replace the tilde (~) with $HOME since it
# doesn't work in aliases

awk '{VAR=""; for (i = 2; i<=NF; i++) {if(i!=2){VAR=VAR" "}; VAR=VAR$i};gsub("~","\$HOME",VAR); print "alias " $1 "=\"cd \047"VAR"\047\""}' "shortcuts"> $shell_shortcuts

awk '{VAR=""; for (i = 2; i<=NF; i++) {if(i!=2){VAR=VAR" "}; VAR=VAR$i}; print "map g"$1 " cd "VAR}' "shortcuts" > $ranger_shortcuts

cd ~/.dotfiles
stow bash
