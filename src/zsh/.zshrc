# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

declare -A ZINIT=(
  [ZCOMPDUMP_PATH]="${XDG_CACHE_HOME:-$HOME/.cache}/zcompdump"
  [COMPINIT_OPTS]='-C -d "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump-${ZSH_VERSION}"'
)

# module_path+=( "${XDG_DATA_HOME}/zinit/module/Src" )
# zmodload zdharma_continuum/zinit

### Added by Zinit's installer
if [[ ! -f "${XDG_DATA_HOME}/zinit/zinit.git/zinit.zsh" ]]; then
  print -P "%F{33}▓▒░ %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
  command mkdir -p "${XDG_DATA_HOME}/zinit" && command chmod g-rwX "${XDG_DATA_HOME}/zinit"
  command git clone https://github.com/zdharma-continuum/zinit "${XDG_DATA_HOME}/zinit/zinit.git" && \
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
    print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "${XDG_DATA_HOME}/zinit/zinit.git/zinit.zsh"

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
[[ ! -f "${XDG_CONFIG_HOME}/zsh/p10k.zsh" ]] || source "${XDG_CONFIG_HOME}/zsh/p10k.zsh"

bindkey '	' autosuggest-accept

# ***********************************************

export HISTFILE="${XDG_STATE_HOME}/zsh/history"
export HISTORY_IGNORE="(cd|pwd|l[sl])"

. ${ZDOTDIR}/setup.sh
