#
# HELPER FUNCTIONS
# ------------------------------
# Defines helper functions to be used later on
# brew_if runs brew install [program] if [program] is not installed
function brew_if {
  if [ -z `which $1` ]; then
    brew install $1
  fi
}

#
# SYMLINK DOTFILES
# ------------------------------
# Links all dotfiles into home directory
ln ~/.dotfiles/aliases ~/.aliases
ln ~/.dotfiles/bash_profile ~/.bash_profile
ln ~/.dotfiles/bashrc ~/.bashrc
ln ~/.dotfiles/git-completion.bash ~/.git-completion.bash
ln ~/.dotfiles/tmux.conf ~/.tmux.conf
ln ~/.dotfiles/vimrc ~/.vimrc

#
# VIM SETUP
# ------------------------------
# Links all dotfiles into home directory

# TODO

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

