# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

### Custom functions to make configuration less verbose
# Inspired by https://github.com/ri7nz/.dotifiles/blob/f0d705a1bfbe79ead4008303c5f180ea1152334a/.config/zsh/zshrc.zsh#L55-L62

# zt() : First argument is a wait time and suffix, i.e. "0a".
# Anything that doesn't match will be passed through as if it were an ice mod.
# The default ices are depth'3' and lucid
zt() { zinit depth'3' lucid ${1/#[0-9][a-c]/wait"$1"} "${@:2}"; }

### Manually-added custom plugins

##################
# Initial Prompt #
##################

# Load Powerlevel10k
# https://github.com/romkatv/powerlevel10k#zinit
zt light-mode for \
    atload'!source "$HOME/.p10k.zsh"' \
        romkatv/powerlevel10k

###########
# Annexes #
###########

# Load Git library and plugin from OMZ
# https://zdharma.github.io/zinit/wiki/Example-Oh-My-Zsh-setup/#using_turbo_mode_and_for-syntax
# Load zsh-z
# https://github.com/agkozak/zsh-z#for-zinit-formerly-zplugin-users
zt for \
        OMZL::git.zsh \
  atload"unalias grv" \
        OMZP::git \
        agkozak/zsh-z \
        cowboyd/zsh-volta

##################
# Wait'0a' block #
##################

# Load zsh-autosuggestions
# Heavily inspired by https://github.com/ri7nz/.dotifiles/blob/f0d705a1bfbe79ead4008303c5f180ea1152334a/.config/zsh/zshrc.zsh#L110-L121
zt 0a light-mode for \
        OMZL::completion.zsh \
    as'completion' mv'*.zsh -> _git' \
        felipec/git-completion \
    compile'{src/*.zsh,src/strategies/*}' pick'zsh-autosuggestions.zsh' \
    atload'_zsh_autosuggest_start' \
        zsh-users/zsh-autosuggestions

##################
# Wait'0b' block #
##################

# Load fast-syntax-highlighting
zt 0b light-mode for \
    atinit'zicompinit; zicdreplay' atload'FAST_HIGHLIGHT[chroma-man]=' \
        zdharma/fast-syntax-highlighting

##################
# Wait'0c' block #
##################

# Load zsh-diff-so-fancy
# https://github.com/zdharma/zinit/blob/master/README.md#extending-git
# https://github.com/zdharma/zsh-diff-so-fancy
zt 0c light-mode as'null' for \
    sbin"bin/git-dsf;bin/diff-so-fancy" \
      zdharma/zsh-diff-so-fancy \

### End of manually-added custom plugins

# User configuration

source ~/.personal.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
