#!/bin/sh
# based on https://github.com/ahri/dotfiles/blob/master/write-links.sh

# Die on failures
set -e

# Echo all commands
# set -x

command_exists () {
  type "$1" &> /dev/null ;
}

brew_install () {
  # http://stackoverflow.com/a/20802425/358804
  if [ -z "brew ls --versions $1" ]; then
    echo "$1 doesn't exist"
    brew install $1
  fi
}


script="`python -c 'import os,sys;print os.path.realpath(sys.argv[1])' "$0"`" #"`readlink -f "$0"`"
dir="`dirname "$script"`"

# symlink dotfiles/folders
find "$dir" -maxdepth 1 | while read file; do

  case "$file" in
    "$dir"|"$dir/.git"|"$dir/.gitignore"|"$dir/README.md"|"$dir/Brewfile"|"$dir/com.googlecode.iterm2.plist"|"$dir/zshrc_includes"|"$dir/itunes_app_updater.scpt"|*.swp|"$script")
      continue
      ;;
  esac

  name=".`basename $file`"
  rm -rf "$HOME/$name"
  ln -s "$file" "$HOME/$name"
done

# homebrew
if command_exists brew; then
  brew update
else
  echo "Installing brew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  echo "...brew installed"
fi

brew_install gifify
brew_install hub
brew_install nvm
brew install caskroom/cask/brew-cask
brew install tree

# RVM
if ! command_exists rvm; then
  echo "Installing RVM..."
  curl -sSL https://get.rvm.io | bash -s stable
  source ~/.zshrc
  echo "...RVM installed"
fi
rvm autolibs enable

# https://github.com/afeld/git-setup
curl -fsSL https://raw.githubusercontent.com/afeld/git-setup/master/setup.sh | sh

git_plugins=~/dev/git-plugins
if [ ! -d $git_plugins ]; then
  echo "Installing git-plugins..."
  git clone https://github.com/afeld/git-plugins $git_plugins
  echo "...git-plugins installed"
fi

# use ZShell as default
echo "Installing oh-my-zsh..."
curl -L http://install.ohmyz.sh | sh
echo "...oh-my-zsh installed"

echo "DONE"
