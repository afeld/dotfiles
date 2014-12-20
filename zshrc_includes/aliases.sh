alias ding="afplay /System/Library/Sounds/Glass.aiff"
alias dot="cd ~/dotfiles && atom ."
alias git=hub
alias ss="python -m SimpleHTTPServer"

# diff full-width, c/o http://unix.stackexchange.com/a/9303
alias diff='diff -W $(( $(tput cols) - 2 ))'
export NVM_DIR=~/.nvm


## Git stuff ##

alias rbp="git pull --rebase && git push"

# most recent branches not merged into `upstream/master`
function unreleased {
  git for-each-ref --sort=-committerdate --format="%(committerdate:short) %(refname:short)" --count=15 $(git branch -r --no-merged upstream/master | grep -v HEAD | sed -e 's#^ *#refs/remotes/#')
}
