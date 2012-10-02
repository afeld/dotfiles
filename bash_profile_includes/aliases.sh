alias rbp="git pull --rebase && git push"
alias zshconfig="subl ~/.zshrc"
alias ohmyzsh="subl ~/.oh-my-zsh"

# Jux-specific
alias jux="cd ~/dev/surround/ && git pull && open surround.sublime-project"
# alias cmp="open \"https://github.com/jux/jux/compare/deployed...`git rev-parse --symbolic-full-name --abbrev-ref HEAD`?w=1\""

# open DigitalColor Meter, displaying hex
alias color="osascript ~/.color_meter.scpt"

alias pgstart="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pgstop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"
