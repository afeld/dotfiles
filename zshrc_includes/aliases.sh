alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias ding="afplay /System/Library/Sounds/Glass.aiff"
alias dot="cd ~/dotfiles && atom ."
alias ss="python -m SimpleHTTPServer"

# diff full-width, c/o http://unix.stackexchange.com/a/9303
alias diff='diff -W $(( $(tput cols) - 2 ))'


function update {
  brew update

  gem update --system
  gem update bundler

  npm update -g

  cd ~/.atom
  apm upgrade -c false
  cd -
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
    atom .
  fi
}


## Git stuff ##

alias rbp="git pull --rebase && git push"

# most recent branches not merged into `upstream/master`
function unreleased {
  git for-each-ref --sort=-committerdate --format="%(committerdate:short) %(refname:short)" --count=15 $(git branch -r --no-merged upstream/master | grep -v HEAD | sed -e 's#^ *#refs/remotes/#')
}