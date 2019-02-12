export NVM_DIR="$HOME/.nvm"
# https://github.com/creationix/nvm/issues/1277#issuecomment-447495610
# https://github.com/creationix/nvm/issues/539#issuecomment-245791291
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh" --no-use

alias node='unalias node ; unalias npm ; nvm use default ; node $@'
alias npm='unalias node ; unalias npm ; nvm use default ; npm $@'
