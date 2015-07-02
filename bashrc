### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH=$PATH:/usr/local/Cellar
export PATH=$PATH:/usr/local/opt/mysql/bin
export PATH=/usr/local/bin:$PATH

# command line color
export CLICOLOR=1

# golang
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/Developer/go/bin
export GOPATH=$HOME/Developer/go/

source ~/.nvm/nvm.sh
source ~/.git-completion.bash

export LD_BIND_NOW=1

# postgres ruby gem flag
export ARCHFLAGS="-arch x86_64"

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PYTHONPATH="/usr/local/lib/python2.7/site-packages"

# basictex distribution
export PATH=/usr/texbin:"$PATH"

### Common commands
alias sublime="open -a /Applications/Sublime\ Text\ 2.app/ ."
alias tab="open -a /Applications/iTerm.app/ "
alias dockervm='eval "$(boot2docker shellinit)"'
alias rmdd="rm -rf ~/Library/Developer/DerivedData"

# rbenv
if which rbenv > /dev/null; then 
	eval "$(rbenv init -)"; 
fi
