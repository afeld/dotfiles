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


# do inline replace for all files in given dir
#
#   $ rep . foo bar
function rep {
  perl -e "s/$2/$3/g;" -pi $(find $1 -type f)
}


## Git stuff ##

# "branch clean": delete branches merged into the current one
alias bclean='git branch --merged | grep -v "\\*" | xargs -n 1 git branch -d'
# "remote branch clean": same as above, on origin
function rbclean {
  git remote prune origin
  git branch -r --merged | grep origin/ | grep -v "HEAD\|master" | sed "s/^.*\//:/" | xargs git push origin
}

alias rbp="git pull --rebase && git push"

# most recent branches not merged into `deployed`
function undeployed {
  git for-each-ref --sort=-committerdate --format="%(committerdate:short) %(refname:short)" --count=15 $(git branch -r --no-merged origin/deployed | grep -v HEAD | sed -e 's#^ *#refs/remotes/#')
}

# display the top contributors to a file
# http://www.commandlinefu.com/commands/view/3889/prints-per-line-contribution-per-author-for-a-git-repository
#
#   $ fault app/models/user.rb
function fault {
  git blame -w -p $1 | grep '^author ' | sed 's/^author //' | sort -f | uniq -ic | sort -nr | head -n 4
}
