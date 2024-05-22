!# /bin/zsh

echo "Installing Homebrew"
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
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

echo "Configuring the dotfiles"
stow .

echo "Installing Cocoapods"
brew install cocoapods
