# export CC=/usr/bin/gcc-4.2

# without this, JRuby treats 'next' as 'step' - http://kenai.com/projects/jruby/pages/UsingTheJRubyDebugger
export JRUBY_OPTS="$JRUBY_OPTS --debug"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
