# Chef assumes that it owns this file.
# Additions to bash should be placed into /Users/aidan/.bash_profile_includes with a .sh extension

for file in ~/.bash_profile_includes/*.sh; do
  [[ -r $file ]] && source $file;
done

[[ -s /Users/aidan/.nvm/nvm.sh ]] && . /Users/aidan/.nvm/nvm.sh # This loads NVM

export GOPATH=$HOME/dev/go

# set up X11 for use in normal terminal
#alias x11='export DISPLAY=:0 && open /Applications/Utilities/X11.app'

# this should go last, since the PATH order it sets is important
source /opt/boxen/env.sh
