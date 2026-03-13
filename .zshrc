export PATH="$HOME/bin:$PATH";

export ZSH=~/.oh-my-zsh

export UPDATE_ZSH_DAYS=5

ZSH_THEME="spaceship"

ENABLE_CORRECTION="false"

HIST_STAMPS="dd/mm/yyyy"

plugins=(git docker python pip mix z macos asdf)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"
[[ -f "$HOME/.exports" ]] && source "$HOME/.exports"

GPG_TTY=$(tty)
export GPG_TTY

# Zoxide (smart cd)
eval "$(zoxide init zsh)"

# Fuzzy finder
source <(fzf --zsh)
