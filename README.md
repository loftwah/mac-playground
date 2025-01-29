# Loftwah's Ultimate Mac Dev Setup (2025 Edition) 🚀

A comprehensive guide for setting up a modern macOS development environment with best-in-class tools and configurations.

> "Because life's too short for suboptimal dev environments" 🧙‍♂️

## Table of Contents

- [Quick Start](#quick-start)
- [Core Tools](#core-tools)
- [Development Environment](#development-environment)
- [Cloud & DevOps](#cloud--devops)
- [Security & Privacy](#security--privacy)
- [Productivity Boosters](#productivity-boosters)
- [Advanced Configurations](#advanced-configurations)
- [Maintenance & Optimization](#maintenance--optimization)
- [Troubleshooting](#troubleshooting)
- [Pro Tips](#pro-tips-)

---

## Quick Start 🏃‍♂️

### One-line Setup Script

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && brew bundle install
```

---

## Core Tools 🛠

### Package Management

#### Homebrew

```bash
# Essential formulae
brew install \
  bat \         # Better cat
  exa \         # Modern ls
  fd \          # Better find
  ripgrep \     # Better grep
  fzf \         # Fuzzy finder
  zoxide \      # Better cd
  delta \       # Better diff
  gh \          # GitHub CLI
  lazygit       # Terminal UI for git

# Must-have casks
brew install --cask \
  raycast \     # Spotlight replacement
  iterm2 \      # iTerm2
  orbstack      # Docker/Linux VM replacement

# ADDITION: database GUI tools
brew install --cask \
  tableplus \   # Modern DB GUI
  dbeaver-community
```

### Terminal Setup

#### iTerm2 + Oh My Zsh

```bash
# 1. Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 2. (Optional) Install recommended plugins
brew install zsh-autosuggestions zsh-syntax-highlighting zsh-completions

# 3. Open iTerm2 > Preferences > Profiles > Command to ensure it uses zsh.
# 4. Configure ~/.zshrc:
```

Here’s a sample `.zshrc` snippet to enable common plugins:

```bash
# ~/.zshrc

# Set your ZSH theme (pick one you like; "robbyrussell" is default)
ZSH_THEME="robbyrussell"

# Oh My Zsh plugins
plugins=(
  git          # Handy Git aliases
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-completions
  fzf          # Integrate fzf for fuzzy searching
  aws          # Simple AWS CLI completions
  docker       # Docker aliases
)

source $ZSH/oh-my-zsh.sh

# If you installed these plugins via Homebrew, point zsh to them:
# For example:
#   source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
#   source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#   fpath+=(/opt/homebrew/share/zsh-completions)

# Make sure these lines are placed after 'oh-my-zsh.sh' if needed,
# especially for zsh-autosuggestions and syntax-highlighting.
```

> **Tip**: If you see errors about `insecure directories`, run:
>
> ```bash
> compaudit | xargs chmod g-w
> ```

---

## Development Environment 💻

### Language Version Manager

#### mise (Modern Runtime Manager)

```bash
# Install mise
brew install mise

# Add to ~/.zshrc
eval "$(mise activate zsh)"

# Setup languages
mise use --global node@20
mise use --global python@3.12
mise use --global ruby@3.3
mise use --global go@1.22
mise use --global rust@stable

# Install tools
mise install node@20 python@3.12 ruby@3.3 go@1.22 rust@stable

# Verify installations
mise ls
mise trust
```

### Python Development

#### Modern Python Setup with uv

```bash
# Install uv (modern Python package installer)
brew install uv

# Create a new project
mkdir myproject && cd myproject

# Initialize virtual environment with uv
uv venv

# Activate virtual environment
source .venv/bin/activate

# Install packages blazingly fast
uv pip install pandas numpy torch

# Generate requirements.txt
uv pip freeze > requirements.txt

# Install from requirements.txt
uv pip install -r requirements.txt

# Pro Tip: Use with mise (or asdf) to manage Python versions
mise use python@3.12
uv pip install poetry ruff pytest
```

#### Python Best Practices

```bash
# Install modern Python tools
uv pip install \
    ruff \        # Fast linter + formatter
    pytest \      # Testing
    poetry \      # Dependency management
    pdm \         # Modern package manager
    rich \        # Beautiful terminal output
    httpx \       # Modern HTTP client
    pydantic      # Data validation

# Configure ruff (in pyproject.toml)
[tool.ruff]
line-length = 88
target-version = "py312"
```

> **ADDITION**: Other notable Python tools:
>
> ```bash
> uv pip install hatch        # Newer Python project management
> uv pip install pyright      # Type checking
> ```

### IDE & Editor Setup

I primarily use **Cursor** and **VS Code**.  
*(No extension suggestions here.)*

---

## Cloud & DevOps ☁️

### Modern Container Setup

#### OrbStack (Docker Alternative)

```bash
brew install --cask orbstack

# Enable Kubernetes
orb kubernetes enable
```

### Infrastructure as Code

#### Terraform & tfenv with OpenTofu

```bash
# tfenv for managing multiple Terraform versions
brew install tfenv

# Install and use the latest Terraform
tfenv install latest
tfenv use latest

# OpenTofu (fully open-source Terraform distribution)
brew install opentofu

# OpenTofu usage
tofu init
tofu workspace new dev
```

### Cloud CLI Tools

```bash
# AWS CLI v2 with SSO
brew install awscli
aws configure sso

# Modern K8s tools
brew install \
  kubectl \
  k9s \
  kubectx \
  lens \
  helm
```

> **ADDITION**: Further AWS utilities
>
> ```bash
> brew install aws-nuke      # Cleanup entire AWS account
> brew install aws-vault     # Secure AWS credentials
> brew install steampipe     # SQL interface for cloud & SaaS APIs
> ```

> **ADDITION**: AWS Session Manager plugin (ECS task access, etc.)
>
> ```bash
> brew install session-manager-plugin
> ```

---

## Security & Privacy 🔒

### 1Password CLI Integration

```bash
# Install
brew install --cask 1password-cli

# SSH Agent Integration
op plugin init ssh
```

### GPG & SSH Setup

```bash
# Modern SSH key with security key support
ssh-keygen -t ed25519-sk -C "your_email@example.com"

# GPG for signing commits
brew install gnupg
gpg --full-generate-key
```

> **ADDITION**: **age** - modern file encryption:
>
> ```bash
> brew install age
> age-keygen -o key.txt
> age -r KEY_HERE secretfile.txt > secretfile.txt.age
> ```

> **ADDITION**: Configure GPG for commit signing:
>
> ```bash
> # Find your GPG key ID
> gpg --list-secret-keys --keyid-format=long
> ```
>
> **In this example**, 1234ABCD is the GPG key ID
>
> ```bash
> git config --global user.signingkey 1234ABCD`
> git config --global commit.gpgsign true`
> ```
>

---

## Productivity Boosters 🚀

### Modern CLI Alternatives

```bash
# Install modern alternatives
brew install \
  bat \         # cat replacement
  exa \         # ls replacement
  fd \          # find replacement
  ripgrep \     # grep replacement
  duf \         # df replacement
  bottom \      # top replacement
  zoxide \      # cd replacement
  choose \      # cut replacement
  sd \          # sed replacement
  procs \       # ps replacement
  dust \        # du replacement
  tealdeer      # tldr replacement
```

> **ADDITION**: **just** (command runner), **difftastic** (diff viewer), **hyperfine** (benchmarking):
>
> ```bash
> brew install just difftastic hyperfine
> ```

### Git Enhancements

```bash
# Install
brew install \
  git-delta \   # Better diff
  lazygit \     # TUI
  gh \          # GitHub CLI
  git-flow-avh  # Git workflows

# Configure
git config --global core.pager "delta"
git config --global interactive.diffFilter "delta --color-only"
```

> **ADDITION**:
>
> ```bash
> brew install git-absorb      # Automatic fixup commits
> brew install git-branchless  # Modern Git workflow
> ```

---

## Advanced Configurations ⚙️

### Shell Aliases

```bash
# Add to ~/.zshrc
alias ls='exa --icons --git'
alias ll='exa -l --icons --git'
alias tree='exa --tree --icons'
alias cat='bat --style=full'
alias cd='z'
alias vim='nvim'
alias top='btm'
alias find='fd'
alias grep='rg'
```

### Keyboard Shortcuts

```bash
# Raycast Custom Scripts
brew install swift-format
mkdir -p ~/.raycast/scripts
```

---

## Maintenance & Optimization 🧹

### System Maintenance

```bash
# Cleanup script
brew cleanup
brew autoremove
brew doctor

# Update everything
brew update && brew upgrade
mas upgrade
```

### Performance Monitoring

```bash
# Install monitoring tools
brew install \
  htop \
  btop \
  glances \
  speedtest-cli \
  neofetch
```

> **ADDITION**: Modern observability tools:
>
> ```bash
> brew install vector   # Data pipeline
> brew install grafana  # Metrics visualization
> brew install prometheus
> ```

### **Disk Cleanup & Large File Hunting** (ADDITION)

```bash
# 1. Install ncdu (Terminal-based disk usage analyzer)
brew install ncdu

# 2. Run ncdu on home directory
ncdu ~

# Use arrow keys to navigate. Press 'd' to delete large/unwanted files or directories.

# 3. Alternatively, find all files larger than 100MB
sudo find / -type f -size +100M -exec ls -lh {} \; 2>/dev/null

# 4. Use 'dust' (already installed) to get a visual overview of directory sizes
dust ~
```

**Pro tip**: Always check twice before deleting. If you’re uncertain about a file, consider moving it to a temporary folder before permanent removal.

---

## Troubleshooting

1. **Permissions**  
   If you get `permission denied` errors with Homebrew, run:

   ```bash
   sudo chown -R $(whoami) /usr/local/*
   sudo chown -R $(whoami) /opt/homebrew/*
   ```

2. **SSH Key Issues**  
   Check `~/.ssh/config` for misconfigurations.

3. **Runtime Manager Conflicts**  
   When switching between `mise` and `asdf`, ensure only one is active in your shell.

4. **OrbStack vs. Docker**  
   Make sure Docker is not occupying the same ports if you run OrbStack simultaneously.

5. **Kubernetes Networking**  
   If you install other CNI plugins, ensure they’re not conflicting with OrbStack’s Kubernetes networking.

---

## Pro Tips 💡

1. **Modern Node Development**

   ```bash
   # Install Bun (Super fast Node.js runtime & package manager)
   curl -fsSL https://bun.sh/install | bash

   # Add to ~/.zshrc
   export BUN_INSTALL="$HOME/.bun"
   export PATH="$BUN_INSTALL/bin:$PATH"

   # Initialize a new project
   bun init

   # Install dependencies (3x faster than npm)
   bun install

   # Run scripts
   bun run dev

   # Use as a package manager
   bun add react next @types/react
   bun add -d @types/node typescript

   # Run TypeScript/JavaScript files
   bun index.ts

   # Use as a test runner
   bun test

   # Package management
   bun pm ls    # List packages
   bun update   # Update dependencies
   bun pm cache # Manage cache
   ```
