# Loftwah's Ultimate Mac Dev Setup (2025 Edition) 🚀

A comprehensive guide for setting up a modern macOS development environment with cutting-edge tools and optimized workflows.

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
- [Pro Tips](#pro-tips)

---

## Quick Start 🏃‍♂️

### One-line Setup Script with Brewfile

To make setup as seamless as possible, use this one-liner to install Homebrew and all tools listed in a `Brewfile`:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo >> /Users/username/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/username/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
brew bundle --file=~/Brewfile
```

**New Addition**: Here’s a sample `Brewfile` to include all tools from this guide. Save it as `~/Brewfile`:

```ruby
# ~/Brewfile
tap "homebrew/bundle"

# Core formulae
brew "bat"
brew "exa"
brew "fd"
brew "ripgrep"
brew "fzf"
brew "zoxide"
brew "delta"
brew "gh"
brew "lazygit"
brew "mise"
brew "uv"
brew "tfenv"
brew "opentofu"
brew "kubectl"
brew "k9s"
brew "kubectx"
brew "helm"
brew "awscli"
brew "aws-nuke"
brew "aws-vault"
brew "steampipe"
brew "session-manager-plugin"
brew "gnupg"
brew "age"
brew "just"
brew "difftastic"
brew "hyperfine"
brew "git-absorb"
brew "git-branchless"
brew "htop"
brew "btop"
brew "glances"
brew "speedtest-cli"
brew "neofetch"
brew "vector"
brew "grafana"
brew "prometheus"
brew "ncdu"

# Casks
cask "raycast"
cask "iterm2"
cask "orbstack"
cask "tableplus"
cask "dbeaver-community"
cask "1password-cli"
cask "lens"

# Optional tools (uncomment if needed)
# brew "fish"         # Alternative shell
# cask "docker"       # Docker Desktop
# cask "utm"          # Virtualization
# cask "wireshark"    # Network analysis
# cask "little-snitch" # Firewall
```

> **Tip**: Customize the `Brewfile` to your needs and run `brew bundle install` to install everything at once!

---

## Core Tools 🛠

### Package Management

#### Homebrew

Install essential command-line tools and GUI apps:

```bash
# Installed via Brewfile above, but here’s the manual list:
brew install bat exa fd ripgrep fzf zoxide delta gh lazygit
brew install --cask raycast iterm2 orbstack tableplus dbeaver-community
```

### Terminal Setup

#### iTerm2 + Oh My Zsh (or Alternatives)

1. **Install Oh My Zsh**:

   ```bash
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   brew install zsh-autosuggestions zsh-syntax-highlighting zsh-completions
   ```

2. **Configure `.zshrc`**:

   ```bash
   # ~/.zshrc
   ZSH_THEME="agnoster"  # Try "powerlevel10k" for a modern look
   plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-completions fzf aws docker)
   source $ZSH/oh-my-zsh.sh
   ```

3. **Optional Alternative**: Install Fish for a simpler, user-friendly shell:

   ```bash
   brew install fish
   # Add to /etc/shells and set as default: chsh -s /opt/homebrew/bin/fish
   ```

> **Tip**: Customize your theme with `p10k configure` if using Powerlevel10k!

---

## Development Environment 💻

### Language Version Manager

#### mise

```bash
brew install mise
echo 'eval "$(mise activate zsh)"' >> ~/.zshrc
mise use --global node@20 python@3.12 ruby@3.3 go@1.22 rust@stable java@21
mise install
mise ls
```

**New Addition**: Added Java for broader language support.

### Python Development

#### Modern Python with uv

```bash
brew install uv
mkdir myproject && cd myproject
uv venv
source .venv/bin/activate
uv pip install pandas numpy torch ruff pytest poetry pdm rich httpx pydantic hatch pyright
uv pip freeze > requirements.txt
```

**Note**: Choose between `poetry`, `pdm`, or `hatch` based on your workflow—each excels at dependency management.

### IDE & Editor Setup

Use **Cursor** or **VS Code**.  
**Optional**: Consider these extensions:

- VS Code: `Python`, `GitLens`, `Docker`
- Cursor: Built-in AI tools suffice for most tasks.

---

## Cloud & DevOps ☁️

### Modern Container Setup

#### OrbStack (with Docker Desktop Note)

```bash
brew install --cask orbstack
orb kubernetes enable
```

**Note**: OrbStack is lightweight and ideal for most workflows. Use Docker Desktop (`brew install --cask docker`) if you need advanced Compose features or specific integrations.

### Infrastructure as Code

#### Terraform & OpenTofu

```bash
brew install tfenv opentofu
tfenv install latest
tfenv use latest
tofu init
```

### Cloud CLI Tools

```bash
brew install awscli kubectl k9s kubectx lens helm aws-nuke aws-vault steampipe session-manager-plugin
aws configure sso
```

---

## Security & Privacy 🔒

### 1Password CLI

```bash
brew install --cask 1password-cli
op plugin init ssh
```

### GPG & SSH

```bash
ssh-keygen -t ed25519-sk -C "your_email@example.com"
brew install gnupg
gpg --full-generate-key
git config --global user.signingkey <YOUR_GPG_KEY_ID>
git config --global commit.gpgsign true
```

### File Encryption with age

```bash
brew install age
age-keygen -o key.txt
age -r <PUBLIC_KEY> secretfile.txt > secretfile.txt.age
```

**New Addition**: Backup with Time Machine or install `brew install --cask backblaze`.

---

## Productivity Boosters 🚀

### Modern CLI Alternatives

```bash
brew install bat exa fd ripgrep duf bottom zoxide choose sd procs dust tealdeer just difftastic hyperfine
```

### Git Enhancements

```bash
brew install git-delta lazygit gh git-flow-avh git-absorb git-branchless
git config --global core.pager "delta"
```

---

## Advanced Configurations ⚙️

### Shell Aliases

```bash
# ~/.zshrc
alias ls='exa --icons --git'
alias ll='exa -l --icons --git'
alias cat='bat --style=full'
alias cd='z'
alias top='btm'
```

### Keyboard Shortcuts

Enhance Raycast with scripts:

```bash
mkdir -p ~/.raycast/scripts
# Example: Create a script to open your dev folder
echo '#!/bin/bash\nopen ~/dev' > ~/.raycast/scripts/dev.sh
chmod +x ~/.raycast/scripts/dev.sh
```

### Finder Tweaks for Windows Users

To make Finder feel more like Windows Explorer, tweak these built-in settings—no extra software needed. These changes will give you a familiar layout and workflow if you’re coming from Windows:

1. **Show Full Paths** (like Windows breadcrumbs):
   - Open Finder, go to `View > Show Path Bar`. This adds a clickable folder hierarchy at the bottom, similar to Windows’ address bar.
   - Optional: For the full path in the title bar, run this in Terminal:

     ```bash
     defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES; killall Finder
     ```

2. **Show All File Extensions** (like turning off "Hide extensions for known types"):
   - Go to Finder > Preferences > Advanced.
   - Check "Show all filename extensions" so files like `document.txt` don’t hide the `.txt`.

3. **Quick Access to Drives** (like "This PC"):
   - Finder > Preferences > General > Set "New Finder windows show" to "Macintosh HD" (instead of "Recents").
   - Finder > Preferences > Sidebar > Check "Hard disks" and "External disks" to see all drives in the sidebar.

4. **Show Item Info** (like Windows status bar):
   - In Finder, go to `View > Show Status Bar`. This shows folder size and item count at the bottom, like Explorer’s details.

5. **Open Folders in New Windows** (like Windows default behavior):
   - Finder > Preferences > General > Uncheck "Open folders in tabs instead of new windows" to mimic Windows’ separate window style.

> **Tip**: Drag frequently used folders (e.g., Documents, Downloads) to the sidebar for quick access, like pinned items in Windows. Use `Command + Up` to go up a folder (similar to Backspace in Explorer).

---

## Maintenance & Optimization 🧹

### System Maintenance

```bash
brew cleanup && brew autoremove && brew doctor
brew update && brew upgrade
```

### Performance Monitoring

```bash
brew install htop btop glances speedtest-cli neofetch vector grafana prometheus
```

### Disk Cleanup

```bash
brew install ncdu dust
ncdu ~
dust ~
```

---

## Troubleshooting

- **Permissions**: `sudo chown -R $(whoami) /opt/homebrew/*`
- **SSH Issues**: Verify `~/.ssh/config`.
- **OrbStack Conflicts**: Stop Docker Desktop if ports clash.
- **Kubernetes**: Check CNI plugin compatibility.

---

## Pro Tips 💡

1. **Bun for Node.js**:

   ```bash
   curl -fsSL https://bun.sh/install | bash
   bun init
   bun install
   ```

2. **Faster Navigation**:

   ```bash
   zoxide init zsh >> ~/.zshrc
   z myproject  # Jumps to ~/myproject
   ```

3. **Virtualization** (Optional):

   ```bash
   brew install --cask utm  # Lightweight VMs
   ```
