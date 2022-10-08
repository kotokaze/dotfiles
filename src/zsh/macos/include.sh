#!/usr/bin/env zsh

export PROTOBUF_ROOT="${LOCALOPT}/protobuf"

### PKG_CONFIG_PATH
PKG_CONFIG_PATH="$(brew --prefix)/lib/pkgconfig:${PKG_CONFIG_PATH}"
PKG_CONFIG_PATH="$(brew --prefix graphviz)/lib/pkgconfig:${PKG_CONFIG_PATH}"
PKG_CONFIG_PATH="$(brew --prefix tcl-tk)/lib/pkgconfig:${PKG_CONFIG_PATH}"
PKG_CONFIG_PATH="$(brew --prefix openssl@1.1)/lib/pkgconfig:${PKG_CONFIG_PATH}"
PKG_CONFIG_PATH="$(brew --prefix readline)/lib/pkgconfig:${PKG_CONFIG_PATH}"
PKG_CONFIG_PATH="$(brew --prefix qt@5)/lib/pkgconfig:${PKG_CONFIG_PATH}"
PKG_CONFIG_PATH="${LOCAL}/lib/pkgconfig:${PKG_CONFIG_PATH}"
export PKG_CONFIG_PATH

export OPENSSL_ROOT_DIR="$(brew --prefix openssl@1.1)"
export OPENSSL_PREFIX_PATH="${OPENSSL_ROOT_DIR}"

export CMAKE_PREFIX_PATH="$(brew --prefix qt@5)/lib/cmake"

export LDFLAGS="-L/usr/local/lib ${LDFLAGS}"
export CXXFLAGS="-I/usr/local/include ${CPPFLAGS}"
export CPPFLAGS="-I/usr/local/include ${CPPFLAGS}"

export LDFLAGS="-L$(brew --prefix graphviz)/lib ${LDFLAGS}"
export CXXFLAGS="-I$(brew --prefix graphviz)/include ${CPPFLAGS}"
export CPPFLAGS="-I$(brew --prefix graphviz)/include ${CPPFLAGS}"

export LDFLAGS="-L$(brew --prefix bzip2)/lib ${LDFLAGS}"
export CXXFLAGS="-I$(brew --prefix bzip2)/include ${CPPFLAGS}"
export CPPFLAGS="-I$(brew --prefix bzip2)/include ${CPPFLAGS}"

export LDFLAGS="$(pkg-config --libs openssl) ${LDFLAGS}"
export CXXFLAGS="$(pkg-config --cflags openssl) ${CPPFLAGS}"
export CPPFLAGS="$(pkg-config --cflags openssl) ${CPPFLAGS}"

export LDFLAGS="$(pkg-config --libs readline) ${LDFLAGS}"
export CXXFLAGS="$(pkg-config --cflags readline) ${CPPFLAGS}"
export CPPFLAGS="$(pkg-config --cflags readline) ${CPPFLAGS}"

export LDFLAGS="$(pkg-config --libs protobuf) ${LDFLAGS}"
export CXXFLAGS="$(pkg-config --cflags protobuf) ${CPPFLAGS}"
export CPPFLAGS="$(pkg-config --cflags protobuf) ${CPPFLAGS}"

export LDFLAGS="$(pkg-config --libs x264) ${LDFLAGS}"
export CXXFLAGS="$(pkg-config --cflags x264) ${CPPFLAGS}"
export CPPFLAGS="$(pkg-config --cflags x264) ${CPPFLAGS}"

export LDFLAGS="$(pkg-config --libs tcl) ${LDFLAGS}"
export CXXFLAGS="$(pkg-config --cflags tcl) ${CPPFLAGS}"
export CPPFLAGS="$(pkg-config --cflags tcl) ${CPPFLAGS}"

export CONFIGURE_OPTS="--with-openssl-dir=${OPENSSL_ROOT_DIR}"
export PHP_BUILD_CONFIGURE_OPTS="--enable-shared --with-bz2=$(brew --prefix bzip2) --with-iconv=$(brew --prefix libiconv) --with-tidy=$(brew --prefix tidy-html5) --with-external-pcre=$(brew --prefix pcre2)"
export PYTHON_CONFIGURE_OPTS="--enable-shared"
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=${OPENSSL_ROOT_DIR}"

test -d "$(brew --prefix bzip2)/bin" && prepend2path $_
test -d "$(brew --prefix grep)/libexec/gnubin" && prepend2path $_
test -d "$(brew --prefix openssl@1.1)/bin" && prepend2path $_
test -d "$(brew --prefix qt@5)/bin" && prepend2path $_
# test -d "$(brew --prefix readline)/bin" && prepend2path $_

test -d "${LOCALOPT}/flutter/bin" && prepend2path $_
test -d "${GEM_HOME}/bin" && prepend2path $_
test -d "${GOPATH}/bin" && prepend2path $_

test -d "${LOCAL}/bin" && prepend2path $_
test -f "${LOCALOPT}/dotfiles/src/iterm2/iterm2_shell_integration.zsh" && . "$_"

HB_CNF_HANDLER="$(brew --repository)/Library/Taps/homebrew/homebrew-command-not-found/handler.sh"
test -f "${HB_CNF_HANDLER}" && . "${HB_CNF_HANDLER}"

if [ -d $ANYENV_ROOT ]; then
  prepend2path "${ANYENV_ROOT}/bin"
  eval "$(anyenv init -)"
  # test -e "${PYENV_ROOT}/plugins/pyenv-virtualenv/bin" && eval "$(pyenv virtualenv-init -)"

  export LUA_PREFIX="$(luaenv root)/versions/5.4.4"

  # PlatformIO Core completion support
  eval "$(_PIO_COMPLETE=zsh_source pyenv do --env platform-io pio)"
else
  gh repo clone anyenv/anyenv ${ANYENV_ROOT}
  gh repo clone anyenv/anyenv-update ${ANYENV_ROOT}/plugins/anyenv-update
fi

# export PATH="${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin:${PATH}"
