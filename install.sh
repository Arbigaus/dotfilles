#! /bin/zsh

if [[ $(command -v brew) == "" ]]; then
  echo "Installing Hombrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo "Updating Homebrew"
  brew update
fi
echo "Homebrew installed"

echo "Installing Alacritty and and terminal configs"
brew install --cask alacritty 
brew install font-meslo-lg-nerd-font 
brew install powerlevel10k 
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
brew install eza 
brew install tmux
brew install nodejs
brew install lazygit
brew install nvim
brew install stow
brew install bat

[ ! -d ~/.oh-my-zsh ] && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Configuring the dotfiles"
stow . --ignore install.sh

echo "Installing Cocoapods"
brew install cocoapods
brew install git-svn

echo "Setting Alacritty theme"
mkdir -p ~/.config/alacritty/themes &&
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
