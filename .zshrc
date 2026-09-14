#
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Android SDK Paths
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin

# Java (Zulu JDK 17 - React Native)
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home

# Theme config
if [[ $(echo $HOMEBREW_PREFIX) == "" ]]; then
  export HOMEBREW_PREFIX=$(brew --prefix)
fi

# source $HOMEBREW_PREFIX/share/powerlevel10k/powerlevel10k.zsh-theme
 source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
 source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Mise config
# eval "$(~/.local/bin/mise activate zsh)"

# chruby config
# source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh
# source $(brew --prefix)/opt/chruby/share/chruby/auto.sh
# chruby ruby-3.3.5

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Auto-update behavior
zstyle ':omz:update' mode auto      # update automatically without asking

# Plugins
plugins=(git colorize sudo)
source $HOME/.oh-my-zsh/oh-my-zsh.sh

# Aliases
alias rn-new="npx @react-native-community/cli init"
alias rn-ios="npx react-native run-ios"
alias rn-android="npx react-native run-android"
alias xx="xed ."
alias x="xed"
alias ios-simulator="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"
alias cdd="rm -rf ~/Library/Developer/Xcode/DerivedData/"
alias ls="eza --icons=always"
alias ll="ls -lah"
alias nv="nvim"
alias cat="bat"
alias lg="lazygit"
alias c="clear"
alias ta="tmux a"
alias pj="cd ~/Projects"
# alias tmux="$HOME/dotfilles/start_tmux.sh"
# alias connect-mine="$HOME/Documents/Minecraft/connect-minecraft.sh"
# alias start-mine="curl 'https://wortlt3na5a3fql32oxehe3rzq0cihsx.lambda-url.us-east-2.on.aws/?instanceId=i-0fd4a4f5dd1a3963f'"
# alias stop-mine="curl 'https://wortlt3na5a3fql32oxehe3rzq0cihsx.lambda-url.us-east-2.on.aws/?instanceId=i-0fd4a4f5dd1a3963f&action=stop'"

# Python user scripts
export PATH="$HOME/Library/Python/3.9/bin:$PATH"

# Rust / Cargo
export PATH="$HOME/.cargo/bin:$PATH"

# bun completions
[ -s "/Users/arbigaus/.bun/_bun" ] && source "/Users/arbigaus/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/gruvbox.omp.json)"
