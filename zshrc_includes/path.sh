# Homebrew
export PATH=/usr/local/bin:$PATH
export PATH="/usr/local/sbin:$PATH"

export PATH=$HOME/bin:$PATH
export PATH=$HOME/dotfiles/bin:$PATH
export PATH=./node_modules/.bin:$PATH # add NodeJS modules from working directory
export PATH=$PATH:$GOPATH/bin
export PATH=$HOME/dev/git-plugins/bin:$PATH
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export PATH="$PATH:/usr/local/share/git-core/contrib/diff-highlight"

if [[ "$OSTYPE" == "darwin"* ]]; then
  # https://coderwall.com/p/nl-bdg/more-readable-git-word-diff-on-osx
  export PATH=$PATH:`brew --prefix git`/share/git-core/contrib/diff-highlight
fi

