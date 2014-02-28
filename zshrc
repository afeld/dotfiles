# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Report CPU usage for commands running longer than 10 seconds
# http://nuclearsquid.com/writings/reporttime-in-zsh/
REPORTTIME=10

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(gem git heroku node npm)

source $ZSH/oh-my-zsh.sh

export EDITOR=vim
export GOPATH=$HOME/dev/go
export PYTHONPATH="/usr/local/lib/python2.7/site-packages:$PYTHONPATH"

for file in ~/.zshrc_includes/*.sh; do
  [[ -r $file ]] && source $file;
done

source /opt/boxen/env.sh

# http://superuser.com/a/221291
setopt extended_glob

# added by travis gem
source /Users/afeld/.travis/travis.sh
