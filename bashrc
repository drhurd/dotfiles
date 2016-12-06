# command line color
export CLICOLOR=1

# dircolors
if [ $(which dircolors) ]; then eval `dircolors .dotfiles/dircolors.ansi-dark`; fi

# golang
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/workspace/go/bin
export GOPATH=$HOME/workspace

source ~/.nvm/nvm.sh
source ~/.git-completion.bash
source ~/.secrets

export LD_BIND_NOW=1

# basictex distribution
export PATH=/usr/texbin:"$PATH"

### Common commands
alias sublime="open -a /Applications/Sublime\ Text\ 2.app/ ."
alias tab="open -a /Applications/iTerm.app/ "

# rbenv
if which rbenv > /dev/null; then
	eval "$(rbenv init -)";
fi
