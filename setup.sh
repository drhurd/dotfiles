#
# HELPER FUNCTIONS
# ------------------------------
# Defines helper functions to be used later on
# brew_if runs brew install [program] if [program] is not installed
function brew_if {
  if [[ -z "`which $1`" && -n "`which brew`" ]]; then
    brew install $1
  fi
}

#
# SYMLINK DOTFILES
# ------------------------------
# Links all dotfiles into home directory
ln -s ~/.dotfiles/zshenv ~/.zshenv
ln -s ~/.dotfiles/zshrc ~/.zshrc
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/vimrc ~/.vimrc
ln -s ~/.dotfiles/zsh ~/.zsh

#
# VIM SETUP
# ------------------------------
# Links all dotfiles into home directory
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

#
# UTILITIES
# ------------------------------
# Installs a list of utilities that I consider fairly essential

# homebrew
if [[ -z `which brew` && `uname -s` == 'Darwin' ]]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# other utilities
brew_if tmux
brew_if ag

