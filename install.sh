#!/usr/bin/env bash

# Dotfiles
echo "• Putting dotfiles in your home path: $HOME"

files=(
  "./.aliases"
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
echo ""


# Git configuration
echo "• Git / GitHub configuration"
read -p "  - What your Git user.name? " git_name
git config --global user.name "$git_name"

read -p "  - What your Git user.email? " git_email
git config --global user.email $git_email
echo ""


# Homebrew
echo "• Check if Homebrew is installed"

if [[ $(which brew) != "" ]]; then
  echo "  - Homebrew already installed"

else
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  echo "  - Done installing Homebrew"
fi;

echo "• Install Homebrew apps"
source brew.sh
echo ""


# Preparing VIM and Vundle Plugins
echo "• Preparing Vim and Vundle Plugins"

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

