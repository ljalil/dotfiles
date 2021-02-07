#!/bin/bash
books_dir="/media/Drive/Books"
movies_dir="/media/Drive/Movies"

alias bopen='cd $books_dir; bn="$(find . -type f | fzf)"; zathura "${bn}" & disown && exit'
