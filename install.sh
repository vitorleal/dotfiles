#!/usr/bin/env bash

# Dotfiles
echo "• Putting dotfiles in your home path: $HOME"

files=(
  "./.aliases"
  "./.exports"
  "./.gitconfig"
  "./.gitignore"
  "./.screenrc"
  "./.config"
  "./.tmux.conf"
  "./.zshrc"
)

for file in ${files[@]}; do
  if [[ $(file $file | awk '{print $2}') == "directory" ]]; then
    [ -r "$file" ] && cp -r "$file" $HOME && echo "  - Copied folder $file"

  else
    [ -r "$file" ] && cp "$file" $HOME && echo "  - Copied file $file"
  fi
done
unset file files
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
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo "  - Done installing Homebrew"
fi

echo "• Install Homebrew apps"
source brew.sh
echo ""

# Install Oh My ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install spaceship theme
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
