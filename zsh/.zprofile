eval "$(/opt/homebrew/bin/brew shellenv)"

# Personal environment variables
# Add local ~/scripts to PATH
export PATH="$HOME/scripts:$PATH"
# Git projects directory for sketchybar git toolkit
export PROJECTS_DIR="$HOME/Code"

export LANG=en_US.UTF-8

# XDG Base Directory Specification
# https://specifications.freedesktop.org/basedir/latest/
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_DIRS="/etc/xdg"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_STATE_DIRS="/var/lib"
export XDG_CACHE_DIRS="/var/cache"

# Android SDK
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
# Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
# Java
export JAVA_HOME=$(/usr/libexec/java_home)
# Node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

export PATH=$PATH:$HOME/.maestro/bin

export EZA_CONFIG_DIR="$HOME/.config/eza"
export TEALDEER_CONFIG_DIR="$HOME/.config/tealdeer"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"