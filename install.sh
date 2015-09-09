#!/usr/bin/env bash

# Dotfiles
echo "• Putting dotfiles in your home path: $HOME"

files=(
  "./.aliases"
  "./.bash_profile"
  "./.bash_prompt"
  "./.bashrc"
  "./.exports"
  "./.gitconfig"
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


# Preparing VIM and Vundle Plugins
echo "• Preperaing Vim and Vundle Plugins"

if [[ -r "$HOME/.vim/bundle/Vundle.vim" ]]; then
  echo "  - Vundle already installed. Lets install the plugins"
  vim +PluginInstall +qall
  echo "  - Done installing the Plugins"

else
  echo "  - Lets install Vundle Plugin Manager"
  git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
  vim +PluginInstall +qall
  echo " - Done installing the Plugins"
fi;

