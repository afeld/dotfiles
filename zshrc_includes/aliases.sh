# https://github.com/codeclimate/codeclimate#usage
alias cc="docker run \
  --interactive --tty --rm \
  --env CODECLIMATE_CODE=\"$PWD\" \
  --volume \"$PWD\":/code \
  --volume /var/run/docker.sock:/var/run/docker.sock \
  --volume /tmp/cc:/tmp/cc \
  codeclimate/codeclimate"
alias ding="afplay /System/Library/Sounds/Glass.aiff"
alias dotfiles="cd ~/dotfiles && atom ."
alias k=kubectl
alias git=hub
alias g=git
alias ss="python3 -m http.server"
alias t=terraform

# diff full-width, c/o http://unix.stackexchange.com/a/9303
alias diff='diff -W $(( $(tput cols) - 2 ))'

# https://github.com/18F/open-source-policy/blob/master/practice.md#how-to-license-18f-repos
alias insert-license="wget -q https://raw.githubusercontent.com/18F/open-source-policy/master/LICENSE.md"
alias insert-contrib="wget -q https://raw.githubusercontent.com/18F/open-source-policy/master/CONTRIBUTING.md"
alias 18f-init="insert-license && insert-contrib && echo 'Licensed.'"
alias insert-gsa-license="curl -sO https://raw.githubusercontent.com/GSA/open-source-policy/master/LICENSE.md"
alias insert-gsa-contrib="curl -sO https://raw.githubusercontent.com/GSA/open-source-policy/master/CONTRIBUTING.md"
alias GSA-init="insert-gsa-license && insert-gsa-contrib && echo 'Licensed.'"

# projects
alias cm="cd $GOPATH/src/github.com/opencontrol/compliance-masonry/"

## Git stuff ##

alias rbp="git pull --rebase && git push"

# most recent branches not merged into `upstream/master`
function unreleased {
  git for-each-ref --sort=-committerdate --format="%(committerdate:short) %(refname:short)" --count=15 $(git branch -r --no-merged upstream/master | grep -v HEAD | sed -e 's#^ *#refs/remotes/#')
}
