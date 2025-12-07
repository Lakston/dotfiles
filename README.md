# Dotfiles

Personal dotfiles configuration for macOS, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Goal

This repository provides a reproducible setup for my macOS development environment, including:

- Shell configuration (zsh with plugins)
- Terminal tools and utilities
- GUI applications
- System configuration files
- Window manager (Aerospace)
- Status bar (Sketchybar)
- Keyboard remapping (Karabiner)

## What's Included

### Shell & Terminal

- **zsh** - with autosuggestions and syntax highlighting
- **starship** - customizable shell prompt
- **atuin** - shell history
- **zoxide** - smart directory navigation
- **fzf** - fuzzy finding
- **eza** - modern `ls` replacement
- **bat** - modern `cat` replacement
- **tealdeer** - fast `tldr` client
- **taproom** - brew packages manager

### Applications

- **Aerospace** - Tiling window manager
- **Sketchybar** - Status bar
- **Ghostty** - Terminal emulator
- **Karabiner-Elements** - Keyboard customizer
- **Superfile** - Terminal file manager
- **Raycast** - Productivity launcher
- **Zen Browser**
- **Firefox Browser**
- **VLC**

### Fonts

The following fonts are installed via Homebrew for use in terminals and editors:

- **Hack Nerd Font** - Programming font with icon support (used in terminals and status bars)
- **JetBrains Mono** - Modern monospace font designed for developers
- **Fira Code** - Monospace font with programming ligatures

### Configuration Files

All configuration is organized by application in separate directories, which are symlinked to `~` using Stow.

## Installation

### Prerequisites

- macOS (currently only macOS is supported)
- An internet connection

### Quick Start

1. Clone this repository:

   ```bash
   git clone git@github.com:Lakston/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   ```

2. Run the install script:
   ```bash
   ./install.sh
   ```

The install script will:

- Install Xcode Command Line Tools (if needed)
- Install Homebrew (if needed)
- Install all required packages and applications
- Set up shell integrations
- Configure macOS system settings
- Create symlinks for all dotfiles using Stow
- Start required services

3. Restart your terminal or run:
   ```bash
   source ~/.zshrc
   ```

## How It Works

This repository uses **GNU Stow** to manage dotfiles. Stow creates symlinks from the repository to your home directory, keeping your actual config files in version control while making them available in the expected locations.

### Directory Structure

```
dotfiles/
├── zsh/           → ~/.zshrc, ~/.zprofile, etc.
├── sketchybar/    → ~/.config/sketchybar/
├── aerospace/     → ~/.config/aerospace/
├── karabiner/     → ~/.config/karabiner/
└── ...
```

Each directory represents a "package" that gets stowed to `~`.

### Manual Stow Operations

If you need to manually manage packages:

```bash
# Stow a package
stow -t ~ package-name

# Unstow a package
stow -D -t ~ package-name

# Restow a package
stow -R -t ~ package-name
```

## Caveats and Limitations

### Platform Support

- **macOS only**: The install script and many configurations are macOS-specific
- Linux/Windows support would require significant modifications

### System Requirements

- Requires Homebrew to be installed (script handles this)
- Requires bash 4+ (installed via Homebrew)
- Some applications require manual permission grants (Accessibility, etc.)

### Manual Steps Required

After running the install script, you may need to:

1. **Grant Permissions**:

   - Accessibility permissions for Karabiner-Elements, Sketchybar, Aerospace
   - Full Disk Access for some tools
   - System will prompt you when needed

2. **SSH Keys**:

   - The script doesn't set up SSH keys
   - Configure your SSH keys separately for GitHub/GitLab
   - See your `~/.ssh/config` for key management

3. **Environment Variables**:

   - `PROJECTS_DIR` is set to `$HOME/Code` in `.zprofile`
   - Adjust if your projects are in a different location

4. **Application Configuration**:
   - Some apps (like Karabiner) may need manual configuration after installation
   - Sketchybar widgets may need adjustment based on your setup

### Known Issues

- **Git Widget**: The sketchybar git widget is disabled by default due to performance concerns (can be re-enabled in `items/widgets/init.lua`)
- **Log Files**: Debug log files (like `git_debug.log`) are gitignored but may be recreated by applications
- **Stow Conflicts**: If you have existing dotfiles, Stow will attempt to adopt them, but conflicts may require manual resolution

## Customization

### Adding New Configurations

1. Create a new directory in the repo (e.g., `myapp/`)
2. Add the config structure (e.g., `myapp/.config/myapp/config.toml`)
3. Add the package name to the `PACKAGES` array in `install.sh`
4. Run `stow -t ~ myapp` or re-run the install script

### Modifying Existing Configs

Simply edit the files in the repository and they'll be reflected immediately (since they're symlinked).

## Maintenance

### Updating Packages

```bash
brew update && brew upgrade
```

### Updating Dotfiles

```bash
cd ~/dotfiles
git pull
# Restow packages if structure changed
stow -R -t ~ package-name
```

## License

Personal use only. Feel free to fork and adapt for your own needs.
