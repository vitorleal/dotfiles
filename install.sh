#!/usr/bin/env bash

# Dotfiles
echo "• Putting dotfiles in your home path: $HOME"

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

for file in ${files[@]}; do
    if [[ $(file $file | awk '{print $2}') == "directory" ]]; then
      [ -r "$file" ] && cp -r "$file" $HOME && echo "  - Copied folder $file"

    else
      [ -r "$file" ] && cp "$file" $HOME && echo "  - Copied file $file"
    fi;
done;

unset file files;


# HomeBrew
echo "• Check if Homebrew is installed"

if [[ $(which brew) != "" ]]; then
  echo "  - Homebrew already installed"

else
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  echo "  - Done installing Homebrew"
fi;

