#!/usr/bin/env bash

set -e

# Colors and styling via gum
BOLD="\033[1m"
RESET="\033[0m"

# ─────────────────────────────────────────────────────────────────────────────
# Helpers
# ─────────────────────────────────────────────────────────────────────────────

ensure_homebrew() {
  if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
    echo "Homebrew installed."
  else
    echo "Homebrew already installed."
  fi
}

ensure_gum() {
  if ! command -v gum &>/dev/null; then
    echo "Installing gum..."
    brew install gum
  fi
}

# ─────────────────────────────────────────────────────────────────────────────
# Installation steps
# ─────────────────────────────────────────────────────────────────────────────

step_dotfiles() {
  gum style --border normal --padding "0 1" --foreground 4 "Copying dotfiles to $HOME"

  local files=(
    ".aliases"
    ".exports"
    ".gitconfig"
    ".gitignore"
    ".zshrc"
  )

  local dirs=(
    ".config/ghostty"
    ".config/nvim"
    ".config/zellij"
    ".config/nchat"
    ".gnupg"
  )

  for file in "${files[@]}"; do
    if [[ -f "$file" ]]; then
      cp "$file" "$HOME/$file"
      gum style --foreground 2 "  copied $file"
    fi
  done

  for dir in "${dirs[@]}"; do
    if [[ -d "$dir" ]]; then
      mkdir -p "$HOME/$dir"
      cp -r "$dir"/* "$HOME/$dir/" 2>/dev/null || true
      gum style --foreground 2 "  copied $dir/"
    fi
  done
}

step_git_config() {
  gum style --border normal --padding "0 1" --foreground 4 "Git configuration"

  local git_name
  git_name=$(gum input --placeholder "Your Git user.name" --prompt "Name: " --value "$(git config --global user.name 2>/dev/null)")

  local git_email
  git_email=$(gum input --placeholder "Your Git user.email" --prompt "Email: " --value "$(git config --global user.email 2>/dev/null)")

  git config --global user.name "$git_name"
  git config --global user.email "$git_email"

  if gum confirm "Set up GPG signing for commits?"; then
    local gpg_key
    gpg_key=$(gum input --placeholder "Your GPG key ID" --prompt "GPG Key: " --value "$(git config --global user.signingkey 2>/dev/null)")
    git config --global user.signingkey "$gpg_key"
    git config --global commit.gpgsign true
    gum style --foreground 2 "  GPG signing enabled with key $gpg_key"
  fi

  gum style --foreground 2 "  Git configured as $git_name <$git_email>"
}

step_brew_cli() {
  gum style --border normal --padding "0 1" --foreground 4 "Installing CLI tools via Homebrew"
  gum spin --spinner dot --title "Installing CLI tools..." -- bash brew.sh
  gum style --foreground 2 "  CLI tools installed."
}

step_brew_cask() {
  gum style --border normal --padding "0 1" --foreground 4 "Installing GUI apps via Homebrew Cask"
  gum spin --spinner dot --title "Installing GUI apps..." -- bash cask.sh
  gum style --foreground 2 "  GUI apps installed."
}

step_oh_my_zsh() {
  gum style --border normal --padding "0 1" --foreground 4 "Installing Oh My Zsh"

  if [[ -d "$HOME/.oh-my-zsh" ]]; then
    gum style --foreground 3 "  Oh My Zsh already installed, skipping."
  else
    gum spin --spinner dot --title "Installing Oh My Zsh..." -- \
      sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    gum style --foreground 2 "  Oh My Zsh installed."
  fi

  # Spaceship prompt
  local spaceship_dir="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/spaceship-prompt"
  if [[ -d "$spaceship_dir" ]]; then
    gum style --foreground 3 "  Spaceship prompt already installed, skipping."
  else
    gum spin --spinner dot --title "Installing Spaceship prompt..." -- \
      git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$spaceship_dir" --depth=1
    ln -sf "$spaceship_dir/spaceship.zsh-theme" "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/spaceship.zsh-theme"
    gum style --foreground 2 "  Spaceship prompt installed."
  fi
}

step_languages() {
  gum style --border normal --padding "0 1" --foreground 4 "Installing programming languages via asdf"

  if ! command -v asdf &>/dev/null; then
    gum style --foreground 1 "  asdf not found. Run 'CLI Tools' step first."
    return
  fi

  local languages
  languages=$(gum choose --no-limit --selected "golang,nodejs,elixir,rust" \
    "golang" \
    "nodejs" \
    "elixir" \
    "rust")

  while IFS= read -r lang; do
    [[ -z "$lang" ]] && continue

    if asdf plugin list 2>/dev/null | grep -q "^${lang}$"; then
      gum style --foreground 3 "  $lang plugin already added."
    else
      gum spin --spinner dot --title "Adding asdf plugin $lang..." -- \
        asdf plugin add "$lang"
      gum style --foreground 2 "  $lang plugin added."
    fi

    gum spin --spinner dot --title "Installing latest $lang..." -- \
      asdf install "$lang" latest
    asdf set --home "$lang" latest
    gum style --foreground 2 "  $lang latest installed and set as global default."
  done <<< "$languages"
}

step_macos() {
  gum style --border normal --padding "0 1" --foreground 4 "Applying macOS preferences"

  if gum confirm "This will change macOS system preferences. Continue?"; then
    bash osx.sh
    gum style --foreground 2 "  macOS preferences applied."
  else
    gum style --foreground 3 "  Skipped macOS preferences."
  fi
}

# ─────────────────────────────────────────────────────────────────────────────
# Main
# ─────────────────────────────────────────────────────────────────────────────

main() {
  ensure_homebrew
  ensure_gum

  gum style \
    --border double \
    --align center \
    --padding "1 3" \
    --foreground 4 \
    --bold \
    "Dotfiles Installer" \
    "github.com/vitorleal/dotfiles"

  echo ""

  local steps
  steps=$(gum choose --no-limit --selected "Dotfiles,Git Config,CLI Tools,GUI Apps,Oh My Zsh,Languages (asdf),macOS Preferences" \
    "Dotfiles" \
    "Git Config" \
    "CLI Tools" \
    "GUI Apps" \
    "Oh My Zsh" \
    "Languages (asdf)" \
    "macOS Preferences")

  echo ""

  while IFS= read -r step; do
    case "$step" in
      "Dotfiles")           step_dotfiles ;;
      "Git Config")         step_git_config ;;
      "CLI Tools")          step_brew_cli ;;
      "GUI Apps")           step_brew_cask ;;
      "Oh My Zsh")          step_oh_my_zsh ;;
      "Languages (asdf)")   step_languages ;;
      "macOS Preferences")  step_macos ;;
    esac
    echo ""
  done <<< "$steps"

  gum style \
    --border double \
    --align center \
    --padding "1 3" \
    --foreground 2 \
    --bold \
    "All done!" \
    "Restart your terminal to apply changes."
}

main "$@"
