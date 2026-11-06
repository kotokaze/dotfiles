#!/usr/bin/env zsh

typeset -A _load_groups=(
  "wait light-mode "
    '
    zdharma-continuum/history-search-multi-word
    zsh-users/zsh-autosuggestions
    zsh-users/zsh-completions
    '

  "wait'0a' light-mode "
    '
    OMZP::common-aliases
    '

  "wait'0b' light-mode "
    '
    zdharma-continuum/zsh-diff-so-fancy
    OMZP::colored-man-pages
    OMZP::man
    '

  "wait'0c' light-mode "
    '
    zdharma-continuum/fast-syntax-highlighting
    '

  "wait'1' light-mode "
    '
    Fakerr/git-recall
    paulirish/git-open
    paulirish/git-recent
    tj/git-extra
    OMZP::git
    OMZP::git-lfs
    OMZP::gitignore
    OMZP::sudo
    '

  "wait'1a' light-mode "
    '
    OMZP::alias-finder
    OMZP::encode64
    OMZP::extract
    OMZP::eza
    OMZP::isodate
    '

  "wait'1b' light-mode "
    '
    rust-toolchain
    '

  "wait'!' light-mode "
    '
    romkatv/powerlevel10k
    zicompinit
    '
)

typeset -A _plugins=(
  ## @zdharma
  zdharma-continuum/fast-syntax-highlighting
    " "
  zdharma-continuum/history-search-multi-word
    "atinit'\
      zstyle :history-search-multi-word reset-prompt-protect 1 \
      zstyle :history-search-multi-word page-size 11 \
    '"
  zdharma-continuum/zsh-diff-so-fancy
    "null sbin'bin/{diff-so-fancy,git-dsf}' "

  ## @zsh-users
  zsh-users/zsh-autosuggestions
    "atload'! \
      _zsh_autosuggest_start \
      bindkey \"^I\" forward-word \
      bindkey \"^E\" autosuggest-accept \
    '"
  zsh-users/zsh-completions
    "blockf atpull'zinit creinstall -q .' "

  ## p10k theme
  romkatv/powerlevel10k
    "atload'. \${ZDOTDIR}/p10k.zsh; _p9k_precmd' nocd"

  ## Git extensions
  Fakerr/git-recall
    "null lbin'!' "
  paulirish/git-open
    "null lbin'!' "
  paulirish/git-recent
    "null lbin'!' "
  tj/git-extras
    "null make'PREFIX=\${ZPFX}' pick'\${ZPFX}/bin/git-*' src'etc/git-extras-completions.zsh' "

  ## Oh-My-Zsh
  OMZP::alias-finder
    "atload'\
      zstyle :omz:plugins:alias-finder autoload yes \
    '"
  OMZP::colored-man-pages
    " "
  OMZP::common-aliases
    "atload'unalias l la lt ll ldot lS lart lrt lsr zshrc' "
  OMZP::encode64
    " "
  OMZP::extract
    " "
  OMZP::eza
    "atload'!\
      zstyle :omz:plugins:eza git-status yes \
      zstyle :omz:plugins:eza header yes \
      zstyle :omz:plugins:eza icons yes \
      zstyle :omz:plugins:eza size-prefix binary \
      zstyle :omz:plugins:eza time-style long-iso \
      zstyle :omz:plugins:eza hyperlink yes \
    '"
  OMZP::git
    " "
  OMZP::git-lfs
    " "
  OMZP::gitignore
    " "
  OMZP::isodate
    " "
  OMZP::man
    " "
  OMZP::sudo
    " "

  ## misc
  rust-toolchain
    "as'program' \
      teleid'zdharma-continuum/null' \
      rustup pick'bin/*' \
      atload='export CARGO_HOME=\${PWD} RUSTUP_HOME=\${PWD}/rustup' \
    "

  zicompinit
    "as'null' \
    teleid'zdharma-continuum/null' \
    atload'zicompinit; zicdreplay' \
    "
)

for modifiers in ${(kn)_load_groups}; do
  local targets=()

  for p in ${=_load_groups[${modifiers}]}; do
    [[ "${p}" =~ ^#.*$ ]] && continue
    (( ${+_plugins[${p}]} )) || continue

    targets+=("${_plugins[${p}]}" "${p}")
  done

  (( ${#targets} )) || continue
  eval "zinit ${modifiers} lucid for ${targets[*]}"
done
