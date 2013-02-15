#!/bin/sh
# based on https://github.com/ahri/dotfiles/blob/master/write-links.sh

# Die on failures
set -e

# Echo all commands
# set -x

command_exists () {
  type "$1" &> /dev/null ;
}


script="`python -c 'import os,sys;print os.path.realpath(sys.argv[1])' "$0"`" #"`readlink -f "$0"`"
dir="`dirname "$script"`"

# symlink dotfiles/folders
find "$dir" -maxdepth 1 | while read file; do

  case "$file" in
    "$dir"|"$dir/.git"|"$dir/.gitignore"|"$dir/README.markdown"|*.swp|"$script")
      continue
      ;;
  esac
  
  name=".`basename $file`"
  rm -rf "$HOME/$name"
  ln -s "$file" "$HOME/$name"
done


# symlink Sublime Text files
rm -rf $HOME/Library/Application\ Support/Sublime\ Text\ 2
ln -s $dir/sublime-text-2 $HOME/Library/Application\ Support/Sublime\ Text\ 2


# Homebrew
if ! command_exists brew; then
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
  echo "...Homebrew installed"
fi
brew -v
sudo chown -R $USER /usr/local/Cellar
brew update


# ack
if ! command_exists ack; then
  echo "Installing ack..."
  brew install ack
  echo "...ack installed"
fi


# RVM
if ! command_exists rvm; then
  echo "Installing RVM..."
  curl -L https://get.rvm.io | bash -s stable
  echo "...RVM installed"
  source ~/.zshrc
fi
rvm -v


# nvm
if ! command_exists nvm; then
  echo "Installing nvm..."
  curl https://raw.github.com/creationix/nvm/master/install.sh | sh
  echo "...nvm installed"
fi
