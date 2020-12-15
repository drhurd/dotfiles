# prompt: http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Prompt-Expansion
export PS1="%m %1d%# "

# command line color
export CLICOLOR=1

export LD_BIND_NOW=1

# load optional config files if they exist
function source_if {
  if [ -f $1 ]; then source $1; fi
}
source_if ~/.secrets

# git autocomplete: https://dev.to/oliverspryn/adding-git-completion-to-zsh-26id
fpath=(~/.zsh $fpath)
autoload -Uz compinit && compinit

## env managers are bulky and slow to load for every shell start, so I wrap them
# rbenv
function load_rbenv {
  if which rbenv > /dev/null; then
          eval "$(rbenv init -)";
  fi
}

# nvm
function load_nvm {
  export NVM_DIR="~/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
}

