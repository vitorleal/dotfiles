export PATH="$HOME/bin:$PATH";

export ZSH=/Users/vitorleal/.oh-my-zsh

ZSH_THEME="spaceship"

export UPDATE_ZSH_DAYS=5

ENABLE_CORRECTION="false"

HIST_STAMPS="dd/mm/yyyy"

plugins=(git docker fabric python pip django zsh-iterm-touchbar)

source $ZSH/oh-my-zsh.sh

export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8
export EDITOR='vim'

files=(
  "$HOME/.aliases"
  "$HOME/.exports"
)

for file in ${files[@]}; do
  [ -f "$file" ] && source "$file";
done;

unset file files;
export PATH="/usr/local/sbin:$PATH"
export GOPATH="${HOME}/Code/ingresse/go"
