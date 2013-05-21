alias subl="/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl"
alias ding="afplay /System/Library/Sounds/Glass.aiff"
alias dot="cd ~/dotfiles && subl ."
alias ohmyzsh="subl ~/.oh-my-zsh"
alias ss="python -m SimpleHTTPServer"
alias tb="bundle exec torquebox run -b 0.0.0.0"
alias zshconfig="subl ~/.zshrc"

# diff full-width, c/o http://unix.stackexchange.com/a/9303
alias diff='diff -W $(( $(tput cols) - 2 ))'

# Jux-specific
alias jux="cd ~/dev/surround/ && git pull && open surround.sublime-project"
# alias cmp="open \"https://github.com/jux/jux/compare/deployed...`git rev-parse --symbolic-full-name --abbrev-ref HEAD`?w=1\""

# open DigitalColor Meter, displaying hex
alias color="osascript ~/.color_meter.scpt"

# PostgreSQL commands
alias pgstart="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pgstop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"


# do inline replace for all files in given dir
#
#   $ rep . foo bar
function rep {
  perl -e "s/$2/$3/g;" -pi $(find $1 -type f)
}


## Git stuff ##

# delete merged branches
alias bclean='git branch --merged | grep -v "\\*" | xargs -n 1 git branch -d'

alias rbp="git pull --rebase && git push"

# most recent branches not merged into `deployed`
function undeployed {
  git for-each-ref --sort=-committerdate --format="%(committerdate:short) %(refname:short)" --count=15 $(git branch -r --no-merged origin/deployed | grep -v HEAD | sed -e 's#^ *#refs/remotes/#')
}
