# Chef assumes that it owns this file.
# Additions to bash should be placed into /Users/aidan/.bash_profile_includes with a .sh extension

for file in ~/.bash_profile_includes/*.sh; do
  [[ -r $file ]] && source $file;
done

# {{{
# Node Completion - Auto-generated, do not touch.
shopt -s progcomp
for f in $(command ls ~/.node-completion); do
  f="$HOME/.node-completion/$f"
  test -f "$f" && . "$f"
done
# }}}
[[ -s /Users/aidan/.nvm/nvm.sh ]] && . /Users/aidan/.nvm/nvm.sh # This loads NVM
