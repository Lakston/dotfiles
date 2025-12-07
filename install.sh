#!/usr/bin/env bash

set -e

echo "🔧 Starting installation..."

### --------------------------------------------------
### Detect macOS
### --------------------------------------------------
if [[ "$(uname)" != "Darwin" ]]; then
  echo "❌ This script currently only supports macOS."
  exit 1
fi
echo "🖥  macOS detected."

### --------------------------------------------------
### Install Xcode Command Line Tools
### --------------------------------------------------
echo "🔍 Checking for Xcode Command Line Tools..."
if ! xcode-select -p >/dev/null 2>&1; then
  echo "📦 Installing Xcode Command Line Tools..."
  xcode-select --install
  echo "⏳ Waiting for installation..."
  until xcode-select -p >/dev/null 2>&1; do sleep 5; done
else
  echo "✅ Xcode Command Line Tools already installed."
fi

### --------------------------------------------------
### Install Homebrew
### --------------------------------------------------
if ! command -v brew >/dev/null 2>&1; then
  echo "🍺 Homebrew not found. Installing..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo "🍺 Homebrew already installed."
fi

### --------------------------------------------------
### Add taps
### --------------------------------------------------
echo "🔗 Adding Homebrew taps..."
brew tap FelixKratz/formulae

### --------------------------------------------------
### Update Homebrew
### --------------------------------------------------
echo "📦 Updating Homebrew..."
brew update

### --------------------------------------------------
### Install Utilities
### --------------------------------------------------
echo "⚙️ Installing utilities..."
brew install bash
brew install zsh
brew install git
brew install wget
brew install jq # json processor
brew install tmux
brew install ripgrep # grep replacement
brew install fzf
brew install bat # cat replacement
brew install node
brew install n # node version manager
brew install lua # required for sketchybar
brew install stow # dotfiles symlink manager
brew install gromgit/brewtils/taproom # brew packages manager

### --------------------------------------------------
### Install Zsh ecosystem
### --------------------------------------------------
echo "🐚 Installing Zsh plugins & tools..."
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting 
brew install starship # customizable shell prompt
brew install superfile # file manager
brew install zoxide # smart directory navigation
brew install atuin # shell history
brew install tealdeer # fast `tldr` client
brew install eza # modern `ls` replacement

### Run fzf install script for shell integration
echo "⚡ Setting up fzf shell integration..."
"$(brew --prefix)/opt/fzf/install" --all --no-bash --no-fish

### --------------------------------------------------
### Install GUI apps / Casks
### --------------------------------------------------
echo "🖥 Installing GUI apps..."
brew install --cask firefox
brew install --cask zen
brew install --cask aerospace
brew install --cask sketchybar
brew install --cask vlc
brew install --cask raycast
brew install --cask karabiner-elements
brew install --cask github
brew install --cask lazygit
brew install --cask ghostty # terminal emulator

### --------------------------------------------------
### Install Fonts
### --------------------------------------------------
echo "🔤 Installing fonts..."
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
brew install --cask font-jetbrains-mono
brew install --cask font-fira-code

### --------------------------------------------------
### Fun / Extras
### --------------------------------------------------
brew install borders

### --------------------------------------------------
### Sketchybar Extras
### --------------------------------------------------
(git clone https://github.com/FelixKratz/SbarLua.git /tmp/SbarLua && cd /tmp/SbarLua/ && make install && rm -rf /tmp/SbarLua/)
brew install daipeihust/tap/im-select

### --------------------------------------------------
### macOS settings
### --------------------------------------------------
echo "🛠 configuring macOS settings..."
defaults write com.apple.dock autohide -bool true
defaults write NSGlobalDomain _HIHideMenuBar -bool true

### --------------------------------------------------
### Starting Services
### --------------------------------------------------
echo "Starting Services (grant permissions)..."
brew services start sketchybar
brew services start borders

### --------------------------------------------------
### Stow Dotfiles (Create Symlinks)
### --------------------------------------------------
echo "🔗 Setting up dotfiles symlinks..."

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Check if we're in the dotfiles directory
if [[ ! -f "$SCRIPT_DIR/.stow-local-ignore" ]]; then
  echo "⚠️  Warning: .stow-local-ignore not found. Make sure you're running this from the dotfiles directory."
  echo "   Current directory: $SCRIPT_DIR"
  read -p "Continue anyway? (y/n) " -n 1 -r
  echo
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit 1
  fi
fi

# Change to dotfiles directory
cd "$SCRIPT_DIR"

# List of packages to stow (matching directory names)
PACKAGES=(
  aerospace
  atuin
  bat
  borders
  eza
  ghostty
  karabiner
  sketchybar
  starship
  superfile
  tealdeer
  zsh
)

# Check if stow is available
if ! command -v stow >/dev/null 2>&1; then
  echo "❌ stow is not installed. Please install it first: brew install stow"
  exit 1
fi

# Stow each package
for package in "${PACKAGES[@]}"; do
  if [[ -d "$package" ]]; then
    echo "  📦 Stowing $package..."
    # Use --adopt to handle any existing files gracefully
    # This will move existing files into dotfiles and create symlinks
    if stow --adopt -t ~ "$package" 2>/dev/null; then
      echo "    ✅ $package stowed successfully"
    else
      # If --adopt fails (e.g., no conflicts), try normal stow
      if stow -t ~ "$package" 2>/dev/null; then
        echo "    ✅ $package stowed successfully"
      else
        echo "    ⚠️  $package: stow failed (may already be stowed or have conflicts)"
      fi
    fi
  else
    echo "  ⚠️  Package $package not found, skipping..."
  fi
done

echo "✅ Dotfiles symlinks created!"

### --------------------------------------------------
### Done
### --------------------------------------------------
echo "🎉 macOS setup complete!"
echo "✅ All packages installed and dotfiles symlinked!"
echo ""
echo "Next steps:"
echo "  - Restart your terminal or run: source ~/.zshrc"
echo "  - Grant necessary permissions when prompted"
echo "  - Configure any additional settings as needed"
