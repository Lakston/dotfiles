# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# echo source ~/.bash_profile

# load env vars from .zprofile into the shells
[[ -f ~/.zprofile ]] && source ~/.zprofile

# Starship 
# bindkey -v
# if [[ "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select" || \
#       "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select-wrapped" ]]; then
#     zle -N zle-keymap-select "";
# fi
eval "$(starship init zsh)"

# Zoxide
eval "$(zoxide init zsh)"

# FZF
eval "$(fzf --zsh)"

# Atuin
eval "$(atuin init zsh)"

# FZF with Git right in the shell by Junegunn 
# Keymaps for this is available at https://github.com/junegunn/fzf-git.sh
source ~/scripts/fzf-git.sh

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh


#|--------------------------------------------------
#| ALIASES
#|--------------------------------------------------
#| ZSH / BASH / BREW
#|--------------------------------------------------
alias zshs="source ~/.zshrc"
alias zshc="cursor ~/.zshrc"
alias bi="brew install"
alias bu="brew update"
alias bus="brew upgrade"
alias bcl="brew cleanup"
alias bcln="brew cleanup --prune=all"
alias bclna="brew cleanup --prune=all --dry-run"

#|--------------------------------------------------
#| GIT
#|--------------------------------------------------
alias ga="git add ."
alias gs="git status -s"
alias gc='git commit -m'
alias gc="git checkout"
alias gcb="git checkout -b"
alias glg="git log --color --graph --abbrev-commit
           --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset'"
alias glog="git log --stat --graph --pretty=oneline --abbrev-commit --date=relative"
alias gprune="git branch --merged | egrep -v '(^\*|master|dev)' | xargs git branch -d"
alias gtags="git log --tags --simplify-by-decoration --pretty='format:%ai %d.'"

#|--------------------------------------------------
#| NPM
#|--------------------------------------------------
alias nrd="npm run dev"
alias remnode="rm -rf node_modules yarn-lock.json"

#|--------------------------------------------------
#| YARN
#|--------------------------------------------------
alias y="yarn"
alias yanr="yarn"
alias ya="yarn add"
alias yad="yarn add -D"
alias yr="yarn remove"
alias yu="yarn upgrade"
alias ys="yarn start"
alias ysr="yarn start --reset-cache"
alias yand="yarn android"

#|--------------------------------------------------
#| REACT NATIVE
#|--------------------------------------------------
alias podi="cd ios && pod install && cd .."
alias podd="cd ios && rm Podfile.lock && pod deintegrate && cd .."
alias podru="cd ios && pod install --repo-update && cd .."
alias adbr="adb reverse tcp:8081 tcp:8081"
alias adbd="adb devices"

#|--------------------------------------------------
#| REACT NATIVE TOOLS
#|--------------------------------------------------
alias wdel="watchman watch-del '.' ; watchman watch-project '.'"
alias goall="yarn rn-game-over --all"
alias goa="yarn rn-game-over -a"
alias goi="yarn rn-game-over -o"


alias showfiles="defaults write com.apple.finder AppleShowAllFiles YES && killall Finder /System/Library/CoreServices/Finder.app"
alias hidefiles="defaults write com.apple.finder AppleShowAllFiles NO && killall Finder /System/Library/CoreServices/Finder.app"
alias ls="eza --color=always --long --git --no-user --no-time --icons=always --no-permissions"
alias lstree="eza --color=always --git --no-user --no-time --icons=always --no-permissions --tree --level=2"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
