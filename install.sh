#!/usr/bin/env bash

files=(
  "./.aliases"
  "./.bash_profile"
  "./.bash_prompt"
  "./.bashrc"
  "./.exports"
  "./.gitcofig"
  "./.gitignore"
  "./.screenrc"
  "./.vim"
  "./.vimrc"
)

echo "Puting dotfiles in your home path ~/"
for file in ${files[@]}; do
    if [[ $(file $file | awk '{print $2}') == "directory" ]]; then
      [ -r "$file" ] && cp -r "$file" ~/ && echo "copied folder $file"

    else
      [ -r "$file" ] && cp "$file" ~/ && echo "copied file $file"
    fi;
done
unset file

