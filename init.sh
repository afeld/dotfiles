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
  # https://brew.sh/#install
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo "...brew installed"
fi

# ignore failure (for already-installed applications)
brew bundle || true

pipx run \
  --spec ansible~=11.3 \
  ansible-playbook -i localhost, -c local install.yml

echo "DONE"
