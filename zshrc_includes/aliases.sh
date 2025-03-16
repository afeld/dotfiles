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

# add and retrieve secrets from macOS Keychain, based on
# https://medium.com/@johnjjung/how-to-store-sensitive-environment-variables-on-macos-76bd5ba464f6
function setpass {
  security add-generic-password -a "$USER" -s "$1" -w
}
function getpass {
  security find-generic-password -a "$USER" -s "$1" -w
}

# opens the current directory in a given Docker image
function docker-run {
  docker run --rm -it --volume "$(pwd):/home/app" --workdir /home/app "$@"
}
# https://www.unixtutorial.org/docker-stop-all-containers/#docker-stop-all-containers
function docker-stop-all {
  docker stop $(docker ps -q)
}

