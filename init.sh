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

# https://docs.ansible.com/projects/ansible/latest/installation_guide/intro_installation.html#pipx-install
pipx install --include-deps 'ansible==13.*'
pipx ensurepath
ansible-playbook -i localhost, install.yml --ask-become-pass

echo "DONE"
