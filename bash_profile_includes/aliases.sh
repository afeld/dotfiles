alias subl="/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl"
alias ding="afplay /System/Library/Sounds/Glass.aiff"
alias dot="cd ~/dotfiles && subl ."
alias ohmyzsh="subl ~/.oh-my-zsh"
alias ss="python -m SimpleHTTPServer"
alias zshconfig="subl ~/.zshrc"

# diff full-width, c/o http://unix.stackexchange.com/a/9303
alias diff='diff -W $(( $(tput cols) - 2 ))'

# PostgreSQL commands
alias pgstart="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pgstop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"


function update {
  sudo port selfupdate
  brew update

  rvm get stable
  gem update --system
  gem update bundler

  npm update -g
}


# do inline replace for all files in given dir
#
#   $ rep . foo bar
function rep {
  perl -e "s/$2/$3/g;" -pi $(find $1 -type f)
}

# create a new project directory with the given name
#
#   $ mkproj foo
function mkproj {
  if [ "$1" == "" ]; then
    echo -e "ERROR: please provide a project name.\n\n\t\$ mkproj foo"
  else
    cd ~/dev
    mkdir $1
    cd $1
    git init
    subl .
  fi
}


## Git stuff ##

alias rbp="git pull --rebase && git push"

# most recent branches not merged into `upstream/master`
function unreleased {
  git for-each-ref --sort=-committerdate --format="%(committerdate:short) %(refname:short)" --count=15 $(git branch -r --no-merged upstream/master | grep -v HEAD | sed -e 's#^ *#refs/remotes/#')
}
