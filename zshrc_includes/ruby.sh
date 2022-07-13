# https://github.com/rbenv/ruby-build/wiki#openssl-version-compatibility
OPENSSL_1_PREFIX="$(brew --prefix openssl@1.0)"
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$OPENSSL_1_PREFIX"
