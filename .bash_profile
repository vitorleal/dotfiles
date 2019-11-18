# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases
# ~/.extra can be used for settings you don’t want to commit
files=(
  "$HOME/.aliases"
  "$HOME/.bash_prompt"
  "$HOME/.exports"
)

for file in ${files[@]}; do
  [ -f "$file" ] && source "$file";
done;

unset file files;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# Enable some Bash 4 features when possible
for option in autocd globstar; do
  shopt -s "$option" 2> /dev/null;
done;

# Bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion;
fi;
