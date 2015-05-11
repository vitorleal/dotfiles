#!/usr/bin/env bash

echo "Puting dotfiles in your home path ~/"
for file in ./.{aliases,bash_profile,bash_prompt,bashrc,exports,gitconfig,gitignore,screenrc,vim,vimrc}; do
    if [[ $(file $file | awk '{print $2}') == "directory" ]]; then
      [ -r "$file" ] && cp -r "$file" ~/ && echo "copied folder $file"

    else
      [ -r "$file" ] && cp "$file" ~/ && echo "copied file $file"
    fi;
done
unset file

