# https://github.com/codeclimate/codeclimate#usage
alias cc="docker run \
  --interactive --tty --rm \
  --env CODECLIMATE_CODE=\"$PWD\" \
  --volume \"$PWD\":/code \
  --volume /var/run/docker.sock:/var/run/docker.sock \
  --volume /tmp/cc:/tmp/cc \
  codeclimate/codeclimate"
alias ding="afplay /System/Library/Sounds/Glass.aiff"
alias dotfiles="cd ~/dotfiles && code ."
alias git=hub
alias g=git
alias ss="python3 -m http.server"
alias t=terraform

# diff full-width, c/o http://unix.stackexchange.com/a/9303
alias diff='diff -W $(( $(tput cols) - 2 ))'

## Git stuff ##

alias rbp="git pull --rebase && git push"

# most recent branches not merged into `upstream/master`
function unreleased {
  git for-each-ref --sort=-committerdate --format="%(committerdate:short) %(refname:short)" --count=15 $(git branch -r --no-merged upstream/master | grep -v HEAD | sed -e 's#^ *#refs/remotes/#')
}
