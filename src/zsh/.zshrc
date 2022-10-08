# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

declare -A ZINIT=(
  [ZCOMPDUMP_PATH]="${XDG_CACHE_HOME:-$HOME/.cache}/zcompdump"
  [COMPINIT_OPTS]='-C -d "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump-${ZSH_VERSION}"'
)

# module_path+=( "${HOME}/.local/share/zinit/module/Src" )
# zmodload zdharma_continuum/zinit

### Added by Zinit's installer
if [[ ! -f "${HOME}/.local/share/zinit/zinit.git/zinit.zsh" ]]; then
  print -P "%F{33}▓▒░ %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
  command mkdir -p "${HOME}/.local/share/zinit" && command chmod g-rwX "${HOME}/.local/share/zinit"
  command git clone https://github.com/zdharma-continuum/zinit "${HOME}/.local/share/zinit/zinit.git" && \
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
    print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "${HOME}/.local/share/zinit/zinit.git/zinit.zsh"

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
  zdharma-continuum/zinit-annex-as-monitor \
  zdharma-continuum/zinit-annex-bin-gem-node \
  zdharma-continuum/zinit-annex-patch-dl \
  zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

FPATH="${LOCAL}/share/zsh/site-functions:${FPATH}"

#  Completion
zinit lucid light-mode for \
  atinit"ZINIT[CONIINIT_OPTS]=-C;zicompinit -d ${XDG_CACHE_HOME}/zsh/zcompdump-${ZSH_VERSION}; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
  blockf \
    zsh-users/zsh-completions \
  atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions

# Customize completion
export ZSH_AUTOSUGGEST_STRATEGY=(completion)
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,underline"
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}'  # Case-insensitive
zstyle ':completion:*' cache-path ${XDG_CACHE_HOME}/zsh/zcompcache

# Enable p10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# zinit as'null' lucid sbin wait'1' for \
#   Fakerr/git-recall

# To customize prompt, run `p10k configure` or edit p10k.zsh
[[ ! -f "${LOCAL}/etc/zsh/p10k.zsh" ]] || source "${LOCAL}/etc/zsh/p10k.zsh"

bindkey '	' autosuggest-accept

# ***********************************************

export HISTFILE="${XDG_STATE_HOME}/zsh/history"
export HISTORY_IGNORE="(cd|pwd|l[sl])"

test -f "${LOCALOPT}/dotfiles/src/zsh/include.sh" && . $_

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

export CONFIGURE_OPTS="--with-openssl-dir=${OPENSSL_ROOT_DIR}"
export PHP_BUILD_CONFIGURE_OPTS="--enable-shared --with-bz2=$(brew --prefix bzip2) --with-iconv=$(brew --prefix libiconv) --with-tidy=$(brew --prefix tidy-html5) --with-external-pcre=$(brew --prefix pcre2)"
export PYTHON_CONFIGURE_OPTS="--enable-shared"
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=${OPENSSL_ROOT_DIR}"

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
fi

# export PATH="${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin:${PATH}"
