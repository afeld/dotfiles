#!/bin/bash
# based on https://github.com/ahri/dotfiles/blob/master/write-links.sh

# Die on failures
set -e

# Echo all commands
# set -x

# https://stackoverflow.com/a/3572105
realpath() {
  [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
}

command_exists () {
  type "$1" &> /dev/null ;
}

script=$(realpath "$0")
dir=$(dirname "$script")

# symlink dotfiles/folders
find "$dir" -maxdepth 1 | while read -r file; do

  case "$file" in
    "$dir"|"$dir/.git"|"$dir/.gitignore"|"$dir/README.md"|"$dir/Brewfile"|"$dir/vscode"|"$dir/com.googlecode.iterm2.plist"|"$dir/zshrc_includes"|"$dir/itunes_app_updater.scpt"|*.swp|"$script")
      continue
      ;;
  esac

  name=".$(basename "$file")"
  rm -rf "${HOME:?}/$name"
  ln -s "$file" "$HOME/$name"
done


if [[ "$OSTYPE" == "darwin"* ]]; then
  rm -rf ~/Library/Application\ Support/Code/User/settings.json
  ln -s "$(realpath vscode/settings.json)" ~/Library/Application\ Support/Code/User/settings.json

  # homebrew
  if command_exists brew; then
    brew update
  else
    echo "Installing brew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    echo "...brew installed"
  fi

  brew bundle

  # https://github.com/afeld/git-setup
  curl -fsSL https://raw.githubusercontent.com/afeld/git-setup/master/setup.sh | sh

  # https://github.com/18F/laptop#want-to-install-just-git-seekret
  curl -s https://raw.githubusercontent.com/18F/laptop/master/seekrets-install | bash -
fi


git_plugins=~/dev/git-plugins
if [ ! -d $git_plugins ]; then
  echo "Installing git-plugins..."
  git clone https://github.com/afeld/git-plugins $git_plugins
  echo "...git-plugins installed"
fi

# use ZShell as default
echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "...oh-my-zsh installed"

echo "DONE"
