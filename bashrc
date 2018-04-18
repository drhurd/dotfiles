# command line color
export CLICOLOR=1

# dircolors
if [ $(which dircolors) ]; then eval `~/.dircolors .dotfiles/dircolors.ansi-dark`; fi

# golang
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/workspace/bin
export GOPATH=$HOME/workspace

# load optional config files if they exist
function source_if {
  if [ -f $1 ]; then source $1; fi
}
source_if ~/.aliases
source_if ~/.gcloudrc
source_if ~/.git-completion.bash
source_if ~/.nvm/nvm.sh
source_if ~/.secrets
source_if /usr/local/bin/virtualenvwrapper.sh

export LD_BIND_NOW=1

# basictex distribution
export PATH=/usr/texbin:"$PATH"

# rbenv
if which rbenv > /dev/null; then
	eval "$(rbenv init -)";
fi

# AIRLAB-DO-NOT-MODIFY section:ShellWrapper {{{
# Airlab will only make edits inside these delimiters.

# Source Airlab's shell integration, if it exists.
if [ -e ~/.airlab/shellhelper.sh ]; then
  source ~/.airlab/shellhelper.sh
fi
# AIRLAB-DO-NOT-MODIFY section:ShellWrapper }}}
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
