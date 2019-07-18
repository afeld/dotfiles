#!/bin/bash
# based on https://github.com/ahri/dotfiles/blob/master/write-links.sh

# Die on failures
set -e

# Echo all commands
# set -x

command_exists () {
  type "$1" &> /dev/null ;
}

# homebrew
if command_exists brew; then
  brew update
else
  echo "Installing brew..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  echo "...brew installed"
fi

brew bundle

pipenv install
pipenv run ansible-playbook -i localhost, -c local --ask-become-pass install.yml

echo "DONE"
