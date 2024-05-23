#
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme config
if [[ $(echo $HOMEBREW_PREFIX) == "" ]]; then
  export HOMEBREW_PREFIX="/usr/local"
fi

source $HOMEBREW_PREFIX/share/powerlevel10k/powerlevel10k.zsh-theme
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

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
alias cat="bat"
