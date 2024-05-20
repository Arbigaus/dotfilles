# Before use this file, run all commands below
#
# brew tap homebrew/cask-fonts
# brew install --cask alacritty
# brew install font-meslo-lg-nerd-font
# brew install powerlevel10k
# brew install zsh-autosuggestions
# brew install zsh-syntax-highlighting
# brew install eza

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme config
source /usr/local /share/powerlevel10k/powerlevel10k.zsh-theme
source /usr/local/share/powerlevel10k/powerlevel10k.zsh-theme

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
unset ZSH_AUTOSUGGEST_USE_ASYNC

# Auto-update behavior
zstyle ':omz:update' mode auto      # update automatically without asking

# Plugins
plugins=(git colorize sudo)
source $ZSH/oh-my-zsh.sh

# Aliases
alias gcr="gco regressao"
alias xx="xed ."
alias ios-simulator="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"
alias cdd="rm -rf ~/Library/Developer/Xcode/DerivedData/"
alias ls="eza --icons=always"
alias ll="ls -lah"
alias nv="nvim"
