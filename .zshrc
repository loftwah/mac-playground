# ~/.zshrc
# Loftwah-Inspired Zsh Config with Powerlevel10k - Optimized for 2025 Mac Dev 🚀

# Path to Oh My Zsh installation
export ZSH="$HOME/.oh-my-zsh"

# =============== #
#    PATH SETUP   #
# =============== #

# Use Zsh array for PATH to avoid duplicates
typeset -U path

# Homebrew (Apple Silicon)
path+=("/opt/homebrew/bin" "/opt/homebrew/sbin")

# Mise (language version manager)
path+=("$HOME/.local/bin")

# Local and personal bins
path+=("$HOME/bin" "$HOME/.bun/bin")

# Homebrew shell environment
eval "$(/opt/homebrew/bin/brew shellenv)"

# =============== #
#  ENV VARS ETC.  #
# =============== #

# XDG Base Directory Specification
export XDG_CONFIG_HOME="$HOME/.config"

# mise (replacing nvm, pyenv, rbenv, etc.)
eval "$(mise activate zsh)"

# =============== #
#  ZSH PLUGINS    #
# =============== #

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-completions
  fzf
  aws
  docker
)

# Set Powerlevel10k as the theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Source Oh My Zsh
source "$ZSH/oh-my-zsh.sh"

# =============== #
#   ALIASES ETC.  #
# =============== #

# CLI tweaks (using ls instead of exa)
alias ls='ls -G'          # -G adds color on macOS
alias ll='ls -lh'         # Long listing with human-readable sizes
alias la='ls -lha'        # Long listing, all files, human-readable
alias cat='bat --style=full'
alias cd='z'              # zoxide for fast navigation
alias top='btop'
alias grep='rg'
alias find='fd'

# Dev tools
alias lg='lazygit'
alias tf='tofu'           # OpenTofu alias
alias k='kubectl'

# =============== #
#    COMPLETIONS  #
# =============== #

# zoxide
eval "$(zoxide init zsh)"

# Bun completions (if installed)
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# iTerm2 Shell Integration (optional)
[ -s "$HOME/.iterm2_shell_integration.zsh" ] && source "$HOME/.iterm2_shell_integration.zsh"

# Powerlevel10k configuration (run `p10k configure` after sourcing)
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh